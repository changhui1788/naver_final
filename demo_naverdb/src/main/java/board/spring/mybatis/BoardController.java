package board.spring.mybatis;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	@Qualifier("boardServiceImpl")
	BoardServiceImpl service;
	
	@RequestMapping("/")
	String start() {
		return "board/start";
	}
	
	@GetMapping("/boardwrite")
	String boardform() {
		return "board/boardform";
	}
	
	@PostMapping("/boardwrite")
	ModelAndView boardwrite(BoardDTO dto, HttpSession session){
		
		dto.setWriter((String) session.getAttribute("sessionid"));
		int result = service.registerBoard(dto);
		
		ModelAndView mv = new ModelAndView();
		
		if(result > 0) {
			mv.addObject("result", "글이 성공적으로 저장되었습니다.");
		} else {
			mv.addObject("result", "글이 저장되지 않았습니다.");
		}
		
		mv.setViewName("board/start");
		
		return mv;
	}
	
	@RequestMapping("/boardlist")
	ModelAndView pagingBoardList(@RequestParam(value = "pagenum", required = false, defaultValue = "1") int pagenum) {
		
		int pagecount = 3;
		int[] limit = new int[2];
		limit[0] = (pagenum - 1) * pagecount;
		limit[1] = pagecount;
		
		List<BoardDTO> list = service.pagingBoardList(limit);
		int total = service.getTotalBoard();
		
		ModelAndView mv = new ModelAndView();

		mv.addObject("pagingboardlist", list);
		mv.addObject("totalcount", total);
		mv.addObject("pagecount", pagecount);
		
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@RequestMapping("/boarddetail")
	ModelAndView boardDetail(int seq) {
		service.increaseViewCount(seq);
		BoardDTO board = service.oneBoard(seq);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("board", board);
		mv.setViewName("board/detail");
		
		return mv;
	}
	
	@RequestMapping("/updateform")
	ModelAndView updateform(int seq) {
		BoardDTO board = service.oneBoard(seq);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("board", board);
		mv.setViewName("board/updateform");
		
		return mv;
	}
	
	@RequestMapping("/boardupdate")
	String boardUpdate(BoardDTO dto) {
		service.updateBoard(dto);
		return "redirect:/boardlist";
	}
	
	@RequestMapping("/boarddelete")
	String boardDelete(int seq) {
		service.deleteBoard(seq);
		return "redirect:/boardlist";
	}
	
	@GetMapping("/boardsearchlist")
	public ModelAndView boardSearchList(String item, String word) {
		List<BoardDTO> list = null;
		
		word = "%" + word + "%";
		
		if(item.equals("title")) {
			list = service.titleBoardSearchList(word);
		} else if(item.equals("contents")) {
			list = service.contentsBoardSearchList(word);
		} else if(item.equals("writer")) {
			list = service.writerBoardSearchList(word);
		} else if(item.equals("all")) {
			list = service.allBoardSearchList(word);
		} else {
			
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("searchlist", list);
		mv.setViewName("board/searchlist");
		
		return mv;
	}
	
}

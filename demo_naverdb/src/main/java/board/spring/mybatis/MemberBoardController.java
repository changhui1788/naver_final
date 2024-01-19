package board.spring.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberBoardController {
	@Autowired
	@Qualifier("memberServiceImpl")
	MemberServiceImpl service;
	
	@GetMapping("/boardlogin")
	public String loginForm() {
		return "board/loginform";
	}
	
	@PostMapping("/boardlogin")
	public ModelAndView loginVerification(String memberid, String pw, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		MemberDTO dto = new MemberDTO();
		
		dto.setMemberid(memberid);
		dto.setPw(pw);
		
		String result = service.memberVerification(dto);
		
		if(result.equals("errorid")) {
			mv.addObject("result", "존재하지 않는 아이디 입니다.");
			mv.setViewName("board/loginform");
		} else if (result.equals("errorpw")) {
			mv.addObject("result", "잘못된 암호 입니다.");
			mv.setViewName("board/loginform");
		} else {
			session.setAttribute("sessionid", result);
			mv.setViewName("board/start");
		}
		
		return mv;
	}
	
	@RequestMapping("/boardlogout")
	public String logout(HttpSession session) {
		
		if(session.getAttribute("sessionid") != null) {
			session.removeAttribute("sessionid");
		}
		
		return "board/start";
	}
	
	@GetMapping("/getwriter/{writer}")
	@ResponseBody
	public MemberDTO getWriter(@PathVariable("writer") String memberid) {
		MemberDTO dto = service.oneMember(memberid);
		
		return dto;
	}
	
}

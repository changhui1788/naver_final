package board.spring.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public int registerBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
		return boardDAO.insertBoard(dto);
	}

	@Override
	public List<BoardDTO> pagingBoardList(int[] limit) {
		// TODO Auto-generated method stub
		return boardDAO.pagingBoardList(limit);
	}

	@Override
	public int getTotalBoard() {
		// TODO Auto-generated method stub
		return boardDAO.getTotalBoard();
	}

	public int increaseViewCount(int seq) {
		// TODO Auto-generated method stub
		return boardDAO.increaseViewCount(seq);
	}

	public BoardDTO oneBoard(int seq) {
		// TODO Auto-generated method stub
		return boardDAO.oneBoard(seq);
	}

	public int deleteBoard(int seq) {
		// TODO Auto-generated method stub
		return boardDAO.deleteBoard(seq);
	}

	public int updateBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
		return boardDAO.updateBoard(dto);
	}

	public List<BoardDTO> titleBoardSearchList(String word) {
		// TODO Auto-generated method stub
		return boardDAO.titleBoardSearchList(word);
	}

	public List<BoardDTO> contentsBoardSearchList(String word) {
		// TODO Auto-generated method stub
		return boardDAO.contentsBoardSearchList(word);
	}

	public List<BoardDTO> writerBoardSearchList(String word) {
		// TODO Auto-generated method stub
		return boardDAO.writerBoardSearchList(word);
	}

	public List<BoardDTO> allBoardSearchList(String word) {
		// TODO Auto-generated method stub
		return boardDAO.allBoardSearchList(word);
	}

}

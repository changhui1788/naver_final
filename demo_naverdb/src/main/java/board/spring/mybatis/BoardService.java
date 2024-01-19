package board.spring.mybatis;

import java.util.List;

public interface BoardService {
	int registerBoard(BoardDTO dto);
	List<BoardDTO> pagingBoardList(int[] limit);
	int getTotalBoard();
}

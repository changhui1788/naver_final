package board.spring.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface BoardDAO {

	public int insertBoard(BoardDTO dto);
	
	public List<BoardDTO> pagingBoardList(int[] limit);
	
	public int getTotalBoard();

	public int increaseViewCount(int seq);

	public BoardDTO oneBoard(int seq);

	public int deleteBoard(int seq);

	public int updateBoard(BoardDTO dto);

	public List<BoardDTO> titleBoardSearchList(String word);

	public List<BoardDTO> contentsBoardSearchList(String word);

	public List<BoardDTO> writerBoardSearchList(String word);

	public List<BoardDTO> allBoardSearchList(String word);
	
}

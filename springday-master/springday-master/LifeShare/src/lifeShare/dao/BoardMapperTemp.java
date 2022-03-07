package lifeShare.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import lifeShare.dto.Board;
import lifeShare.dto.Pagination;

@Mapper
public interface BoardMapperTemp {

	public Board getBoard(int i); // 아이디의 게시글 찾아오기

	public Map<String,Object> getImage(int i);
	
	public List<Board> getBoards(Pagination pagination); // 게시글 모두 가져오기

	public void deleteBoard(Board board);// 게시글 삭제하기

	public void addBoard(Board board); // 게시글 추가하기

	public void updateBoard(@Param("board") Board board, @Param("img") byte[] img);// 게시글 업데이트

	//상태 변화
	public void switchToComplete(int bid);
	
	public void switchToIncomplete(int bid);

	public void switchToReserved(int bid);
	
	//레벨
	public void addLevel(String id);
}

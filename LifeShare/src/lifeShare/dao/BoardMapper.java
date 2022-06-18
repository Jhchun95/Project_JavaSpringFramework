package lifeShare.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import lifeShare.dto.Board;
import lifeShare.dto.CategoryOrder;
import lifeShare.dto.Pagination;

@Mapper
public interface BoardMapper {

	public Board getBoard(int bid); // 아이디의 게시글 찾아오기

	public List<Board> getBoards(CategoryOrder categoryOrder); // 게시글 모두 가져오기

	public void deleteBoard(Board board);// 게시글 삭제하기

	public void addBoard(@Param("board") Board board, @Param("img") byte[] img); // 게시글 추가하기

	public void updateBoard(Board board);// 게시글 업데이트

	/*
	 * public Map<String,Object> getByteImage(); //이미지 가져오기
	 */
	public List<Board> getBoardsMain();
	public List<Board> getBoardsLikesMain();
	public int getBoardListCnt(CategoryOrder categoryOrder);
	public List<Board> myBoard(String id);

	public void searchBoard(Board board); // 검색
	
	public void updateViews(int bid);
	
	public String getLevel(String id) ;
}

package lifeShare.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lifeShare.dao.BoardMapper;
import lifeShare.dto.Board;
import lifeShare.dto.CategoryOrder;
import lifeShare.dto.Pagination;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	public void addBoard(Board board, byte[] hmap) {	
		boardMapper.addBoard(board, hmap);
	}
	
	public List<Board> getBoards(CategoryOrder categoryOrder){
		return boardMapper.getBoards(categoryOrder);
	}
	public List<Board> getBoardsMain(){
		return boardMapper.getBoardsMain();
	}
	
	public Board getBoard(int bid) {
		return boardMapper.getBoard(bid);
	}
	
	public void updateBoard(Board board) {
		boardMapper.updateBoard(board);
	}
	
	public List<Board> getBoardsLikesMain(){
		return boardMapper.getBoardsLikesMain();
	}
	
	public int getBoardListCnt(CategoryOrder categoryOrder) {
		return boardMapper.getBoardListCnt(categoryOrder);
	}
	public List<Board> myBoard(String id) {
		return boardMapper.myBoard(id);
	}
	
	public void searchBoard(Board board) {
		boardMapper.searchBoard(board);
	}
	
	public void updateViews(int bid) {
		boardMapper.updateViews(bid);
	}
	
	public String getLevel(String id) {
		return boardMapper.getLevel(id);
	}
}

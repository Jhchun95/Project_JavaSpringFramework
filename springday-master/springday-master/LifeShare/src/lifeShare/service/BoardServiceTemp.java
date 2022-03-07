package lifeShare.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lifeShare.dao.BoardMapperTemp;
import lifeShare.dto.Board;

@Service
public class BoardServiceTemp {

	@Autowired
	private BoardMapperTemp boardMapper;
	
	public void addBoard(Board board) {	
		boardMapper.addBoard(board);
	}
	
	public Board getBoard(int id) {
		return boardMapper.getBoard(id);
	}
	
	public Map<String,Object> getImage(int i){
		return boardMapper.getImage(i);
	}

	public void switchState(String state, int bid) {
		if(state.equals("완료")){
			//완료로 바꿔주기 
			boardMapper.switchToComplete(bid);
		}else if(state.equals("미완료")) {
			//미완료로 바꿔주기
			boardMapper.switchToIncomplete(bid);
		}else {
			//예약중으로 바꿔주기 
			boardMapper.switchToReserved(bid);
		}
	}
	public void addLevel(String id) {
		boardMapper.addLevel(id);
	}
		
}
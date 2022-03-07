package lifeShare.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lifeShare.dao.LikesMapper;


@Service
public class LikesService {
	@Autowired
	private LikesMapper likesMapper;
	
	public void addLike(String uid, int bid) {
	//uid,bid가 있는지 없는 찾는다. (좋아요가 테이블에 있는지 찾는다)  
	System.out.println("1");
	System.out.println(uid+bid);
	if(likesMapper.findLike(uid, bid) == 0) {
		//uid,bid가있는 행이 없으면 인서트 
		likesMapper.addLike(uid, bid );
	}else {
		//uid,bid가있는 행이 있으면 딜리트 
		likesMapper.deleteLike(uid, bid);
	}
	likesMapper.updateLike(bid);
	}

}

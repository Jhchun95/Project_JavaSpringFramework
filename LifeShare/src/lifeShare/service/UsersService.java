package lifeShare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import lifeShare.dao.UsersMapper;
import lifeShare.dto.Users;

@Service
public class UsersService {

	@Autowired
	private UsersMapper usersMapper;
	
	public Users getUser(String id) {
		return usersMapper.getUser(id);
	}
	public void updateUser(Users users) {
		usersMapper.updateUser(users);
	}
	
	public int addUsers(Users users) {
		return usersMapper.addUsers(users);
	}
	
	public Users login(Users users) throws Exception {
		return usersMapper.login(users);
	}

}

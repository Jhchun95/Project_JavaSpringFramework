package lifeShare.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import lifeShare.dto.Users;

@Mapper
public interface UsersMapper {
	public Users getUser(String id);
	public void updateUser(Users users);
	
	/** 회원가입 **/
	public int addUsers(Users users);
	/** 로그인 **/
	public Users login(Users users) throws Exception;
	


}

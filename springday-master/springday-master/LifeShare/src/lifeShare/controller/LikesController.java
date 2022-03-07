package lifeShare.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lifeShare.dao.LikesMapper;
import lifeShare.dao.UsersMapper;
import lifeShare.dto.Likes;
import lifeShare.dto.Users;
import lifeShare.service.LikesService;

@Controller 
@RequestMapping(path = "/likes" )
public class LikesController {
	
	@Autowired
	private LikesService likseService; 
	
	@GetMapping("/{uid}/{bid}")
	public String addLike(@PathVariable(name ="uid") String uid, @PathVariable(name = "bid") int bid) {
		likseService.addLike(uid,bid);
		return "redirect:/board/bid/{bid}";
	}
	
	
}

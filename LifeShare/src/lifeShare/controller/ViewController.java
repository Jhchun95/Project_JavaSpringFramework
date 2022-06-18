package lifeShare.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import lifeShare.dto.Users;

import lifeShare.dto.Board;
import lifeShare.service.BoardService;



@Controller 
@RequestMapping(path = "/" )
public class ViewController {	
		
		@Autowired
		private BoardService boardService;
	
		//메인 페이지 
		@GetMapping
		public String main(ModelMap model) {
			List<Board> list_likes = boardService.getBoardsLikesMain();
			List<Board> list = boardService.getBoardsMain();
			model.addAttribute("list_likes" , list_likes);
			model.addAttribute("list" , list);
			return "index";
		}
		//메인 페이지 
		@GetMapping("/home")
		public String home() {
			return "index";
		}
		//로그인 페이지 
		@GetMapping("/login")
		public String login(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
			HttpSession session = request.getSession();
			if(session.getAttribute("msg")!=null)
			session.removeAttribute("msg");
			return "login";
		}
		//회원가입 페이지 
		@GetMapping("/join")
		public String join() {
			return "join";
		}
		
		
}


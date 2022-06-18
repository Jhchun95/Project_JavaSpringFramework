package lifeShare.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.mbeans.UserMBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lifeShare.dao.UsersMapper;
import lifeShare.dto.Board;
import lifeShare.dto.Message;
import lifeShare.dto.Users;
import lifeShare.service.BoardService;
import lifeShare.service.MessageService;
import lifeShare.service.UsersService;

@Controller

public class UsersController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private BoardService boardService;
	@Autowired MessageService messageService;
//	@GetMapping
//	public String home() {
//		return "index";
//	}

	@PostMapping("/userLogin")
	public String login(@ModelAttribute Users users, HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		HttpSession session = request.getSession(); 
		String id = users.getId();
		String pw = users.getPassword();
		Users User = usersService.getUser(id);
		int isOpen = messageService.openCount(id);
//		//로그인 정보가있는데 로그인페이지로 이동하려 할 떄 
//		if(session.getAttribute("loginOK")!= null) {
//			return "index";
//		}
		//회원정보가 없을 때
		if(User == null) {
			session.setAttribute("msg", " 아이디를 다시 확인해주세요.");
			return "login";
		}
		//로그인 성공 
		else if(User != null && User.getPassword().equals(pw)) {
			if(session.getAttribute("msg")!= null) {
				session.removeAttribute("msg");
			}
			session.setAttribute("isOpen", isOpen);
			System.out.println("@@@@@@@@@"+session.getAttribute("isOpen"));
			session.setAttribute("loginOK",User);
			
			return "redirect:/";
		}
	
		session.setAttribute("msg", "비밀번호가 틀립니다.");
		return "login";
	
	}
	@GetMapping("/logout")
	public String LogOut( HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		session.removeAttribute("loginOK");
		return "login";
	}
	@PostMapping("/userJoin")
	public String join(Users users)  {
		usersService.addUsers(users);
		return "login";
	}

	@GetMapping("/mypage={id}")
	public String getUser(@PathVariable(name = "id") String id, ModelMap model) {
		Users users = usersService.getUser(id);
		List<Board> board = boardService.myBoard(id); // user id에해당하는 board List를 받아와서 뿌려줘야함
		model.addAttribute("users", users);
		model.addAttribute("boards", board);
		return "mypage";
	}
	//留덉씠�럹�씠吏� �쉶�썝�젙蹂� �닔�젙(�떒�닚 �럹�씠吏� �씠�룞)
	@GetMapping("/modify={id}")
	public String modify(@PathVariable(name = "id") String id, ModelMap model) {
		Users users = usersService.getUser(id);
		model.addAttribute("users", users);
		return "modify";
	}
	//留덉씠�럹�씠吏� �쉶�썝�젙蹂� �닔�젙 �셿猷� �썑 留덉씠�럹�씠吏�濡� �씠�룞
	@PostMapping("/update")
	public String updateUser(@ModelAttribute Users users, HttpServletRequest request) {
		usersService.updateUser(users);
		return "mypage";
	}

}

package lifeShare.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lifeShare.dto.Message;
import lifeShare.service.MessageService;

@Controller 
@RequestMapping(path = "/message" )
public class MessageController {
	@Autowired
	private MessageService messageService;
	
	@GetMapping("/newMessageForm/{receiver}")
	public String newMessageForm(@PathVariable(name="receiver") String receiver, ModelMap model) {
		model.addAttribute("receiver", receiver);
		return "message/newMessageForm";
	}
	
	@PostMapping("/sendMessage")
	public String sendMessage(@ModelAttribute Message message, HttpServletRequest request) {
		System.out.println(message);
		messageService.addMessage(message);
		return "redirect:/message/" + message.getSender();
	}
	
	@GetMapping("/{receiver}")
	public String getMyMessage(@PathVariable(name="receiver") String receiver, ModelMap model) {
		List<Message> myMessage = messageService.getMyMessage(receiver);
		model.addAttribute("myMessage", myMessage);
		return "message/myMessage";
	}
	
	@GetMapping("/{receiver}/{sender}/{mid}")
	public String getMyMessageList(@PathVariable(name="receiver") String receiver, @PathVariable(name="sender") String sender, @PathVariable(name="mid") int mid, ModelMap model,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		List<Message> myMessageList = messageService.getMyMessageList(receiver, sender);
		messageService.openMessage(receiver, sender);
		model.addAttribute("myMessageList", myMessageList);
		model.addAttribute("yourid", sender);
		model.addAttribute("myid", receiver);
		
		HttpSession session = request.getSession(); 
		int isOpen = messageService.openCount(receiver);
		session.setAttribute("isOpen", isOpen);
		System.out.println(isOpen);
		System.out.println(session.getAttribute("isOpen"));
		return "message/myMessageList";
	}
	
	@GetMapping("/delete")
	public String deleteMessage(String id, String sender) {
		messageService.deleteMessage(id, sender);
		return "redirect:/message";
	}

	
}

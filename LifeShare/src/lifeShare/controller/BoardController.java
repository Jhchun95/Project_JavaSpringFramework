package lifeShare.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lifeShare.dto.Board;
import lifeShare.dto.CategoryOrder;
import lifeShare.dto.Pagination;
import lifeShare.dto.Users;
import lifeShare.service.BoardService;

@Controller 
@RequestMapping(path = "/board" )
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/form")
	public String boardform() {
		return "boardform";
	}
	
	@RequestMapping(value="/upload")
	public String uploadBoard(@ModelAttribute Board board) {
		try {
			byte[] img = board.getImgFile().getBytes();
			boardService.addBoard(board, img);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board";
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(ModelMap model, @RequestParam(required = false, defaultValue = "") String order, @RequestParam(required = false, defaultValue = "") String category, 
			@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range, 
			@RequestParam(required = false, defaultValue = "") String keyword, @ModelAttribute("categoryOrder") CategoryOrder categoryOrder) {

		categoryOrder.setCategory(category);
		categoryOrder.setOrder(order);
		categoryOrder.setKeyword(keyword);
		
		int listCnt = boardService.getBoardListCnt(categoryOrder);
		categoryOrder.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", categoryOrder);
		List<Board> boards = boardService.getBoards(categoryOrder);
		model.addAttribute("boards", boards);
		
		return "boardlist";
	}
	

	
//	@GetMapping(value="/searchBoard")
	public String search(Board board) {
//		if(board.getLoc() != null) board.setLoc("%구");
//		if(board.getLoc2() != null) board.setLoc2("%시");		
//		map.addAttribute("", BoardService.get)
		return "index";
	}
	@GetMapping("/bid/{bid}")
	public String boardDetail(@PathVariable int bid,ModelMap map) {
		
		Board board = boardService.getBoard(bid);
		String id = board.getUid();
		String level = boardService.getLevel(id);
		map.addAttribute("board", board);
		map.addAttribute("level",level);
		return "board";
	}
	@GetMapping("/modify/{bid}")
	public String boardModify(@PathVariable int bid,ModelMap map) {
		Board board = boardService.getBoard(bid);
		map.addAttribute("board", board);
		return "boardModify";
	}
	
	@PostMapping("/update")
	public String updateBoard(@ModelAttribute Board board,byte[] img) {
		System.out.println(board);
		board.setImg(img);
		boardService.updateBoard(board);
		return "board";
	}
	
}

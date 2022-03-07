package lifeShare.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lifeShare.dto.Board;
import lifeShare.dto.Pagination;
import lifeShare.dto.Users;
import lifeShare.service.BoardService;
import lifeShare.service.BoardServiceTemp;

@Controller
@RequestMapping(path = "/board")
public class BoardTemp {

	@Autowired
	private BoardServiceTemp boardService;

	// 게시물 업로드하기
	@RequestMapping(value = "/uploads")
	public String uploadBoard(@ModelAttribute Board board, MultipartHttpServletRequest req, HttpServletRequest request) {

		MultipartFile file = board.getImgFile();
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("loginOK");
		String uid= user.getId();
		if(uid==null)
			return "redirect:/board";
		else
			board.setUid(uid); //uid 넣기 
		System.out.println(board);
		byte[] img=null;
		if (!file.getOriginalFilename().isEmpty()) {
			try {
				img = board.getImgFile().getBytes();
				board.setImg(img);//이미지 넣기 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		boardService.addBoard(board);
		return "redirect:/board";
	}

	// bid를 받으면 해당 리스트가 뿌려질 수 있게 !
	@RequestMapping(value = "/show/img/{num}")
	public ResponseEntity<byte[]> ImageView(@PathVariable("num") int num)
	{
		System.out.println("/show/img/{num} url 들어옴. ");
		Map<String,Object> map = boardService.getImage(num);
		byte[] imagefile=null;
		if(map!=null){
			imagefile = (byte[]) map.get("IMG");
			System.out.println(imagefile);
			System.out.println("이미지 존재 ");
		}
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imagefile, headers,HttpStatus.OK);
	}

	@GetMapping(value = "/show/{num}")
	public String getDetail(@PathVariable("num") int num, ModelMap model) {
		Board board = boardService.getBoard(num);
		model.addAttribute("board", board);
		return "board"; //boardshow 
	}
	
	@RequestMapping(value="/tocomplete/{id}/{uid}")
	public String switchState(@PathVariable("id")int id, @PathVariable("uid")String userId) {
		//버튼 누르면 완료 <-> 미완료 수정하기 
		boardService.switchState("완료", id);
		//레벨은 jsp에서 보여준다. 
		//0~1 : 씨앗, 2~4: 새싹, 5~7:식물, 8~10: 나무, 10~: 숲
		//레벨 추가하기 
		boardService.addLevel(userId);
		return "redirect:/mypage="+userId;
	}
	@RequestMapping(value="/toincomplete/{id}/{uid}")
	public String switchState2(@PathVariable("id")int id, @PathVariable("uid")String userId) {
		//버튼 누르면 완료 <-> 미완료 수정하기 
		boardService.switchState("미완료", id);
		return "redirect:/mypage="+userId;
	}
	@RequestMapping(value="/toreserved/{id}/{uid}")
	public String switchState3(@PathVariable("id")int id, @PathVariable("uid")String userId) {
		//버튼 누르면 완료 <-> 미완료 수정하기 
		boardService.switchState("예약중", id);
		return "redirect:/mypage="+userId;
	}


}

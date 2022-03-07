package lifeShare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lifeShare.dao.MessageMapper;
import lifeShare.dto.Message;

@Service
public class MessageService {
	@Autowired
	private MessageMapper messageMapper;
	
	public List<Message> getMyMessage(String receiver){
		return messageMapper.getMyMessage(receiver);
	}
	
	public List<Message> getMyMessageList(String receiver, String sender){
		return messageMapper.getMyMessageList(receiver, sender);
	}
	
	public void addMessage(Message message) {
		messageMapper.addMessage(message);
	}
	
	public void deleteMessage(String receiver, String sender) {
		messageMapper.deleteMessage(receiver, sender);
	}
	
	public void openMessage(String receiver, String sender) {
		messageMapper.openMessage(receiver, sender);
	}
	public int openCount(String uid) {
		return messageMapper.openCount(uid);
	}
}

package lifeShare.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import lifeShare.dto.Message;

@Mapper
public interface MessageMapper {
	public List<Message> getMyMessage(String receiver);
	public List<Message> getMyMessageList(String receiver, String sender);
	public void addMessage(Message message);
	public void deleteMessage(String receiver, String sender);
	public void openMessage(String receiver, String sender);
	public int openCount(String uid);
}

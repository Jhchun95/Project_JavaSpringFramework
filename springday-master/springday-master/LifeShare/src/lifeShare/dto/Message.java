package lifeShare.dto;

import java.util.Date;

public class Message {
	private int mid;
	private String sender;
	private String receiver;
	private String message;
	private int is_open;
	private Date send_date;

	
	
	public Message() {
		super();
	}

	public Message(int mid, String sender, String receiver, String message, int is_open, Date send_date) {
		super();
		this.mid = mid;
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
		this.is_open = is_open;
		this.send_date = send_date;
	}
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getIs_open() {
		return is_open;
	}
	public void setIs_open(int is_open) {
		this.is_open = is_open;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	
	@Override
	public String toString() {
		return "Message [mid=" + mid + ", sender=" + sender + ", receiver=" + receiver + ", message=" + message
				+ ", is_open=" + is_open + ", send_date=" + send_date + "]";
	}

}

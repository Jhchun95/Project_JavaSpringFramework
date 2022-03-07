package lifeShare.dto;

public class Likes {

	private int bid;
	private String uid;
	
	public Likes() {
		
	}

	public Likes(int bid, String uid) {
		super();
		this.bid = bid;
		this.uid = uid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "Likes [bid=" + bid + ", uid=" + uid + "]";
	}
	
	

}
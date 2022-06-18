package lifeShare.dto;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;


public class Board {

	private int bid; 
	private String uid;
	private String title;
	private String state;
	private String btype;
	private String category;
	private String loc;
	private String loc2;
	private String content;
	private int likes;
	private int views;
	private MultipartFile imgFile;
	private Date time_of_upload;
	private byte[] img;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
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
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getLoc2() {
		return loc2;
	}
	public void setLoc2(String loc2) {
		this.loc2 = loc2;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public MultipartFile getImgFile() {
		return imgFile;
	}
	public void setImgFile(MultipartFile image) {
		this.imgFile = image;
	}
	public Date getTime_of_upload() {
		return time_of_upload;
	}
	public void setTime_of_upload(Date time_of_upload) {
		this.time_of_upload = time_of_upload;
	}
	
	@Override
	public String toString() {
		return "Board [bid=" + bid + ", uid=" + uid + ", title=" + title + ", state=" + state + ", btype=" + btype
				+ ", category=" + category + ", loc=" + loc + ", loc2=" + loc2 + ", content=" + content + ", likes="
				+ likes + ", views=" + views + ", imgFile=" + imgFile + ", time_of_upload=" + time_of_upload + ", img="
				+ Arrays.toString(img) + "]";
	}
	public byte[] getImg() {
		return img;
	}
	public void setImg(byte[] img) {
		this.img = img;
	}
	
	
	
}

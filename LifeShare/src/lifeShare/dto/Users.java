package lifeShare.dto;

public class Users {
	private String id;
	private String password;
	private String phone;
	private String name;
	private int level;
	
	public Users() {
		
	}
	public Users(String id, String password, String phone, String name, int level) {
		super();
		this.id = id;
		this.password = password;
		this.phone = phone;
		this.name = name;
		this.level = level;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", password=" + password + ", phone=" + phone + ", name=" + name + ", level=" + level
				+ "]";
	}
	
	
	
}

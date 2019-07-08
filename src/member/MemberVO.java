package member;

public class MemberVO {
	private int id_no;
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String gender;
	private int age;
	private String phone;
	private String email;
	
	
	public MemberVO() {
		super();
	}
	
	public MemberVO(int id_no, String id, String pw, String name, String nickname, String gender, int age,
			String phone, String email) {
		super();
		this.id_no = id_no;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.email = email;
	}
	public int getId_no() {
		return id_no;
	}
	public void setId_no(int id_no) {
		this.id_no = id_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

	
	
	
	
	
	
}

package review;

public class ReviewVO {
	private int r_id;	//자동 입력
	private String nickname;
	private String r_content;
	private String day;	//자동입력
	private String game_name;
	private int rating;
	
	
	public ReviewVO() {
		super();
	}


	public ReviewVO(int r_id, String nickname, String r_content, String day, String game_name, int rating) {
		super();
		this.r_id = r_id;
		this.nickname = nickname;
		this.r_content = r_content;
		this.day = day;
		this.game_name = game_name;
		this.rating = rating;
	}


	public int getR_id() {
		return r_id;
	}


	public void setR_id(int r_id) {
		this.r_id = r_id;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getR_content() {
		return r_content;
	}


	public void setR_content(String r_content) {
		this.r_content = r_content;
	}


	public String getDay() {
		return day;
	}


	public void setDay(String day) {
		this.day = day;
	}


	public String getGame_name() {
		return game_name;
	}


	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}


	public int getRating() {
		return rating;
	}


	public void setRating(int rating) {
		this.rating = rating;
	}


}

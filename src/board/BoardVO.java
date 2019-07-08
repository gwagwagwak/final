package board;

public class BoardVO {
	private int b_id;
	private String title;
	private String content;
	private String nickname;
	private String day;
	private int hits;
	private String comment;
	private String b_type;
	private String game_name;
	
	public BoardVO() {
		super();
	}
	
	
	public BoardVO(int b_id, String title, String content, String nickname, String day, int hits, String comment,
			String b_type, String game_name) {
		super();
		this.b_id = b_id;
		this.title = title;
		this.content = content;
		this.nickname = nickname;
		this.day = day;
		this.hits = hits;
		this.comment = comment;
		this.b_type = b_type;
		this.game_name = game_name;
	}
	
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getB_type() {
		return b_type;
	}
	public void setB_type(String b_type) {
		this.b_type = b_type;
	}
	public String getGame_name() {
		return game_name;
	}
	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}
	
	
	
	
}

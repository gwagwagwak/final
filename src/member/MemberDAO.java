package member;

import dbconn.DBconn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*import com.sun.java.util.jar.pack.Package.Class.Member;*/

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//DB 연결
	public MemberDAO() throws ClassNotFoundException, SQLException {
		con = new DBconn().getConnection();
	}
	
	
	public void pstmtClose() throws SQLException {
		if(pstmt != null) {
			pstmt.close();
		}
	}
	
	public int checkPw(String id, String pw) throws SQLException{
		String sql ="select pw from member where id=?";
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next())
		{
			if(pw.equals(rs.getString(1)))
			{
				return 1;
			}
		}
		return 0;
	}
	
	public void updateInfo(String id, String name,String gender, int age, String phone, String email ) {
		String sql="update member set name=?,gender=?, age=?,phone=?, email=? where id=?";
/*		System.out.println(id);
		System.out.println(name);
		System.out.println(nick);
		System.out.println(gender);
		System.out.println(age);
		System.out.println(phone);
		System.out.println(email);*/
		System.out.println(age);
		System.out.println(phone);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			
			pstmt.setString(2, gender);
			pstmt.setInt(3, age);
			pstmt.setString(4, phone);
			pstmt.setString(5, email);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("펑~");
		}
	}
	
	
	public int changePw(String pw ,String id) {
		String sql="update member set pw=? where id=?";
		try {
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1,pw);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}	//회원가입 메서드 ( id_no, id, pw,  
	
	
	public MemberVO getlist(String id){
		/*ResultSet rs = null;
		PreparedStatement pstmt = null;
		*/
		String sql = "select * from member where id=?";
		MemberVO m1 = new MemberVO();
		
		
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();		//에러.....
		
			if(rs.next()) {
				m1.setId(rs.getString("id"));
				m1.setPw(rs.getString("pw"));
				m1.setName(rs.getString("name"));
				m1.setNickname(rs.getString("nickname"));
				m1.setGender(rs.getString("gender"));
				m1.setAge(rs.getInt("age"));
				m1.setPhone(rs.getString("phone"));
				m1.setEmail(rs.getString("email"));
				System.out.println("db에러 발생3");
			}
			System.out.println("db에러 발생4");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db에러 발생5");
		}
		return m1; 
		
	}
	
	
	public void getAllInfoClose() throws SQLException {
		if(rs != null) {
			rs.close();
		}
		if(pstmt != null) {
			pstmt.close();
		}
		if(con != null) {
			con.close();
		}
	}
	
	
	//로그인 메서드(id, pw)
	public int login(String userID, String userPassword) {
		String sql = "SELECT pw FROM member where id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	//rs에 결과값이 있다면 next()가 ㅅ겯
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				} 
				else 
					return 0; //비밀번호 불일치 
			}
			return -1;		//id가 없는 경우 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -2;	//DB 오류
	}
	
	
	//회원가입 메서드 ( id_no, id, pw,  
	public int join(MemberVO member) {
		String sql = "insert into member values(member_sequence1.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getNickname());
			pstmt.setString(5, member.getGender());
			pstmt.setInt(6, member.getAge());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getEmail());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; //DB오류  	
	}
	
	
	//닉네임 검색 함수
	public String getNickuseid(String id) {
		String sql = "select nickname from member where id=?";
		String nick=null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nick = rs.getString(1);
			
			}else { //오류날 경우 빈값 반환
				return "";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return nick;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

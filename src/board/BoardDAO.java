package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;

public class BoardDAO {
	private Connection con;
	/* PreparedStatement pstmt = null; */
	ResultSet rs = null;

	// DB 연결
	public BoardDAO() throws ClassNotFoundException, SQLException {
		con = new DBconn().getConnection();
	}

	public int writeBoard(String title, String nickname, String content, String b_type) {

		String sql = "insert into board values(board_sequence1.NEXTVAL, ?, ?, ?, to_char(SYSDATE, 'yy-mm-dd hh24:mi'), 0, '', ?, '')";
		try {
			/*
			 * ResultSet rs = null; PreparedStatement pstmt = null;
			 */
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, nickname);
			pstmt.setString(4, b_type);
			return pstmt.executeUpdate(); // 정상 완료되면 1을 반환
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // db오류
	}

	// 다음에 작성될 글번호 생성 함수
	public int getNext() {

		String sql = "select b_id from board order by b_id desc";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물인 경우 1을 반환
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // db오류
	}

	// 다음 페이지 번호 구하기
	public boolean nextPage(int pageNumber) {

		String sql = "select * from board where b_id < ?";
		try {

			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();

			// 결과가 하나라도 존재한다면 다음페이지로 넘어갈 수 있음을 보여줌
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	/*
	 * //다음에 작성될 글번호 생성 함수 public int getNext() {
	 * 
	 * String sql = "select count(*) as totalCount from board"; try {
	 * PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = null;
	 * PreparedStatement pstmt = null; rs = pstmt.executeQuery(); if(rs.next()) {
	 * return rs.getInt(1) + 1; } return 1; //첫번째 게시물인 경우 1을 반환 } catch
	 * (SQLException e) { e.printStackTrace(); } return -1; //db오류 }
	 */

	// 게시물 가져오기(mysql)
	/*
	 * public ArrayList<BoardVO> listBoard(int begin, int end){
	 * 
	 * ArrayList<BoardVO> list = new ArrayList<BoardVO>();
	 * 
	 * Connection con = null; PreparedStatement ps = null; ResultSet rs = null;
	 * 
	 * //String sql = "select * from board order by num desc"; String sql =
	 * "select rn, num,name,email,pwd,subject,content,regdate,hit,parent,sort,tab "
	 * + "  from (select " +
	 * "  Rownum as rn, num,name,email,pwd,subject,content,regdate,hit,parent,sort,tab "
	 * + "  from(    " +
	 * "        select num,name,email,pwd,subject,content,regdate,hit,parent,sort,tab  "
	 * + "        from board " + "        order by parent desc,sort desc " + //기본값
	 * 오름 차순 "        )" + "    )" + "where RN >=? and RN <=?";
	 * System.out.println(sql);
	 * 
	 * try {
	 * 
	 * con = getCon(); ps = con.prepareStatement(sql); ps.setInt(1, begin);
	 * ps.setInt(2, end);
	 * 
	 * rs = ps.executeQuery();
	 * 
	 * while(rs.next()) {
	 * 
	 * BoardDTO dto = new BoardDTO();
	 * 
	 * dto.setNum(rs.getInt("num")); dto.setName(rs.getString("name"));
	 * dto.setEmail(rs.getString("email")); dto.setPwd(rs.getString("pwd"));
	 * dto.setSubject(rs.getString("subject"));
	 * dto.setContent(rs.getString("content"));
	 * dto.setRegdate(rs.getDate("regdate")); dto.setHit(rs.getInt("hit"));
	 * dto.setParent(rs.getInt("parent")); dto.setSort(rs.getInt("sort"));
	 * dto.setTab(rs.getInt("tab"));
	 * 
	 * list.add(dto); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }finally { dbClose(con, ps, rs);
	 * }
	 * 
	 * 
	 * return list;
	 * 
	 * 
	 * }
	 */

	/*
	 * //게시판 한페이지에 출력할 열개 페이지 가져오기 public ArrayList<BoardVO> getList(int
	 * pageNumber){ ResultSet rs = null; PreparedStatement pstmt = null;
	 * 
	 * 
	 * String sql =
	 * "select * from(select * from board where b_id < ? order by b_id DESC) where rownum<=10"
	 * ; //String sql =
	 * "select * from(select * from board where b_id < ? order by b_id DESC) where rownum<=10"
	 * ; String sql =
	 * "select * from(select * from board order by b_id DESC) where rownum<=10 and rownum >=2"
	 * ; //String sql =
	 * "select * from board where b_id < ? AND ROWNUM <= 10 order by b_id DESC";
	 * ArrayList<BoardVO> blist = new ArrayList<>();
	 * 
	 * try { PreparedStatement pstmt = con.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, getNext() - (pageNumber -1)*10); rs = pstmt.executeQuery();
	 * //에러.....
	 * 
	 * System.out.println("db에러 발생1"); System.out.println(pageNumber);
	 * System.out.println(getNext() - (pageNumber -1)*10);
	 * 
	 * while(rs.next()) { BoardVO b1 = new BoardVO();
	 * System.out.println("b_id :"+rs.getInt(1));
	 * System.out.println("b_id :"+rs.getString(2));
	 * 
	 * 
	 * 
	 * b1.setB_id(rs.getInt(1)); //System.out.println("db에러 발생2");
	 * 
	 * b1.setTitle(rs.getString(2)); //에러... //System.out.println("db에러 발생2");
	 * b1.setContent(rs.getString(3)); //System.out.println("db에러 발생2");
	 * b1.setNickname(rs.getString(4)); //System.out.println("db에러 발생2");
	 * b1.setDay(rs.getString(5)); b1.setHits(rs.getInt(6));
	 * b1.setComment(rs.getString(7)); b1.setB_type(rs.getString(8));
	 * b1.setGame_name(rs.getString(9));
	 * 
	 * blist.add(b1); //System.out.println("db에러 발생3"); } //
	 * System.out.println("db에러 발생4"); } catch (SQLException e) {
	 * e.printStackTrace(); //System.out.println("db에러 발생5"); } return blist; }
	 */

	
	
	// 게시판 한페이지에 출력할 열개 페이지 가져오기
	public ArrayList<BoardVO> getList(int begin, int end) {

		String sql = "select * from(select ROW_NUMBER() over(order by b_id desc)as rn, board.* from board) where rn >= ? and rn <=?";

		ArrayList<BoardVO> blist = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, begin);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO b1 = new BoardVO();

				b1.setB_id(rs.getInt(2));
				// System.out.println("db에러 발생2");
				b1.setTitle(rs.getString(3)); // 에러...
				// System.out.println("db에러 발생2");
				b1.setContent(rs.getString(4));
				// System.out.println("db에러 발생2");
				b1.setNickname(rs.getString(5));
				// System.out.println("db에러 발생2");
				b1.setDay(rs.getString(6));
				b1.setHits(rs.getInt(7));
				b1.setComment(rs.getString(8));
				b1.setB_type(rs.getString(9));
				b1.setGame_name(rs.getString(10));

				blist.add(b1);
			}
			System.out.println("리스트 생성 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return blist;
	}

	// 닉네임으로 게시판 리스트 출력
	public ArrayList<BoardVO> getBoardList(String nick) {
		/*
		 * ResultSet rs = null; PreparedStatement pstmt = null;
		 */
		String sql = "select * from(select * from board where nickname=? order by b_id DESC) where rownum<=10";
		ArrayList<BoardVO> blist = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, nick);
			rs = pstmt.executeQuery(); // 에러.....

			while (rs.next()) {
				BoardVO b1 = new BoardVO();
				b1.setB_id(rs.getInt(1));
				System.out.println("db에러 발생2");
				b1.setTitle(rs.getString(2)); // 에러...
				System.out.println("db에러 발생2");
				b1.setContent(rs.getString(3));
				System.out.println("db에러 발생2");
				b1.setNickname(rs.getString(4));
				System.out.println("db에러 발생2");
				b1.setDay(rs.getString(5));
				b1.setHits(rs.getInt(6));
				b1.setComment(rs.getString(7));
				b1.setB_type(rs.getString(8));
				b1.setGame_name(rs.getString(9));

				blist.add(b1);
				System.out.println("db에러 발생3");
			}
			System.out.println("db에러 발생4");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db에러 발생5");
		}
		return blist;
	}

	
	// 최신 게시판 10개 구하기
	public ArrayList<BoardVO> getLatestList() {

		String sql = "select * from(select ROW_NUMBER() over(order by day desc)as rn, board.* from board) where rn >= 1 and rn <=10";

		ArrayList<BoardVO> blist = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement(sql);

			//pstmt.setInt(1, begin);
			// pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO b1 = new BoardVO();

				b1.setB_id(rs.getInt(2));
				
				b1.setTitle(rs.getString(3)); // 에러...
				
				b1.setContent(rs.getString(4));
				
				b1.setNickname(rs.getString(5));
				
				b1.setDay(rs.getString(6));
				b1.setHits(rs.getInt(7));
				b1.setComment(rs.getString(8));
				b1.setB_type(rs.getString(9));
				b1.setGame_name(rs.getString(10));

				blist.add(b1);
			}
			System.out.println("리스트 생성 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return blist;
	}
	
	

	// 게시판 총 갯수 구해오기
	public int getTotal() {
		String sql = "select count(*) as totalCount from board";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db오류
	}

	// 게시판 내용 하나 불러오기(view.jsp)
	public BoardVO getBoard(int b_id) {

		String sql = "select * from board where b_id=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			rs = pstmt.executeQuery();
			// 결과가 하나라도 존재한다면 다음페이지로 넘어갈 수 있음을 보여줌
			if (rs.next()) {
				BoardVO b1 = new BoardVO();
				b1.setB_id(rs.getInt(1));
				b1.setTitle(rs.getString(2));
				b1.setContent(rs.getString(3));
				b1.setNickname(rs.getString(4));
				b1.setDay(rs.getString(5));
				b1.setHits(rs.getInt(6));
				b1.setComment(rs.getString(7));
				b1.setB_type(rs.getString(8));
				b1.setGame_name(rs.getString(9));

				System.out.println("getBoard()완료");
				return b1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int hitsUpdate(int b_id) {
		String sql = "update board set hits = hits+1 where b_id = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return -1; // db오류
	}

	public int update(int b_id, String title, String content) {
		String sql = "update board set title =?, content=? where b_id=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, b_id);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// DB오류

	}

	public int delete(int b_id) {
		String sql = "delete from board where b_id=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// DB오류
	}

	/*
	 * public void pstmtClose() throws SQLException { PreparedStatement pstmt =
	 * null; if(pstmt != null) { pstmt.close(); } }
	 */

}

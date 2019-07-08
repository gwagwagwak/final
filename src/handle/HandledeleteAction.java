package handle;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardVO;
import member.MemberDAO;

public class HandledeleteAction implements HandleImpl {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter script = response.getWriter();
		HttpSession session = request.getSession();

		BoardDAO bdao = null;
		MemberDAO mdao = null;
		BoardVO board = null;

		int result = -1;	//반환할 결과값
		
		// 회원 아이디
		String id = null;
		// 게시판 아이디
		int b_id = 0;

		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		} else if (id == null) {// 로그인 안되있다면
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}

		// 게시판 아이디
		if (request.getParameter("b_id") != null) {
			b_id = Integer.parseInt(request.getParameter("b_id"));
		}
		// 가져온 글이 없는 경우 bbs페이지로 이동
		else if (b_id == 0) {
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}

	
		try {
			bdao = new BoardDAO();
			board = new BoardVO();
			mdao = new MemberDAO();
			
			result = bdao.delete(b_id);	//반환할 결과값
			System.out.println("delete완료");
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*if (!mdao.getNickuseid(id).equals(board.getNickname())) {
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} */
		//else {
			
			try {
				bdao = new BoardDAO();
				result = bdao.delete(b_id);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

	//	}
			
			if (result == -1) {
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다.')");
				script.println("</script>");
				System.out.println("글 삭제 실패");
				script.println("history.back()");
			}/* else { // 글쓰기 성공
				script.println("<script>");
				script.println("location.href= 'bbsAction.do'"); // 삭제 성공시 login페이지로 이동함
				script.println("</script>");
			}*/
		
		
		request.setAttribute("pageNumber", 1);

	}

}

package handle;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardVO;
import member.MemberDAO;
import member.MemberVO;

public class HandleWriteAction implements HandleImpl{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter script = response.getWriter();
		HttpSession session = request.getSession();

		BoardDAO bdao = null;
		BoardVO board = null;
		MemberVO member = null;
		MemberDAO mdao = null;
		
		int result = -1;
		String id = null;	//회원 아이디
		
		if(request.getParameter("title")== null){
			script.println("<script>");
			script.println("alert('제목을 입력해주세요')");
			script.println("</script>");
			script.println("history.back()");
		}
		
		
		String title = request.getParameter("title");
		String nickname = request.getParameter("nickname");
		String content=request.getParameter("content");
		String b_type=request.getParameter("b_type");
 
		
		
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		} else if (id == null) {// 로그인 안되있다면
			System.out.println("로그인을 하세요");
			script.println("location.href='login.jsp'");
		}
		
		
		try {
			bdao = new BoardDAO();
			board = new BoardVO();
			mdao = new MemberDAO();
			
			result = bdao.writeBoard(title, nickname, content, b_type);
			System.out.println("write완료");
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("pageNumber", 1);
		request.setAttribute("result", result);
		
		
		
	}

}

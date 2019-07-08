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

public class HandleupdateAction implements HandleImpl{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter script = response.getWriter();
		HttpSession session = request.getSession();
		
		BoardDAO bdao = null;
	//	BoardVO board = null;
		//MemberVO member = null;
		//MemberDAO mdao = null;
		
		int result = -1;
		String id = null;	//회원 아이디
		
		if(request.getParameter("title")== null){
			script.println("<script>");
			script.println("alert('제목을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		System.out.println("title입력");
		
		int b_id = Integer.parseInt(request.getParameter("b_id"));
		String title = request.getParameter("title");
		String content=request.getParameter("content");
		//String nickname = request.getParameter("nickname");
		//String b_type=request.getParameter("b_type");
 
		try {
			bdao = new BoardDAO();
			result = bdao.update(b_id, title, content);
		
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("pageNumber", 1);
		if (result == -1) {
			script.println("<script>");
			script.println("alert('글 삭제에 실패했습니다.')");
			script.println("</script>");
			System.out.println("글 업데이트 실패");
			script.println("history.back()");
		}
		
		
	}

}

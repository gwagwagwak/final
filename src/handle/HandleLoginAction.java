package handle;

import java.io.PrintWriter;


import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import member.MemberDAO;


public class HandleLoginAction implements HandleImpl {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	      HttpSession session=request.getSession(true);
	      PrintWriter out = response.getWriter();

		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String link=null;
	
	
	
		MemberDAO mdao = new MemberDAO();
		
		int result = mdao.login(id,pw);
		
		if(result == 1){ //로그인 성공시
			session.setAttribute("id", id);	//로그인 성공시 메인페이지에 세션값으로 id를 보내준다.
			//session.setAttribute("nickname", member.getNickname());
			link="index.jsp";
			session.setAttribute("link", link);
		}
		else if(result ==0){
		
			link="login.jsp";
			session.setAttribute("link", link);
		}
		else if(result == -1){			
	
			link="login.jsp";
			session.setAttribute("link", link);
		}
		else if(result == -2){
			link="login.jsp";
			session.setAttribute("link", link);
		}
	}
	
}
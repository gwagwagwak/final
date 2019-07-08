package handle;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import member.MemberDAO;



public class HandlePwChangAction implements HandleImpl {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		  HttpSession session=request.getSession(true);
		  PrintWriter script = response.getWriter();
			String id = null;
			String pw=null;
			String pw2=null;
			String pw3=null;
			String pw4=null;
			String link=null;
			id = (String)session.getAttribute("id");
			pw=request.getParameter("pw");
			pw2=request.getParameter("pw2");
			pw3=request.getParameter("pw3");
			pw4=request.getParameter("pw4");
			MemberDAO mdao = new MemberDAO();
			if(pw3!=null){
				if(pw3.equals(pw4)){
					int result=mdao.changePw(pw3, id);
					if(result==1){
						script.println("<script>");
						script.println("alert('비밀번호가 성공적으로 변경되었습니다.')");
						script.println("location.href = 'changePW.jsp'");
						script.println("</script>");
						link="changePW.jsp";
						session.setAttribute("link", link);
						return;
					}
					script.println("<script>");
					script.println("alert('데이터베이스 오류가 발생했습니다.')");
					script.println("location.href = 'changePW.jsp'");
					script.println("</script>");
					link="changePW2.jsp";
					session.setAttribute("link", link);
					return;
				}
				script.println("<script>");
				script.println("alert('비밀번호와 확인이 일치하지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
				link="changePW2.jsp";
				session.setAttribute("link", link);
				return;
			}else if(pw.equals(pw2)){
				
			int result = mdao.checkPw(id, pw);
			
			if(result == 1){ 
				session.setAttribute("PW", pw);	
				script.println("<script>");
				script.println("location.href = 'changePW2.jsp'");
				script.println("</script>");
				link="changePW2.jsp";
				session.setAttribute("link", link);
				return;
			}
			else if(result ==0){
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
				link="changePW.jsp";
				session.setAttribute("link", link);
				return;
			}
			}
			script.println("<script>");
			script.println("alert('비밀번호와 확인이 일치하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
			link="changePW.jsp";
			session.setAttribute("link", link);
			
	
	}
	
}

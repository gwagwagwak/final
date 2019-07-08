package handle;

import java.io.PrintWriter;


import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import member.MemberDAO;
import member.MemberVO;


public class HandleChangeInfoAction implements HandleImpl {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		  HttpSession session=request.getSession(true);
		PrintWriter script = response.getWriter();
		String id=null;
		String pw =null;
		String name= null;
		String nickname=null;
		String gender=null;
		String age= null;
		String phone=null;
		String email=null;
		int age2=0;
		id = (String)session.getAttribute("id");


		pw=request.getParameter("pw");
		name=request.getParameter("name");

		gender=request.getParameter("gender");
		phone=request.getParameter("phone");
		email=request.getParameter("email");
		MemberVO info=new MemberVO();
		age= request.getParameter("age2");


		MemberDAO mdao = new MemberDAO();
		info= mdao.getlist(id);

		if(age.equals(""))
		{
			age2=info.getAge();
		}
		else
		{
			age2=Integer.parseInt(age);
		}
		if(name.equals(""))
		{
			name=info.getName();
		}
	


		if(email.equals(""))
		{
			email=info.getEmail();
		}
		if(phone.equals(""))
		{
			phone=info.getPhone();
		}


		int result =mdao.checkPw(id, pw);
		if(result == 1){ 
			mdao.updateInfo(id, name, gender, age2, phone, email);

		}
	
	}
	
}

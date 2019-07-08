<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="member" class="member.MemberVO" scope="page"/>
<jsp:setProperty name="member" property="id"/>	<!--property의 id는 login.jsp에서 input의 name에서 받아온 id의 값을 member객체의  id안에 저장하게 된다. (이름이 같으니깐) -->
<jsp:setProperty name="member" property="pw"/>
<jsp:setProperty name="member" property="name"/>
<jsp:setProperty name="member" property="nickname"/>
<jsp:setProperty name="member" property="gender"/>
<jsp:setProperty name="member" property="age"/>
<jsp:setProperty name="member" property="phone"/>
<jsp:setProperty name="member" property="email"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 
<meta name="viewport" content="width=deviece-width", initial-scale="1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
 -->
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		
		String id = null;
		//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		
		//로그인을 한 상태가 아니면
		if(id != null){
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다..')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
			script.close();
		}
	
		if(member.getId() == null || member.getPw() == null || member.getName() == null ||member.getNickname() == null
			|| member.getGender() == null || member.getAge() == 0 || member.getPhone() == null || member.getEmail() == null){
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}
		else{
			MemberDAO mdao = new MemberDAO();
			int result = mdao.join(member);
			
			if(result == -1){ 	//db오류, 회원가입 실패
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
			}
			else  { //정상 회원가입 성공
				//session.setAttribute("id", member.getId());	//로그인 성공시 메인페이지에 세션값으로 id를 보내준다.
				script.println("<script>");
				script.println("location.href= 'login.jsp'");	//회원가입 성공시 login페이지로 이동함
				script.println("</script>");
				script.close();
			}
		}
		
		
	
	%>

</body>
</html>
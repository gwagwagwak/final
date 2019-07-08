<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="member" class="member.MemberVO" scope="page"/>
<jsp:setProperty name="member" property="id"/>	<!--property의 id는 login.jsp에서 input의 name에서 받아온 id의 값을 member객체의  id안에 저장하게 된다. (이름이 같으니깐) -->
<jsp:setProperty name="member" property="pw"/>


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
			script.println("location.href='index.jsp'");
			script.println("</script>");
		}
	
		MemberDAO mdao = new MemberDAO();
		int result = mdao.login(member.getId(), member.getPw());
		
		if(result == 1){ //로그인 성공시
			session.setAttribute("id", member.getId());	//로그인 성공시 메인페이지에 세션값으로 id를 보내준다.
			//session.setAttribute("nickname", member.getNickname());
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		else if(result ==0){
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1){			
			script.println("<script>");
			script.println("alert('존재하지 않는 ID입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	
	%>

</body>
</html>
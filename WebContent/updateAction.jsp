<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page import="member.MemberVO" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>

<%-- <jsp:useBean id="board" class="board.BoardVO" scope="page"/>
<jsp:setProperty name="board" property="title"/>	<!--property의 id는 login.jsp에서 input의 name에서 받아온 id의 값을 member객체의  id안에 저장하게 된다. (이름이 같으니깐) -->
<jsp:setProperty name="board" property="content"/>
<jsp:setProperty name="board" property="nickname"/>
<jsp:setProperty name="board" property="b_type"/> --%>
<%-- <jsp:setProperty name="board" property="game_name"/> --%>

 


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
		
		MemberDAO md = new MemberDAO();
	
		String id = null;
		//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		
		//로그인을 한 상태가 아니면
		if(id == null){
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} 
		
		int b_id=0;
		//
		if(request.getParameter("b_id") != null){
			b_id = Integer.parseInt(request.getParameter("b_id"));
		} 
		
		//가져온 글이 없는 경우 bbs페이지로 이동
		if(b_id ==0){
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		
		BoardVO board = new BoardDAO().getBoard(b_id);
		if(!md.getNickuseid(id).equals(board.getNickname())){
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
		//로그인을 한 상태
		else{
			//제목을 입력하지 않았다면
			if(board.getTitle() == null){
					script.println("<script>");
					script.println("alert('제목을 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
			}
			//제목을 입력한 경우
			else{
				BoardDAO bdao = new BoardDAO();
				int result = bdao.update(b_id, request.getParameter("title"), request.getParameter("content"));
					
				if(result == -1){ 	//db오류 게시판 글쓰기 실패
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else  { //정상 글쓰기 성공
					//session.setAttribute("id", member.getId());	//로그인 성공시 메인페이지에 세션값으로 id를 보내준다.
					script.println("<script>");
					script.println("location.href= 'bbs.jsp'");	//회원가입 성공시 login페이지로 이동함
					script.println("</script>");
				}
			}
			
		}
		
	
	%>

</body>
</html>
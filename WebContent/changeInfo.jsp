
<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>게시판 메인</title>

<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
	ul{
	list-style:none;
}
.jumbotron {
  padding: 30px 15px;
  margin-bottom: 30px;
  color: inherit;
  background-color: white;
}
.form-control::-moz-placeholder {
  color: black;
  opacity: 1;
}
.form-control:-ms-input-placeholder {
  color: black;
}
.form-control::-webkit-input-placeholder {
  color: black;
}
</style>

</head>
<body>

	<%
	int count=0;
	PrintWriter script = response.getWriter();
	
	String id = null;
	//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}

	int pageNumber = 1;	//기본 페이지 번호 
	//다음 페이지 번호가 존재하면 페이지 번호를 적용해준다.
	
	//파라미터에 값이 넘어왔다면 페이지 넘버를 바꾼다.
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber")); 
	}
	
	%>


	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">gevolution</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li ><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
				<li><a href="rank.jsp">게임순위</a></li>
			</ul>
			
			<%
				//로그인이 되있지 않다면 로그인, 회원가입 드롭다운 메뉴를 생성
				if(id == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>	<!-- active :현재 선택됨  -->
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
				else{	//로그인이 된 경우
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="mypage.jsp">마이페이지</a></li>	<!-- active :현재 선택됨  -->
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			
			%>
		</div>
	</nav>

	<div class="mypage">
	<div class="sidebar">
	<h2>마이페이지</h2>	
	<hr class="hrclass">	
	<br>
	<ul class="firstMenu">
	<li>
		<a href="mypage.jsp" class="sidefont">작성글 보기<span><img src="img/btn_lnb_expand.gif" class="imgg"></span></a>
		<br>
		<hr>	
	</li>
	</ul>
    
	<ul class="secondMenu">
	<li>
		개인정보 변경<span><img src="img/btn_lnb_expand.gif" class="imgg"></span></a>
		<br>
		<hr>	
	</li>
	</ul>
    <ul class="lastMenu">
	<li>
		<a href="changePW.jsp" class="sidefont">비밀번호 변경<span><img src="img/btn_lnb_expand.gif" class="imgg"></span></a>
	</li>

	</ul>
	
	
	</div>
	<div class="container2">
	<%
	MemberDAO mdao = new MemberDAO();
	MemberVO meminfo = new MemberVO();
	meminfo = mdao.getlist(id);
	String id2= meminfo.getId();
	String pw= meminfo.getPw();
	String gen=meminfo.getGender();
	String name= meminfo.getName();
	String nick= meminfo.getNickname();
	String age= Integer.toString(meminfo.getAge());
	String phone= meminfo.getPhone();
	String email= meminfo.getEmail();
	String btnPressMa="btn btn-primary";
	String btnPressFe="btn btn-primary";
	if(gen.equals("여"))
	{
		btnPressFe="btn btn-primary active";
	}
	else
	{
		btnPressMa="btn btn-primary active";
	}

	
	 %>
		<div class="container2">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="infoChange.do" method="post">
					<h2 style="text-align: center;"><strong>회원정보 수정<strong></h2>
					<hr class="hrclass">
					<div class="form-group">
						아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=id2 %>
						<br>		<hr>
						닉네임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=nick %>
				<hr>
					</div>
					<div class="form-group">
						현재 비밀번호 입력 <input type="password" class="form-control" name="pw" maxlength="20" >
					</div>
					<div class="form-group">
						이름<input type="text" class="form-control" placeholder=<%=name %> name="name" maxlength="20" >
					</div>
					<div class="form-group" style="text-align:center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="<%=btnPressMa %>">
								<input type="radio" name="gender" autocomplete="off" value="남"checked>남자
							</label>
							<label class="<%=btnPressFe %>">
								<input type="radio" name="gender" autocomplete="off" value="여">여자
							</label>
						</div>	
					</div>
					<div class="form-group">
						나이<input type="number" class="form-control" placeholder=<%=age %> name="age2" maxlength="20" >
					</div>
					<div class="form-group">
						전화번호<input type="text" class="form-control" placeholder=<%=phone %> name="phone" maxlength="20" >
					</div>
					<div class="form-group">
						이메일<input type="email" class="form-control" placeholder=<%=email %> name="email" maxlength="20" >
					</div>
					<input type="submit" class="btn btn-primary form-control" value="정보수정 완료">
				</form>
			</div>
		</div>
	</div>


	


	<script src="js/jquery-3.4.1.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>

</div>
</body>
</html>
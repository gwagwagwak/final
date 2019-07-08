<%@ page import="member.MemberDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%@ page import="member.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>Nantes - Onepage Business Template</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- Custom styles for this template -->
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/owl.theme.default.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<style>
	.btn-space {
    margin-right: 5px;
}

</style>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();

		MemberDAO mdao = new MemberDAO();

		BoardVO board = new BoardVO();
		BoardDAO bdao = new BoardDAO();

		String id = null;
		int b_id = 0; //게시판 아이디
		int pageNumber = 1; //기본 페이지 번호

		if (request.getAttribute("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getAttribute("pageNumber").toString());
			System.out.println("view에서 받은 페이지 번호 = " + pageNumber);
		}else{
			System.out.println("어트리뷰트 페이지 ㅇ벗음");
		}

		
		if (request.getAttribute("board") != null) {
		
			System.out.println("보드 받앗음              ㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ");
		
		}
		
		//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
			System.out.println("아이디 출력 : " + id);
		}

		if (request.getParameter("b_id") != null) {
			b_id = Integer.parseInt(request.getParameter("b_id"));
			System.out.println("보드 아이디1 : " + b_id);
			System.out.println("회원 아이디 1: " + id);
		}

		if (request.getAttribute("b_id") != null) {
			System.out.println("어트리뷰트 보드아읻 : " + b_id);
			b_id = Integer.parseInt((String)request.getAttribute("b_id"));
			System.out.println("회원 아이디 1: " + id);
		}

		//가져온 글이 없는 경우 bbs페이지로 이동
		if (b_id == 0) {
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbsAction.do'");
			script.println("</script>");
		}

		if (request.getAttribute("board") == null) {
			script.println("<script>");
			script.println("alert('board를 받아오지 못했습니다.')");
			script.println("location.href='bbsAction.do'");
			script.println("</script>");
		} else {
			//blist =(ArrayList<BoardVO>)request.getAttribute("blist");	//리스트 생성
			board = (BoardVO) request.getAttribute("board");
			System.out.println("board객체 불러오기 성공");
		}

		//board = bdao.getBoard(b_id);
		//board.getBoard(b_id);

		System.out.println("보드내용: " + board.getTitle());
	%>


	<header> </header>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<br> <a class="navbar-brand page-scroll" href="#page-top">LOGO</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll" href="#page-top">Home</a></li>
					<li><a class="page-scroll" href="#about">About</a></li>
					<li><a class="page-scroll" href="login.jsp">Sign in</a></li>
					<li><a class="page-scroll" href="join.jsp">Sign up</a></li>
					<li><a class="page-scroll" href="#">My Page</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<br>
	<br>
	<br>

	<!-- view  테이블 -->

	<div align=center>
		<div class="container">
			<table class="table">
				<thead>
					<tr
						style="text-align: left; height: 60px; background-color: #fec503; font-size: 20px; border-color: #1a1a1a; border: 1px">
						<th colspan="2"
							style="text-align: center; height: 60px; background-color: #5D5D5D; font-size: 20px; width: 8%; color: white;">
							COMUNITY</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td bgcolor="#fec503" width="14%">
							<div align="CENTER">
								<strong>글 제목</strong>
							</div>
						</td>

						<td colspan="2"><%=board.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "<br>")%></td>
					</tr>
					<tr>
						<td bgcolor="#fec503">
							<div align="CENTER">
								<strong>작성자</strong>
							</div>
						</td>
						<td colspan="2"><%=board.getNickname()%></td>
					</tr>
					<tr>
						<td bgcolor="#fec503">
							<div align="CENTER">
								<strong>작성일</strong>
							</div>
						</td>
						<td colspan="2"><%=board.getDay()%></td>
					</tr>
					
					<tr>
						<td colspan="2" bgcolor="#F3E2A9">
							<div align="CENTER">
								<strong>내용</strong>
							</div>
						</td>
					</tr>
					
					<tr
					style="text-align: left; height: 200px;  font-size: 15px; border-color: #1a1a1a; border: 3px">
						
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=board.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					    .replaceAll("\n", "<br>")%></td>
					</tr>
					
					<%-- <tr>
						<td bgcolor="#fec503">
							<div align="CENTER">
								<strong>내용</strong>
							</div>
						</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=board.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "<br>")%></td>
					</tr> --%>
				</tbody>
			</table>
			
			<div>
				<a href="bbsAction.do?pageNumber=<%=pageNumber%>"
					class="btn btn-danger pull-left">목록</a>
				<%
					if (id != null && mdao.getNickuseid(id).equals(board.getNickname())) {
				%>
				<a href="update.jsp?b_id=<%=b_id%>"
					class="btn  btn-danger pull-right">수정</a> 
				<a onclick="return confirm('정말로 삭제하시겠습니까?')"
					href="deleteAction.do?b_id=<%=b_id%>"
					class="btn btn-danger pull-right">삭제</a>
				<%
					}
				%>
			</div>
		</div>
	</div>


	<br>
	<br>
	<br>
	<br>
	<br>
	<%-- 
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">게시판 글
							보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="80" bgcolor="#f7f7f7">
							<div align="right"><strong>작성자</strong></div>
						</td> 
						<td><input type="text" class="form-control" value=<%=md.getNickuseid(id)%> name="nickname" maxlength="50" readonly></td>
						<td style="width: 20%;">글제목</td>
						<td colspan="2"><%=board.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "<br>")%></td>
					</tr>
					<tr>
						<!-- <td width="80" bgcolor="#f7f7f7">
							<div align="right"><strong>타입</strong></div>
						</td> 
						<td><input type="text" class="form-control" value="게시판" name="b_type" maxlength="50" readonly></td> -->
						<td>작성자</td>
						<td colspan="2"><%=board.getNickname()%></td>

					</tr>
					<tr>
						<!-- <td width="80" bgcolor="#f7f7f7">
							<div align="right"><strong>제목</strong></div>
						</td> 
						<td bgcolor="#f7f7f7"><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td> -->
						<td>작성일자</td>
						<td colspan="2"><%=board.getDay()%></td>
					</tr>
					<tr>
						<!-- <td width="80" bgcolor="#f7f7f7">
							<div align="right"><strong>내용</strong></div>
						</td> 
						<td bgcolor="#f7f7f7"><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2000" style="height:350px"></textarea></td> -->
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=board.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "<br>")%></td>
					</tr>
				</tbody>
				<%=board.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
			</table>
			<a href="bbsAction.do?pageNumber=<%=pageNumber%>" class="btn btn-dark">목록</a>
			<a href="bbsAction.do?pageNumber=<%=pageNumber%>"
				class="btn btn-danger pull-left">목록</a>


			<!--수정, 삭제(아이디가 같은 경우)  -->
			<%
				if (id != null && mdao.getNickuseid(id).equals(board.getNickname())) {
			%>
			<a href="update.jsp?b_id=<%=b_id%>"
				class="btn btn-primary pull-right">수정</a> <a
				onclick="return confirm('정말로 삭제하시겠습니까?')"
				href="deleteAction.do?b_id=<%=b_id%>"
				class="btn btn-primary pull-right">삭제</a>
			<%
				}
			%>
		</div>
	</div>
	<br>
	<br>
	<br>
 --%>
	<section class="section-cta">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<h2>This is Call To Action module. One click and template is
						yours.</h2>
				</div>
				<div class="col-md-4">
					<a href="#" class="button-cta">DOWNLOAD</a>
				</div>
			</div>
		</div>
	</section>


	<section id="contact" class="dark-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>Contact Us</h2>
						<p>
							If you have some Questions or need Help! Please Contact Us!<br>We
							make Cool and Clean Design for your Business
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="section-text">
						<h4>Our Business Office</h4>
						<p>3422 Street, Barcelona 432, Spain, New Building North, 15th
							Floor</p>
						<p>
							<i class="fa fa-phone"></i> +101 377 655 22125
						</p>
						<p>
							<i class="fa fa-envelope"></i> mail@yourcompany.com
						</p>
					</div>
				</div>
				<div class="col-md-3">
					<div class="section-text">
						<h4>Business Hours</h4>
						<p>
							<i class="fa fa-clock-o"></i> <span class="day">Weekdays:</span><span>9am
								to 8pm</span>
						</p>
						<p>
							<i class="fa fa-clock-o"></i> <span class="day">Saturday:</span><span>9am
								to 2pm</span>
						</p>
						<p>
							<i class="fa fa-clock-o"></i> <span class="day">Sunday:</span><span>Closed</span>
						</p>
					</div>
				</div>
				<div class="col-md-6">
					<form name="sentMessage" id="contactForm" novalidate="">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Your Name *" id="name" required=""
										data-validation-required-message="Please enter your name.">
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="email" class="form-control"
										placeholder="Your Email *" id="email" required=""
										data-validation-required-message="Please enter your email address.">
									<p class="help-block text-danger"></p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<textarea class="form-control" placeholder="Your Message *"
										id="message" required=""
										data-validation-required-message="Please enter a message."></textarea>
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="row">
							<div class="col-lg-12 text-center">
								<div id="success"></div>
								<button type="submit" class="btn">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<p id="back-top">
		<a href="#top"><i class="fa fa-angle-up"></i></a>
	</p>
	<script type="text/javascript">
		function moreinfo() {
			var input = document.getElementById("search").value;
			window.location.href = "Search1.jsp?search=" + input;
			alert(input);

		}
	</script>

	<footer>
		<div class="container text-center">
			<p>
				Theme made by <a href="http://moozthemes.com"><span>MOOZ</span>Themes.com</a>
			</p>
		</div>
	</footer>



	<script src="js/jquery-3.4.1.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>
</body>
</html>
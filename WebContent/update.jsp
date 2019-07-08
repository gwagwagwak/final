<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardVO"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="member.MemberDAO"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 
<jsp:useBean id="member" class="member.MemberVO" scope="page"/>
<jsp:setProperty name="member" property="id"/>	<!--property의 id는 login.jsp에서 input의 name에서 받아온 id의 값을 member객체의  id안에 저장하게 된다. (이름이 같으니깐) -->
<jsp:setProperty name="member" property="pw"/>
<jsp:setProperty name="member" property="name"/>
<jsp:setProperty name="member" property="nickname"/>
<jsp:setProperty name="member" property="gender"/>
<jsp:setProperty name="member" property="age"/>
<jsp:setProperty name="member" property="phone"/>
<jsp:setProperty name="member" property="email"/> --%>
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
<link href="css/bootstrap.css" rel="stylesheet">
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

<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
<body>
	<%
		PrintWriter script = response.getWriter();
		MemberDAO mdao = new MemberDAO();
		BoardDAO bdao = new BoardDAO();
		BoardVO board = new BoardVO();

		String nickname = null;
		String id = null;
		int b_id = 0;

		//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
		if (session.getAttribute("id") != null) {
			id = session.getAttribute("id").toString();
			nickname = mdao.getNickuseid(id);
		}

		//로그인이 안된경우
		if (id == null) {
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		//

		if (request.getParameter("b_id") != null) {
			b_id = Integer.parseInt(request.getParameter("b_id"));
			//보드내용 가져오기
			board = bdao.getBoard(b_id);
		} else {
			System.out.println("업데이트할 b_id를 파라미터로 받지 못했습니다.");
		}

		//가져온 글이 없는 경우 bbs페이지로 이동
		if (b_id == 0) {
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbsAction.do'");
			script.println("</script>");
			script.close();
		}

		if (!mdao.getNickuseid(id).equals(board.getNickname())) {
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
			script.close();
		}
	%>
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



	<!-- Header -->
	<header> </header>

	<br>
	<br>
	<br>
	<br>

	<!--업데이트 테이블 -->
	<div align=center>
		<div class="container">
			<form method="post" action="writeAction.do">

				<table class="table">
					<thead>

						<tr
							style="text-align: left; height: 60px; background-color: #fec503; font-size: 20px; border-color: #1a1a1a; border: 1px">
							<th colspan="2"
								style="text-align: center; height: 60px; background-color: #5D5D5D; font-size: 20px; width: 8%; color: white;">
								Modification Board</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td bgcolor="#fec503" width="15%">
								<div align="CENTER">
									<strong>닉네임</strong>
								</div>
							</td>
							<td style="background-color: #f7f7f7;"><input type="text"
								class="form-control" name="nickname" maxlength="50" value="<%=nickname%>" readonly></td>
						</tr>
						<tr>
							<td width="80" bgcolor="#fec503">
								<div align="center">
									<strong>타입</strong>
								</div>
							</td>
							<td style="background-color: #f7f7f7;"><input type="text"
								class="form-control" value="게시판" name="b_type" maxlength="50"
								readonly></td>
						</tr>
						<tr>
							<td width="80" bgcolor="#fec503">
								<div align="center">
									<strong>제목</strong>
								</div>
							</td>
							<td bgcolor="#f7f7f7"><input type="text"
								class="form-control" placeholder="글 제목" name="title"
								value="<%=board.getTitle()%>" maxlength="50"></td>
						</tr>
						<tr>
							<td width="80" bgcolor="#fec503">
								<div align="center">
									<strong>내용</strong>
								</div>
							</td>
							<td bgcolor="#f7f7f7">
								<textarea class="form-control"
										placeholder="글 내용" name="content" maxlength="2000"
										style="height: 350px">
										<%=board.getContent()%>
								</textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-warning pull-right" value="수정">
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>
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
	<script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
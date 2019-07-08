
<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="member.MemberDAO"%>


<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%@ page import="java.io.PrintWriter"%>
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

	ul {
		list-style: none;
	}
</style>

</head>
<body>
	<%
		int count = 0;
		PrintWriter script = response.getWriter();

		MemberDAO mdao = new MemberDAO();
		BoardDAO bdao = new BoardDAO();

		String id = null;
		//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}

		int pageNumber = 1; //기본 페이지 번호 
		//다음 페이지 번호가 존재하면 페이지 번호를 적용해준다.

		//파라미터에 값이 넘어왔다면 페이지 넘버를 바꾼다.
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}

		//페이징 처리 변수들
		int rowSize = 10; //게시물 숫자 
		int from = (pageNumber * rowSize) - (rowSize - 1); //(1*10)-(10-1)=10-9=1 //from
		int to = (pageNumber * rowSize); //(1*10) = 10 //to

		//int totalPage = total/rowSize + (total%rowSize==0?0:1);
		int total = bdao.getTotal(); //총 게시물 수
		int allPage = (int) Math.ceil(total / (double) rowSize); //총 페이지수
		int block = 10; //한페이지에 보여줄  범위
		System.out.println("전체 페이지수 : " + allPage);
		System.out.println("현제 페이지 : " + pageNumber);
		int fromPage = ((pageNumber - 1) / block * block) + 1; //보여줄 페이지의 시작
		int toPage = ((pageNumber - 1) / block * block) + block; //보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}
		System.out.println("페이지시작 : " + fromPage + " / 페이지 끝 :" + toPage);
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
				<br> <a class="navbar-brand page-scroll" href="#page-top">GAME
					BORD</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right"
					style="display: inline-block;">
					<li class="hidden"><a href="#page-top"></a></li>
					<%
						if (id != null) { /*로그인 O 네비게이션바  */
					%>
					<li><a class="page-scroll" href="#page-top"><%=mdao.getNickuseid(id)%>님</a></li>
					<li><a class="page-scroll" href="#page-top">Home</a></li>
					<li><a class="page-scroll" href="#about">About</a></li>
					<li><a class="page-scroll" href="bbsAction.do">Comunity</a></li>
					<li><a href="reviewListAction.do?game_name='7개의 대죄'">GameRank()</a></li>
					<li><a class="page-scroll" href="logoutAction.do">Log out</a></li>
					<li><a class="page-scroll" href="mypage.jsp">My Page</a></li>
					<%
						} else if (id == null) { /*로그인 X 네비게이션바  */
					%>
					<li><a class="page-scroll" href="#page-top">Home</a></li>
					<li><a class="page-scroll" href="#about">About</a></li>
					<li><a class="page-scroll" href="bbsAction.do">Comunity</a></li>
					<li><a href="reviewListAction.do?game_name='7개의 대죄'">GameRank()</a></li>
					<li><a class="page-scroll" href="login.jsp">Sign in</a></li>
					<li><a class="page-scroll" href="join.jsp">Sign up</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<div class="mypage">
		<div class="sidebar">
			<h2>마이페이지</h2>
			<hr class="hrclass">
			<br>
			<ul class="firstMenu">
				<li>작성글 보기<span><img src="img/btn_lnb_fold.gif"
						class="imgg"></span> <br>
					<hr>
				</li>
			</ul>
			<ul class="secondMenu">
				<li><a href="changeInfo.jsp" class="sidefont">개인정보 변경<span><img
							src="img/btn_lnb_expand.gif" class="imgg"></span></a> <br>
					<hr></li>
			</ul>
			<ul class="lastMenu">
				<li><a href="changePW.jsp" class="sidefont">비밀번호 변경<span><img
							src="img/btn_lnb_expand.gif" class="imgg"></span></a></li>

			</ul>


		</div>
		<div class="container2">

			<div class="myarticle">
				<div class="articleTotal">
					<%
						String nickname = mdao.getNickuseid(id);
						ArrayList<BoardVO> blist = bdao.getBoardList(nickname);
						count = blist.size();
					%>
					* 전체 글 <strong><%=count%></strong>개를 작성하셨습니다.
				</div>
				<br>
				<br>
				<div class="articleTable">
					<div class="tblArticle">
						<form id="fmMultiProcess" name="fmMultiProcess" method="POST"
							action="myarticle.php">

							<br>

							<table class="table table-striped"
								style="text-align: center; border: 1px solid #dddddd">
								<colgroup>
									<col class="boardName">
									<col class="articleCnt">
									<col class="commentCnt">
									<col class="lastDate">
								</colgroup>
								<thead>
									<tr>
										<th style="background-color: #eeeeee; text-align: center;">번호</th>
										<th style="background-color: #eeeeee; text-align: center;">제목</th>
										<th style="background-color: #eeeeee; text-align: center;">작성자</th>
										<th style="background-color: #eeeeee; text-align: center;">작성일</th>
										<th style="background-color: #eeeeee; text-align: center;">조회</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (int i = 0; i < blist.size(); i++) {
									%>
									<tr>
										<td><%=blist.get(i).getB_id()%></td>
										<td><a href="view.jsp?b_id=<%=blist.get(i).getB_id()%>">
												<span style="color: blue"> <%=blist.get(i).getTitle()%></span>
										</a></td>
										<td><%=blist.get(i).getNickname()%></td>
										<td><%=blist.get(i).getDay()%></td>
										<td><%=blist.get(i).getHits()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</form>
					</div>
					<!--페이징  -->
					<ul class="pagination justify-content-center">
						<%
							if (pageNumber > block) { //처음, 이전 링크
						%>
						<li><a href="bbsAction.do?pageNumber=<%=fromPage - 1%>"><<</a></li>
						<%
							}
							if (pageNumber == 1) {
						%>
						<li class="page-item disabled"><a href="#">Previous</a></li>
						<%
							} else {
						%>
						<li><a href="bbsAction.do?pageNumber=<%=pageNumber - 1%>">Previous</a></li>
						<%
							}
							for (int i = fromPage; i <= toPage; i++) {
								if (i == pageNumber) {
						%>
						<li class="active"><a href="#"><%=i%></a></li>
						<%
							} else {
						%>
						<li><a href="bbsAction.do?pageNumber=<%=i%>"><%=i%></a></li>

						<%
							}
							}
							if (bdao.getTotal() > 1 && pageNumber != allPage) {
						%>

						<li><a href="bbsAction.do?pageNumber=<%=pageNumber + 1%>">Next</a></li>
						<%
							} else {
						%>
						<li class="page-item disabled"><a href="#">Next</a></li>
						<%
							}
							if (toPage < allPage) {
						%>

						<li><a href="bbsAction.do?pageNumber=<%=toPage + 1%>">>></a></li>
						<%
							}
						%>

					</ul>


				</div>
			</div>
		</div>
		
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
	</div>
</body>
</html>
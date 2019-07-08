
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=deviece-width", initial-scale="1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="favicon.ico">
	<title>Nantes - Onepage Business Template</title>
	<!-- Bootstrap core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- Custom styles for this template -->
	<link href="css/owl.carousel.css" rel="stylesheet">
	<link href="css/owl.theme.default.min.css"  rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/jquery-3.4.1.js" type="text/javascript"></script>

	<title>Insert title here</title>

</head>
<body>


<%--	<nav class="navbar navbar-default">
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
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<li><a href="rank.jsp">게임순위</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>	<!-- active :현재 선택됨  -->
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>--%>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button><br>
			<a class="navbar-brand page-scroll" href="#page-top">LOGO</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden">
					<a href="#page-top"></a>
				</li>
				<li>
					<a class="page-scroll" href="#page-top">Home</a>
				</li>
				<li>
					<a class="page-scroll" href="#about">About</a>
				</li>
				<li>
					<a class="page-scroll" href="login.jsp">Sign in</a>
				</li>
				<li>
					<a class="page-scroll" href="join.jsp">Sign up</a>
				</li>
				<li>
					<a class="page-scroll" href="#">My Page</a>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

	<!--로그인 화면  보내는 인자 userID, userPassword-->
	<div class="container" style="margin-top:10%">
		<div class="col-lg-4"></div>
		<div class="col-lg-4" style="margin-top:10%">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="loginAction.do" method="post">
					<h3 style="text-align: center;">Login Page</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="User ID" name="id" maxlength="20" >
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="User PW" name="pw" maxlength="20" >
					</div>
					<input type="submit" style="background-color: #FCBE03;border-color: #FCBE03" class="btn btn-primary form-control" value="LOGIN">
				</form>
			</div>
		</div>
	</div>
	
	<script src="js/jquery-3.4.1.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>

<section class="section-cta" style="margin-top: 20%">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<h2>This is Call To Action module. One click and template is yours.</h2>
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
					<p>If you have some Questions or need Help! Please Contact Us!<br>We make Cool and Clean Design for your Business</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="section-text">
					<h4>Our Business Office</h4>
					<p>3422 Street, Barcelona 432, Spain, New Building North, 15th Floor</p>
					<p><i class="fa fa-phone"></i> +101 377 655 22125</p>
					<p><i class="fa fa-envelope"></i> mail@yourcompany.com</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="section-text">
					<h4>Business Hours</h4>
					<p><i class="fa fa-clock-o"></i> <span class="day">Weekdays:</span><span>9am to 8pm</span></p>
					<p><i class="fa fa-clock-o"></i> <span class="day">Saturday:</span><span>9am to 2pm</span></p>
					<p><i class="fa fa-clock-o"></i> <span class="day">Sunday:</span><span>Closed</span></p>
				</div>
			</div>
			<div class="col-md-6">
				<form name="sentMessage" id="contactForm" novalidate="">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Your Name *" id="name" required="" data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input type="email" class="form-control" placeholder="Your Email *" id="email" required="" data-validation-required-message="Please enter your email address.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<textarea class="form-control" placeholder="Your Message *" id="message" required="" data-validation-required-message="Please enter a message."></textarea>
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
<footer>
	<div class="container text-center">
		<p>Theme made by <a href="http://moozthemes.com"><span>MOOZ</span>Themes.com</a></p>
	</div>
</footer>
</body>
</html>
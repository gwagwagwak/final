<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>

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
<title>Nantes-Onepage Business Template</title>

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





<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->



<style>

/*search style*/
.searchbar {
	margin-top: 2%;
	height: 60px;
	background: #ffd700 !important;
	border-radius: 30px;
	padding: 10px;
}

.search_input {
	color: black;
	border: 0;
	outline: 0;
	font-size: 20px;
	background: none;
	width: 0;
	caret-color: transparent;
	line-height: 40px;
	transition: width 0.4s linear;
}

.searchbar:hover>.search_input {
	padding: 0 10px;
	width: 450px;
	caret-color: red;
	transition: width 0.4s linear;
}

.searchbar:hover>.search_icon {
	background: white;
	color: #e74c3c;
}

.search_icon {
	height: 40px;
	width: 40px;
	float: right;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	color: white;
}
/*/search style*/
.col-md-3 {
	width: 100%;
}

@media ( min-width :320px) {
	.intro-heading {
		margin-top: 15%;
		font-weight: 800;
		line-height: 95px;
		font-size: 30px;
		margin-bottom: 50px;
	}
	.intro-lead-in {
		margin-top: 15%;
		font-weight: 800;
		line-height: 95px;
		font-size: 15px;
		margin-bottom: 50px;
	}
	.mz-module {
		width: 300px;
	}
	#c2 {
		margin-left: 4%;
	}
	#starrating {
		CLEAR: both;
		PADDING-RIGHT: 0px;
		PADDING-LEFT: 0px;
		BACKGROUND: url(images/icon_star2_16.png) 0px 0px;
		FLOAT: left;
		PADDING-BOTTOM: 0px;
		MARGIN: 0px;
		WIDTH: 80px;
		PADDING-TOP: 0px;
		HEIGHT: 16px;
	}
	#starrating1 {
		PADDING-RIGHT: 0px;
		PADDING-LEFT: 0px;
		BACKGROUND: url(images/icon_star_16.png) 0px 0px;
		PADDING-BOTTOM: 0px;
		MARGIN: 0px;
		PADDING-TOP: 0px;
		HEIGHT: 16px;
	}
	#stardiv {
		margin-top: 8%;
		margin-left: 10%;
	}
	#c1 {
		margin-left: 25%;
	}
	td {
		font-size: 20px;
	}
	#tdimg {
		width: 150px;
		height: 110px;
	}
	table {
		margin-top: 45%;
		margin-left: 10%;
	}
	#tdnum {
		font-size: 40px;
	}
	#ih {
		font-size: 30px;
	}
}

@media ( min-width :720px) {
	.intro-heading {
		margin-top: 8%;
		font-weight: 800;
		line-height: 95px;
		font-size: 50px;
		margin-bottom: 50px;
	}
	#c2 {
		margin-left: 18%;
	}
	td {
		font-size: 25px;
	}
	#tdimg {
		width: 100px;
		height: 100px;
	}
	table {
		margin-top: -7%;
		left: 20%;
	}
	#tdnum {
		font-size: 70px;
	}
	#ih {
		font-size: 50px;
	}
	#starrating {
		CLEAR: both;
		PADDING-RIGHT: 0px;
		PADDING-LEFT: 0px;
		BACKGROUND: url(images/icon_star2_24.png) 0px 0px;
		FLOAT: left;
		PADDING-BOTTOM: 0px;
		MARGIN: 0px;
		WIDTH: 120px;
		PADDING-TOP: 0px;
		HEIGHT: 24px;
	}
	#starrating1 {
		PADDING-RIGHT: 0px;
		PADDING-LEFT: 0px;
		BACKGROUND: url(images/icon_star_24.png) 0px 0px;
		PADDING-BOTTOM: 0px;
		MARGIN: 0px;
		PADDING-TOP: 0px;
		HEIGHT: 24px;
	}
	#stardiv {
		margin-top: 8%;
		margin-left: 8%;
	}
	.mz-module {
		width: 80%;
	}
}

@media ( min-width :1024px) {
	.intro-heading {
		margin-top: -8%;
		letter-spacing: 50px;
		font-size: 80px;
		font-weight: 800;
		line-height: 95px;
		font-size: 150px;
		margin-bottom: 100px;
	}
	#c2 {
		margin-left: 20%;
	}
	td {
		font-size: 60px;
	}
	#tdimg {
		width: 50px;
		height: auto;
	}
	table {
		margin-top: -7%;
		margin-left: 30%;
	}
	#tdnum {
		font-size: 100px;
	}
	#ih {
		font-size: 80px;
		margin-top: -3%;
	}
	#il {
		margin-top: -5%;
	}
	#starrating {
		CLEAR: both;
		PADDING-RIGHT: 0px;
		PADDING-LEFT: 0px;
		BACKGROUND: url(images/icon_star2.png) 0px 0px;
		FLOAT: left;
		PADDING-BOTTOM: 0px;
		MARGIN: 0px;
		WIDTH: 160px;
		PADDING-TOP: 0px;
		HEIGHT: 32px;
	}
	#starrating1 {
		PADDING-RIGHT: 0px;
		PADDING-LEFT: 0px;
		BACKGROUND: url(images/icon_star.png) 0px 0px;
		PADDING-BOTTOM: 0px;
		MARGIN: 0px;
		PADDING-TOP: 0px;
		HEIGHT: 32px;
	}
	#stardiv {
		margin-top: 8%;
		margin-left: 30%;
	}
	.mz-module {
		width: 80%;
	}
}

.star-rating {
	width: 205px;
	margin-top: -500%;
}

.star-rating, .star-rating span {
	display: inline-block;
	height: 39px;
	overflow: hidden;
	background: url(star.png);
}

.star-rating span {
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
}
</style>
<%
	GameName gn = new GameName();
	GameImg gi = new GameImg();
	GameStar gs = new GameStar();
	
	
	String src = "free";
	String imgsrc = "free_img";
	String starsrc = "free_star";
	gn.create(src);
	gi.create(imgsrc);
	gs.create(starsrc);
	
	/* 아이디 처리 구분 */
	
	String id = null; 	//회원 아이디
	//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
	MemberDAO mdao = new MemberDAO();
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
	
%>
</head>
<body id="page-top">


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
				<br> <a class="navbar-brand page-scroll" href="#page-top">GAME BORD</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right"
					style="display: inline-block;">
					<li class="hidden"><a href="#page-top"></a></li>
					<%
						if(id !=  null){  /*로그인 O 네비게이션바  */
					%>
					<li><a class="page-scroll" href="#page-top"><%=mdao.getNickuseid(id)%>님</a></li>
					<li><a class="page-scroll" href="#page-top">Home</a></li>
					<li><a class="page-scroll" href="#about">About</a></li>
					<li><a class="page-scroll" href="bbsAction.do">Comunity</a></li>
					<li><a href="reviewListAction.do?game_name='7개의 대죄'">GameRank()</a></li>
					<li><a class="page-scroll" href="logoutAction.do">Log out</a></li>
					<li><a class="page-scroll" href="mypage.jsp">My Page</a></li>
					<%
						}
						else if(id ==  null){ /*로그인 X 네비게이션바  */
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
	<br>

	<!-- Header -->
 <%--Search--%>
        <div class="container h-100">
            <div class="d-flex justify-content-center h-100">
                <div class="searchbar">
                    <input class="search_input" type="text" name="" placeholder="Search...">
                    <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
                </div>
            </div>
        </div>

    <%--./Search--%>


		<div class="container-fluid" style="padding-top: 80px">
			<div class="slider-container">
				<%-- style="margin-top:80px"--%>
				<div class="owl-slider owl-carousel">
					<div class="item">
						<div class="owl-slider-item">
							<img src="images/demo/slider-1.jpg" class="img-responsive"
								alt="portfolio">
							<div class="intro-text" id="intro">
								<div class="intro-heading">
									1 <img src="<%=gi.imgarr.get(0)%>">
								</div>
								<div class="intro-lead-in"><%=gs.stararr.get(0)%></div>

							</div>
						</div>
					</div>
					<div class="item">
						<div class="owl-slider-item">
							<img src="images/demo/slider-1.jpg" class="img-responsive"
								alt="portfolio">
							<div class="intro-text">
								<div class="intro-heading">
									2 <img src="<%=gi.imgarr.get(1)%>">
								</div>
								<div class="intro-lead-in"><%=gs.stararr.get(1)%></div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="owl-slider-item">
							<img src="images/demo/slider-1.jpg" class="img-responsive"
								alt="portfolio">
							<div class="intro-text">
								<div class="intro-heading">
									3 <img src="<%=gi.imgarr.get(2)%>">
								</div>
								<div class="intro-lead-in"><%=gs.stararr.get(2)%></div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</header>


	<%--About section--%>
	<section id="about" class="light-bg" style="vertical-align: center;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>Category</h2>
						<p>
							Nantes is a clean, responsive bootstrap template suitable for
							agencies, design studios, mobile apps or business sites. It uses
							the best clean SEO practices, and on top of that, it’s fast,
							simple, and easy to modify. <br>
							<strong>Nantes Is More Than A Theme, It’s A Powerful
								Design Tool</strong>
						</p>
					</div>
				</div>
			</div>
			<div class="row" id="c2">
				<!-- about module -->
				<div class="col-mid-3-1 text-center">
					<div class="col-md-3 text-center">
						<div class="mz-module">
							<div class="mz-module-about" style="color: mediumvioletred">
								<br> <i
									class="glyphicon glyphicon-equalizer color2 fa-5x ot-circle"></i><br>
								<h3>RANK</h3>
								<!--<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis</p>-->
							</div>
							<a href="Main.jsp" class="mz-module-button">more..</a>
						</div>
					</div>
					<!-- end about module -->
					<!-- about module -->
					<div class="col-md-3 text-center c2">
						<div class="mz-module">
							<div class="mz-module-about">
								<br> <i
									class="glyphicon glyphicon-hand-right color1 fa-5x ot-circle"></i><br>
								<!--fa fa-photo color2 ot-circle-->
								<h3>REVIEW</h3>
								<!--<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>-->
							</div>
							<a href="#" class="mz-module-button">more..</a>
						</div>
					</div>
					<!-- end about module -->
					<!-- about module -->
					<div class="col-md-3 text-center c2">
						<div class="mz-module">
							<div class="mz-module-about">
								<br> <i
									class="glyphicon glyphicon-list color4 fa-5x ot-circle"></i><br>
								<h3>BOARD</h3>
								<!--<p>Accusamus et iusto odio dignissimos ducimus qui blanditiis</p>-->
							</div>
							<a href="bbsAction.do" class="mz-module-button">more..</a>
						</div>
					</div>
					<!-- end about module -->
				</div>
			</div>
		</div>
		<!-- /.container -->
	</section>
	<%--/About section--%>


	<%--/Partners section--%>

	<section id="partners">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>New Top Games</h2>
						<p>Today's New</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="owl-partners owl-carousel">
						<%
							for (int p = 0; p < 15; p++) {
						%>
						<div class="item">
							<div class="partner-logo">
								<img src="<%=gi.imgarr.get(p)%>" alt="partners">
							</div>
							<br>
							<br>
							<br>
							<div class="partner-logo"
								style="font-size: 15px; text-align: left;"><%=gs.stararr.get(p)%>★
							</div>
						</div>
						<%
							}
						%>

					</div>
				</div>
			</div>
		</div>
	</section>
	<%--/Partners section--%>


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


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/cbpAnimatedHeader.js"></script>
	<script src="js/jquery.appear.js"></script>
	<script src="js/SmoothScroll.min.js"></script>
	<script src="js/theme-scripts.js"></script>
</body>
</html>
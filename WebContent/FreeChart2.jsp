<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="gamefile.GameInfor" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <link rel="stylesheet" href="css/custom.css" />
    <link
            href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
            rel="stylesheet">

    <style type="text/css">
    body{ align-content: center}
    tr{
        text-align:center}

    img{
        width:100px;
        height:100px;
    }
    .jumbotron{
        background: #ffc107;
    }
    input:-ms-input-placeholder{color:#a8a8a8;}
    .search{
        height:60px;
        width:650px;
        border:1px solid #1b5ac2;
        background:#ffffff;
       }
    input{
        font-size:20px;
        width:588px;
        height:100%;
        padding:10px;
        border:0px;
        outline:none;
        float:left;}
    button{
        width:60px;
        height:100%;
        border:0px;
        background:#1b5ac2;
        outline:none;
        float:right;
        color:#ffffff;}
tr,th{
text-align:center}

.star-rating { width:205px; }
.star-rating,.star-rating span { display:inline-block; height:39px; overflow:hidden; background:url(star.png)no-repeat; }
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }

                          a, a:hover {
                              color: #000000;
                              text-decoration: none;
                          }


</style>


</head>
<body id="page-top">
<%
    PrintWriter script = response.getWriter();

    String id = null;//회원 아이디

    String game_name = null;//게임 네임

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

    BoardDAO bdao = new BoardDAO();
    MemberDAO mdao = new MemberDAO();
%>

<!-- Navigation -->
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
                    <a class="page-scroll" href="#features">Sign in</a>
                </li>
                <li>
                    <a class="page-scroll" href="#portfolio">Sign up</a>
                </li>
                <li>
                    <a class="page-scroll" href="#partners">My Page</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<!-- Header -->
<header>

</header>

<br><br><br>

<%

String name=request.getParameter("name");
String img=request.getParameter("img");
String star=request.getParameter("star");
String info="gameinfo";
    GameInfor gi = new GameInfor();
    gi.create(info);

double sd=(Double.parseDouble(star)*20);
int si=(int)sd;
%>
<button class="btn btn-primary" style="color:gray;border-color: #FCBE03;text-align:center;background-color: #FCBE03;width:113px;padding-left:0px;" data-target="#myModal" data-toggle="modal">WRITE REVIEW</button>

<div class="container" style="margin-top:100px">

    <table class="table">
    <thead>
    <tr>
        <th colspan="9" style="text-align:left;height:60px; background-color:#5D5D5D;font-size:17px;color:white">GAME INFO</th>
    </tr>
    </thead>
    <tr align="center">
        <td style="font-size:20px;font-weight: bold; font-style: italic;" width="50px">
            <img src="<%=img%>" width="150px" height="150px"><br><br>
            <h4><%=name%></h4><br>
            <span class='star-rating'>
            <span style ="width:<%=sd%>%"><%--<h5><%=star %></h5>--%></span>
            </span>
        </td>
        <td><h4>
                <%for(int i=0;i<gi.infoarr.size();i++)
                {
                    %>
            <%=gi.infoarr.get(i)%>
            <%
                }%>
        </h4>
        </td>
    </tr>
    <tr><td colspan="9" style="text-align:right;"><a href="Main.jsp" style="text-align:right;color:grey;">순위 전체보기</a></td></tr>
</table>

</div>

<section class="section-cta">
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
<script src="js/jquery-3.4.1.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="js/bootstrap.js"></script>
<%
gi.clear();

%>

</body>
</html>
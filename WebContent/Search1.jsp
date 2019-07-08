<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="java.util.ArrayList"%>

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

    <style>

        tr{
            text-align:center}
        table{

        }

        img{
            width:100px;
            height:100px;
        }
        input:-ms-input-placeholder{color:#a8a8a8;}
        .search{
            height:60px;
            width:650px;
            border:1px solid #1b5ac2;
            background:#ffffff;}
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
        .jumbotron{
            background: #ffc107;
        }
    </style>

</head>
<body id="page-top">
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
    <div class="container-fluid">
        <div class="slider-container">

            <div class="owl-slider owl-carousel">
                <div class="item">
                    <div class="owl-slider-item">
                        <img src="images/demo/slider-1.jpg" class="img-responsive" alt="portfolio">
                        <div class="intro-text">
                            <div class="intro-lead-in">We are the number one</div>
                            <div class="intro-heading">Design & Development Agency</div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="owl-slider-item">
                        <img src="images/demo/slider-1.jpg" class="img-responsive" alt="portfolio">
                        <div class="intro-text">
                            <div class="intro-lead-in">We are the number one</div>
                            <div class="intro-heading">Design & Development Agency</div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="owl-slider-item">
                        <img src="images/demo/slider-1.jpg" class="img-responsive" alt="portfolio">
                        <div class="intro-text">
                            <div class="intro-lead-in">We are the number one</div>
                            <div class="intro-heading">Design & Development Agency</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</header>


<br><br><br>
<div align=center>

    <br><br><br><br><br><br>
    <div class="container">
        <table class="table">
            <thead>
            <tr style="text-align:left;height:60px; background-color:#fec503;font-size:17px;border-color: #1a1a1a">
                <th colspan="9" style="text-align:left;height:60px; background-color:#5D5D5D;font-size:17px;color:white;">SELECTED GAME</th>
            </tr>
            </thead>
            <%
                GameName gn=new GameName();
                GameImg gi=new GameImg();
                GameStar gs=new GameStar();
                String src="free";
                String imgsrc="free_img";
                String starsrc="free_star";
                gn.create(src);
                gi.create(imgsrc);
                gs.create(starsrc);
                /*String searchname=(String)request.getParameter("search");*/
                String name = (String)request.getParameter("search");
                //String img = (String)request.getParameter("img");
                //String star = (String)request.getParameter("star");
                /* System.out.print(searchname);*/


            %>
            <tr align=center>
                <td style="font-size:20px;font-weight: bold; font-style: italic;" width="10%"><%=1%></td>
                <%for(int i=0;i<gn.namearr.size();i++){
                    if(gn.namearr.get(i).equals(name)){
                %>
                <td style="font-size:20px;font-weight: bold; font-style: italic;" width="10%"><img src="<%=gi.imgarr.get(i)%>"></td>
                <td style="text-align:left;font-size:20px;font-weight: bold; font-style: italic;" width="80%"><a href="FreeChart2.jsp?name=<%=gn.namearr.get(i)%>&img=<%=gi.imgarr.get(i)%>&star=<%=gs.stararr.get(i)%>" style="color:black;"><%=gn.namearr.get(i)%></a></td>
                <%
                            break;
                        }

                    }
                %>
            </tr>
            <tr><td colspan="9" style="text-align:right;"><a href="Main.jsp" style="text-align:right;color:grey;">순위 전체보기</a></td></tr>
        </table>

        <div style="top:-700px; margin-left:100px; width:600px;height:500px; overflow:hidden;margin:auto">
        </div>
    </div>
</div>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
    function moreinfo(){
        var input = document.getElementById("search").value;

        window.location.href="FreeChart.jsp?name="+input

    }
    var arr = new Array();

    <%for(int j=0;j<50;j++){%>
    arr[<%=j%>]='<%=gn.namearr.get(j)%>';

    <%}%>
    $("#search").autocomplete({

        source: arr,

        select: function(event, ui) {

            console.log(ui.item);

        },

        focus: function(event, ui) {

            return false;

            //event.preventDefault();

        }

    });

</script>

<script src="js/bootstrap.js"></script>

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
<%
    gn.clear();
    gi.clear();
    gs.clear();
%>
</body>
</html>
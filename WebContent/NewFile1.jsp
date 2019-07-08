<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <a href="#" class="navbar-brand">Gevolution</a>
        <!-- Toggle Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" onclick="moreinfo()">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item"><a href="#" class="nav-link">공지사항</a></li>
                <li class="nav-item"><a href="#" class="nav-link">갤러리</a></li>
                <li class="nav-item"><a href="#" class="nav-link">앨범</a></li>
                </ul>
         	<ul class="nav justify-content-end">
                <li class="nav-item" style="text-align:right;"><a href="#" class="nav-link">sign in</a></li>
                <li class="nav-item" style="text-align:right;"><a href="#" class="nav-link">sign up</a></li>
                <li class="nav-item" style="text-align:right;"><a href="#" class="nav-link">mypage</a></li>
                
            </ul>
        </div>
    </nav>


<div class="jumbotron text-center">
        <h1>Gevolution</h1>
        
</div>
<br><br><br>
<div align=center>
<div class="search">
<input type="text" id="search"name="search" placeholder="search">
<button><img src="search.png" style="width:25px; height:25px;" onclick="moreinfo()"></button>
</div>
<br><br><br><br><br><br>
<div class="container">

<table class="table">
<thead>
<tr>

<th colspan="3" style="text-align:left;height:60px; background-color:#EEEEEE;font-size:17px;">구글플레이스토어</th>
<th colspan="3" style="text-align:left;height:60px; background-color:#EEEEEE;font-size:17px;">애플스토어</th>
</tr>
</thead>
<tr align=center>
<%
	GameName gn=new GameName();
	GameImg gi=new GameImg();
	GameStar gs=new GameStar();
	String [] src={"free","charged","bestseller"};
	String [] imgsrc={"free_img","charged_img","bestseller_img"};
	String [] starsrc={"free_star","charged_star","bestseller_star"};
	String [] name=new String[150];
	String [] img=new String[150];
	String [] star=new String[150];
	
	for(int i=1;i<=3;i++){
		int k=0;
		gn.create(src[i-1]);
		gi.create(imgsrc[i-1]);
		gs.create(starsrc[i-1]);
		out.println(src[i-1]);
	for(int j=50*(i-1);j<50*i;j++){
		
		out.println(gn.namearr.get(k));
	name[j]=gn.namearr.get(k);
	img[j]=gn.imgarr.get(k);
	star[j]=gn.stararr.get(k);
	k++;
	}
	}
	out.println(name[1]);
	out.println(name[51]);
	
for(int i=1,j=50,k=100;i<=50;i++){
%><tr>
<%if(i<=3){ %>
<td style="color:red;font-size:20px;font-weight: bold; font-style: italic;">
<%}else{ %>
<td style="font-size:20px;font-weight: bold; font-style: italic;">
<%}%><%=i%></td>
<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(i-1)%>&img=<%=gi.imgarr.get(i-1)%>&star=<%=gs.stararr.get(i-1)%>"><img src="<%=gi.imgarr.get(i-1)%>"></a></td>
<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(i-1)%>&img=<%=gi.imgarr.get(i-1)%>&star=<%=gs.stararr.get(i-1)%>" style="color:black;"><%=gn.namearr.get(i-1) %></a></td>

<%if(i<=3){ %>
<td style="color:red;font-size:20px;font-weight: bold; font-style: italic;">
<%}else{ %>
<td style="font-size:20px;font-weight: bold; font-style: italic;">
<%}%><%=i%></td>
<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(j)%>&img=<%=gi.imgarr.get(j)%>&star=<%=gs.stararr.get(j)%>"><img src="<%=gi.imgarr.get(j)%>"></a></td>
<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(j)%>&img=<%=gi.imgarr.get(j)%>&star=<%=gs.stararr.get(j)%>" style="color:black;"><%=gn.namearr.get(j) %></a></td>

<%if(i<=3){ %>
<td style="color:red;font-size:20px;font-weight: bold; font-style: italic;">
<%}else{ %>
<td style="font-size:20px;font-weight: bold; font-style: italic;">
<%}%><%=i%></td>
<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(k)%>&img=<%=gi.imgarr.get(k)%>&star=<%=gs.stararr.get(k)%>"><img src="<%=gi.imgarr.get(k)%>"></a></td>
<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(k)%>&img=<%=gi.imgarr.get(k)%>&star=<%=gs.stararr.get(k)%>" style="color:black;"><%=gn.namearr.get(k) %></a></td>


<%j++;k++;} %>



</tr>

</table>
</div>
</div>
	<script src="js/jquery-3.4.1.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>
</body>
</html>
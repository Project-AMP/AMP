<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보_사이드바</title>
   <!-- Bootstrap CSS CDN -->
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="resources/CSS/academy/main/class_sidebar.css">
<style type="text/css">
li { list-style: none }
</style>
</head>
<body>
<script>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("myinfoMain")){ %>
var Colorset = document.getElementById("Colorset1");
Colorset1.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("myinfo_classcheck")){ %>
var Colorset = document.getElementById("Colorset2");
Colorset2.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("myinfo_completeclasscheck")){ %>
var Colorset = document.getElementById("Colorset3");
Colorset3.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("myinfo_coupon")){ %>
var Colorset = document.getElementById("Colorset4");
Colorset4.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("myinfo_payment")){ %>
var Colorset = document.getElementById("Colorset5");
Colorset5.style.backgroundColor = "#808080"
<% }%>

</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>

    <div class="wrapper">
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>메뉴</h3>
            </div>
            <ul class="list-unstyled components">
            	<div class="noclick"><h3>내 정보</h3></div>
               		<ul class="Sub_menu">
	                	<li id="Colorset1"><a href="myinfoMain">내 정보</a></li>
	                </ul>
	            <div class="noclick"><h3>내 강의</h3></div>
               		<ul class="Sub_menu">
	                	<li id="Colorset2"><a href="myinfo_classcheck">수강 현황</a></li>
	                	<li id="Colorset3"><a href="myinfo_completeclasscheck">이전 수강 내역</a></li>
	                </ul>
	            <div class="noclick"><h3>쿠폰</h3></div>
               		<ul class="Sub_menu">
	                	<li id="Colorset4"><a href="myinfo_coupon">쿠폰</a></li>
	                </ul>
	            <div class="noclick"><h3>결제내역</h3></div>
               		<ul class="Sub_menu">
	                	<li id="Colorset5"><a href="myinfo_payment">결제내역</a></li>
	                </ul>
	            
            </ul>
        </nav>
    </div>
    
</body>
</html>
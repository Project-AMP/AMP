<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사/수강생 관리 (승인/탈퇴)</title>
   <!-- Bootstrap CSS CDN -->
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="resources/CSS/academy/main/class_sidebar.css">
<style type="text/css">


</style>
</head>
<body>
<script>
<%-- <%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("myclass")){ %>
var Colorset = document.getElementById("Colorset1");
Colorset1.style.backgroundColor = "#808080"
<% }%> --%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("classcheck")){ %>
var Colorset = document.getElementById("Colorset1");
Colorset1.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("completeclasscheck")){ %>
var Colorset = document.getElementById("Colorset2");
Colorset2.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("coupon")){ %>
var Colorset = document.getElementById("Colorset3");
Colorset3.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("payment")){ %>
var Colorset = document.getElementById("Colorset4");
Colorset4.style.backgroundColor = "#808080"
<% }%>
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<% String academyidx = request.getParameter("academyidx"); %>

    <div class="wrapper">
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>메뉴</h3>
            </div>
            <ul class="list-unstyled components">
            
			<%-- <div class="noclick"><h3>수강 현황</h3></div>
            <ul class="Sub_menu">
        		<li id="Colorset1"><a href="myclass?academyidx=<%=academyidx%>">내 강의</a></li>
        	</ul> --%>
        	<div class="noclick"><h3>내 강의</h3></div>
                <ul class="Sub_menu">
					<li id="Colorset1"><a href="classcheck?academyidx=<%=academyidx%>">수강 현황</a></li>
                    <li id="Colorset2"><a href="completeclasscheck?academyidx=<%=academyidx%>">이전 수강 내역</a></li>
                </ul>
            <div class="noclick"><h3>쿠폰</h3></div>
                <ul class="Sub_menu">    
            		<li id="Colorset3"><a href="coupon?academyidx=<%=academyidx%>">쿠폰</a></li>
            	</ul>
            	
             <div class="noclick"><h3>결제내역</h3></div>
                <ul class="Sub_menu"> 	
            		<li id="Colorset4"><a href="payment?academyidx=<%=academyidx%>">결제내역</a></li>
            	</ul>
            </ul>
            	

        </nav>
    </div>
    
</body>
</html>
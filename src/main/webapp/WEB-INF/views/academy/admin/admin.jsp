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
li { list-style: none }
</style>
</head>
<body>
<script>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("rim")){ %>
var Colorset = document.getElementById("Colorset1");
Colorset1.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("classList")){ %>
var Colorset = document.getElementById("Colorset2");
Colorset2.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("consultList")){ %>
var Colorset = document.getElementById("Colorset3");
Colorset3.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("paymentList")){ %>
var Colorset = document.getElementById("Colorset4");
Colorset4.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("couponList")){ %>
var Colorset = document.getElementById("Colorset5");
Colorset5.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("admin_platform")){ %>
var Colorset = document.getElementById("Colorset6");
Colorset6.style.backgroundColor = "#808080"
<% }%>
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<% String academyidx = request.getParameter("academyidx"); %>
    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>관리자 메뉴</h3>
            </div>

            <ul class="list-unstyled components">
                <li id="Colorset1"><a href="rim?academyidx=<%=academyidx%>">강사/수강생 관리</a></li>
                <li id="Colorset2"><a href="classList?academyidx=<%=academyidx%>">수강 정보 관리</a></li>
				<li id="Colorset3"><a href="consultList?academyidx=<%=academyidx%>">수강 상담 관리</a></li>
				<li id="Colorset4"><a href="paymentList?academyidx=<%=academyidx%>">결제 관리</a></li>
				<li id="Colorset5"><a href="couponList?academyidx=<%=academyidx%>">쿠폰 관리</a></li>
            	<li id="Colorset6"><a href="admin_platform?academyidx=<%=academyidx%>">플랫폼 관리</a></li>
            </ul>
        </nav>
    </div>
</body>
</html>
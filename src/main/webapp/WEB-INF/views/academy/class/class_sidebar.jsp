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
<%-- <%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("classcheck")){ %>
var Colorset = document.getElementById("Colorset1");
Colorset1.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("completeclasscheck")){ %>
var Colorset = document.getElementById("Colorset2");
Colorset2.style.backgroundColor = "#808080"
<% }%> --%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("registration")){ %>
var Colorset = document.getElementById("Colorset3");
Colorset3.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("registration_teacher")){ %>
var Colorset = document.getElementById("Colorset4");
Colorset4.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("consult")){ %>
var Colorset = document.getElementById("Colorset5");
Colorset5.style.backgroundColor = "#808080"
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
            
               <%--  <div class="noclick"><h3>수강 현황</h3></div>
                <ul class="Sub_menu">
					<li id="Colorset1"><a href="classcheck?academyidx=<%=academyidx%>">수강 현황</a></li>
                    <li id="Colorset2"><a href="completeclasscheck?academyidx=<%=academyidx%>">완료된 강의</a></li>
                </ul> --%>
                

                	<li id="Colorset3"><a href="registration?academyidx=<%=academyidx%>">수강 신청</a></li>
                	<li id="Colorset5"><a href="consult?academyidx=<%=academyidx%>">수강 상담</a></li>
                	<li id="Colorset4"><a href="registration_teacher?academyidx=<%=academyidx%>">강사 소개</a></li>

            	
            </ul>
        </nav>
    </div>
    
</body>
</html>
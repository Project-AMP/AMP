<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티_사이드바</title>
   <!-- Bootstrap CSS CDN -->
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="resources/CSS/academy/main/class_sidebar.css">
<style type="text/css">
li { list-style: none }
</style>
</head>
<body>
<script>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("communityMain")){ %>
var Colorset = document.getElementById("Colorset1");
Colorset1.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("communityMain")){ %>
var Colorset = document.getElementById("Colorset2");
Colorset2.style.backgroundColor = "#808080"
<% }%>
<%if(request.getParameter("bgColorSet")!=null&&request.getParameter("bgColorSet").equals("communityMain")){ %>
var Colorset = document.getElementById("Colorset3");
Colorset3.style.backgroundColor = "#808080"
<% }%>
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>

    <div class="wrapper">
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>메뉴</h3>
            </div>
            <ul class="list-unstyled components">
                	<li id="Colorset1"><a href="communityMain">커뮤니티 예시1</a></li>
                	<li id="Colorset2"><a href="communityMain">커뮤니티 예시2</a></li>
                	<li id="Colorset3"><a href="communityMain">커뮤니티 예시3</a></li>
            </ul>
        </nav>
    </div>
    
</body>
</html>
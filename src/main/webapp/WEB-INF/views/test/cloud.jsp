<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라우드</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#container{
border:1px solid black; 
text-align: center;
}
#cloud_container{
border: 1px solid red;
width: calc( 100% - 300px); 
width: 860px;
min-width:600px; 
float: left;
}


</style>
</head>
<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar','#topBarDiv');</script>

<div class="Biggroup">
<div class="Smallgroup">

<%-- <div id="class_sidebarDiv"></div><script type="text/javascript">ajaxDo('class_sidebar?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=registration_teacher','#class_sidebarDiv');</script> --%>		
		
		<div id="cloud_container">
		<div id="container">
			클라우드

		</div>
	</div>
</div>
</div>

<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
</body>
</html>
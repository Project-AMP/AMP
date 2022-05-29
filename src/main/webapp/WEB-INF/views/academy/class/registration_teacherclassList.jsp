<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#registration_teacherclassList_div{
border:1px solid black;
width: 400px;
text-align: center;
}
.btn_close {
vertical-align: middle;
display: inline-block;
line-height: 1;
cursor: pointer; 
padding: 8px 12px;
transition: all 0.3s;
box-shadow: inset 0 1px 0 rgba(255,255,255,.2);
text-shadow: 0 -1px 0 rgba(0,0,0,.4);
border-radius: 6px;
font-size: 15px;
text-transform: uppercase;
border-style: solid;
border-width: 1px;
width: 100px;
height: 40px;
margin-bottom:10px;
}
</style>
</head>
<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv" style="display:none"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>
	<div id="registration_teacherclassList_div">
		<div id="teacher_name_div" style="border:1px solid black; margin:10px;">이름</div>
		
		<div id="classList" style="border:1px solid black; margin:10px;">
		강의 목록_리스트 형식(카테고리, 과목, 수강시간)
		</div>
		
		<div id="close">
			<input type="submit" class="btn_close" value="닫기">
		</div>
	</div>
</body>
</html>
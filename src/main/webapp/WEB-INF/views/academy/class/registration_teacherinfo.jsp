<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#registration_teacherinfo_div{
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
	<div id="registration_teacherinfo_div">
		<div id="teacher_name_div" style="border:1px solid black; margin:10px;">이름</div>
		
		<div id="teacher_study_div" style="border:1px solid black; margin:10px;">학력
			<div id="teacher_study" style="border:1px solid black; margin:10px;">내용</div></div>
		
		<div id="teacher_career_div" style="border:1px solid black; margin:10px;">주요 경력 사항
			<div id="teacher_career" style="border:1px solid black; margin:10px;">내용</div></div>
	
		<div id="teacher_class_div" style="border:1px solid black; margin:10px;">주요 강의 이력
			<div id="teacher_class" style="border:1px solid black; margin:10px;">내용</div></div>
	
		<div id="close">
			<input type="submit" class="btn_close" value="닫기">
		</div>
	</div>
</body>
</html>
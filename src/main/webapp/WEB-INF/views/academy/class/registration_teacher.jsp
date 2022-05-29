<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 소개</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#container{
border:1px solid black; 
text-align: center;
}
#registration_teacher_container{
border: red 1px solid;
width: calc( 100% - 300px); 
width: 860px;
min-width:600px; 
float: left;
}
.registration_teacher_div{
width: 250px;
height: 210px;
border:black 1px solid;
display:inline-block;
}
.teacherphoto{
border: 1px solid red; 
width:150px; 
height:150px;
display:inline-block;
}
.btn_teacher{
display: inline-block;
}
.btn_classList, .btn_teacherinfo {
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
width: 90px;
height: 30px;
}
</style>
</head>
<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>
<% String academyidx = request.getParameter("academyidx"); %>
<div class="Biggroup">
<div class="Smallgroup">

<div id="class_sidebarDiv"></div><script type="text/javascript">ajaxDo('class_sidebar?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=registration_teacher','#class_sidebarDiv');</script>			
		
		<div id="registration_teacher_container">
		<div id="container">
		<span style="font-size:35px;">강사 조회</span><br><br>
			<div class="registration_teacher_div" style="border: 1px solid green">
			<div class="teacherphoto">
				<img src="resources/CSS/academy/teacher/teacher1.jpg" alt=""></div>
				<div>보노보노 강사님</div>
				<div style="border:1px solid blue"><div class="btn_teacher">
				<!-- <input type="submit" class="btn_classList" value="강의 목록">
				<input type="submit" class="btn_teacherinfo" value="강사 소개"> -->
				<a href="registration_teacherclassList?academyidx=<%=academyidx%>">강의 목록</a>
				<a href="registration_teacherinfo?academyidx=<%=academyidx%>">강사 소개</a>
				</div></div>
			</div>
			
			<div class="registration_teacher_div">
			<div class="teacherphoto">
				<img src="resources/CSS/academy/teacher/teacher2.jpg" alt=""></div>
				<div>포로리 강사님</div>
				<div style="border:1px solid blue"><div class="btn_teacher">
				<!-- <input type="submit" class="btn_classList" value="강의 목록">
				<input type="submit" class="btn_teacherinfo" value="강사 소개"> -->
				<a href="registration_teacherclassList?academyidx=<%=academyidx%>">강의 목록</a>
				<a href="registration_teacherinfo?academyidx=<%=academyidx%>">강사 소개</a>
				</div></div>
			</div>
			
			<div class="registration_teacher_div">
			<div class="teacherphoto">
				<img src="resources/CSS/academy/teacher/teacher3.jpg" alt=""></div>
				<div>너부리 강사님</div>
				<div style="border:1px solid blue"><div class="btn_teacher">
				<!-- <input type="submit" class="btn_classList" value="강의 목록">
				<input type="submit" class="btn_teacherinfo" value="강사 소개"> -->
				<a href="registration_teacherclassList?academyidx=<%=academyidx%>">강의 목록</a>
				<a href="registration_teacherinfo?academyidx=<%=academyidx%>">강사 소개</a>
				</div></div>
			</div>

			<!-- <div id="test_div"  class="registration_teacher_div">강사사진넣을div</div>
			<div id="test_div"  class="registration_teacher_div">강사사진넣을div</div>
			<div id="test_div"  class="registration_teacher_div">강사사진넣을div</div>
			<div id="test_div"  class="registration_teacher_div">강사사진넣을div</div>
			<div id="test_div"  class="registration_teacher_div">강사사진넣을div</div>
			<div id="test_div"  class="registration_teacher_div">강사사진넣을div</div> -->
		</div>
	</div>
</div>
</div>

<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
</body>
</html>
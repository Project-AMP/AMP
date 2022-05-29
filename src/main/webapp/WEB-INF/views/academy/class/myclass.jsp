<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<link rel="stylesheet" href="resources/CSS/academy/main/footer.css" type="text/css">
<style type="text/css">
	#myclass_container{
border: 1px solid red;
}
	#myclass_div{
	border:1px solid black;
	width: 800px;
	padding : 30px;
	text-align: center;
	}
	#check_container{
	width: 500px; height: 200px; border: 1px solid black;
	margin: auto;
	}
	#class_member_container{
	width: 500px; height: 200px; border: 1px solid black;
		margin: auto;
	}
</style>
</head>
<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>
<div class="Biggroup">
<div class="Smallgroup">

<div id="my_info_sidebarDiv"></div><script type="text/javascript">ajaxDo('my_info_sidebar?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=myclass','#my_info_sidebarDiv');</script>
	<div id="myclass_container">
		<div id="myclass_div">
			<h2>내강의</h2>
			수강중인 강의
			<select>
				<option>강의</option>
				<option>강의</option>
				<option>강의</option>
			
			</select>
			<br>
			수강시간
			<select>
				<option>시간</option>
			</select>
			<br>
			<br>
			<br>
			출결사항
			<div id="check_container"></div>
			<br>
			수강생목록
			<div id="class_member_container"></div>
		</div>
	</div>
</div>
</div>
<footer id="footer">
footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다
 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 
 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 
 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 footer 입니다 
</footer>
</body>
</html>
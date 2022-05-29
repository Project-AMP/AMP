<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보_문자 서비스</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#container{
}
#myinfoMain_container{
width: calc( 100% - 300px); 
width: 860px;
min-width:600px; 
float: left;
}
.myinfo_mms_h2{
color: #1a1a1a;
font-weight: bold;
font-size: 18px;
line-height: 30px;
letter-spacing: -2px;
margin: 20px 10px 12px;
}
.myinfo_mms_div{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
width: 800px;
margin:auto;
padding:20px 0 0 20px;
text-align: center;
}

</style>
</head>
<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar','#topBarDiv');</script>

<div class="Biggroup">
	<div class="Smallgroup">
		<div id="myinfo_sidebarDiv"></div>
			<script type="text/javascript">ajaxDo('myinfo_sidebar? &bgColorSet=myinfo_mms','#myinfo_sidebarDiv');
		</script>

		<div id="myinfoMain_container">
		<div id="container">
		<div class="myinfo_mms_h2"><h2>문자 서비스</h2></div>
		<div class="myinfo_mms_div">
			<h2>설정된 번호</h2>
			<table id='table' style="width: 98%; border-collapse: collapse; margin:auto;border:solid black 1px; border-bottom:0px;margin: 10px 0 10px 0;font-size: 19px;">
					<tr style="background-color: #333; color:white; height: 32px; font-size:20px;border-bottom:1px solid black;">
						<td>분류</td>
						<td>번호</td>
						<td>변경</td>						
						<td>삭제</td>						
					</tr>
					<tr style="border-bottom:1px solid black;">
						<td>학생</td>
						<td>010-4520-7141</td>
						<td><input type="button" value="변경"></td>
						<td><input type="button" value="삭제"></td>
					</tr>
					<tr style="border-bottom:1px solid black;">
						<td>부</td>
						<td>010-4520-7142</td>
						<td><input type="button" value="변경"></td>
						<td><input type="button" value="삭제"></td>
					</tr>
					<tr style="border-bottom:1px solid black;">
						<td>모</td>
						<td>010-4520-7143</td>
						<td><input type="button" value="변경"></td>
						<td><input type="button" value="삭제"></td>
					</tr>
			</table>
			
			<!-- <h2>번호 등록</h2>
			<div style="width: 330px; margin: auto; margin:15px auto; text-align: left;font-size: 20px;">
				분류 :  <input type="text"> <br>
				번호  : <input type="text"> <input type="button" value="인증번호 "><br>
				인증번호 :  <input type="text"> <input type="button" value="인증확인"><br>
				<div style="width: 100%; text-align: center;margin-top: 15px;"><input type="button" value="등록" disabled="disabled" style="margin: auto ; font-size: 20px;padding: 3px 6px;"></div>
			</div> -->
			
			<div>
				<img style="width: 5%; height: 5%; margin-bottom: 10px; cursor: pointer;" alt="" src="resources/IMG/main/more.png">
			</div>
			
		</div>
		</div>
	</div>
</div>
</div>

<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
</body>
</html>
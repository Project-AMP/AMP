<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#container{
}
#timetable_container{
width: calc( 100% - 300px); 
width: 860px;
min-width:600px; 
float: left;
}
.timetable_h2{
color: #1a1a1a;
font-weight: bold;
font-size: 18px;
line-height: 30px;
letter-spacing: -2px;
margin: 20px 10px 12px;
}
.timetable_div{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
width: 800px;
padding: 30px;
text-align: center;
}
#time_table{
border-collapse : collapse;
}
#time_table td{
	border:0.4px solid black;
	

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
		
		<div id="timetable_container">
		<div id="container">
		<div class="timetable_h2"><h2>시간표</h2></div>
		<div class="timetable_div">
			<table id="time_table" style=" width: 100%;">
				<tr>
					<th>시간</th>
					<th width="100px">월</th>
					<th width="12%">화</th>
					<th width="12%">수</th>
					<th width="12%">목</th>
					<th width="12%">금</th>
					<th width="12%">토</th>
					<th width="12%">일</th>
				</tr>
				<tr>
					<td>0시-1시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>1시-2시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>2시-3시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>3시-4시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>4시-5시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>5시-6시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>6시-7시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>7시-8시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>8시-9시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>9시-10시</td>
					<td rowspan="2" style="background-color: #f0ef9e;">HTML/CSS</td>
					<td rowspan="2" style="background-color: #f0ef9e;">HTML/CSS</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>10시-11시</td>
					
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>11시-12시</td>
					<td rowspan="2" style="background-color:#aac9fa">엔터프라이즈웹</td>
					<td></td>
					<td rowspan="2" style="background-color:#aac9fa">엔터프라이즈웹</td>
					<td></td>
					<td></td>
					<td rowspan="2" style="background-color:#aac9fa">엔터프라이즈웹</td>
					<td rowspan="2" style="background-color:#aac9fa">엔터프라이즈웹</td>
				</tr>
				<tr>
					<td>12시-13시</td>
					<td></td>
					<td></td>
				
				</tr>
				<tr>
					<td>13시-14시</td>
					<td></td>
					<td rowspan="2" style="background-color: #bcf7dc">고급 일본어</td>
					<td></td>
					<td></td>
					<td></td>
					<td rowspan="2" style="background-color: #bcf7dc">고급 일본어</td>
					<td></td>
				</tr>
				<tr>
					<td>14시-15시</td>
					
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>15시-16시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>16시-17시</td>
					<td rowspan="2" style="background-color:#fab291;">C#프로그래밍</td>
					<td rowspan="2" style="background-color: #ecbcf7">운영체제</td>
					<td rowspan="2" style="background-color:#fab291;">C#프로그래밍</td>
					<td></td>
					<td rowspan="2" style="background-color:#fab291;">C#프로그래밍</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>17시-18시</td>
				
				
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>18시-19시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>19시-20시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>20시-21시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>21시-22시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>22시-23시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>23시-24시</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
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
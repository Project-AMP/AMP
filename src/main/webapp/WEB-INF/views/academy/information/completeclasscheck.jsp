<%@page import="com.jj.vo.ClassVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%ArrayList<ClassVo> list=(ArrayList<ClassVo>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이전 수강 내역</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#completeclasscheck_div{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
	width: 800px;
	padding : 30px;
	text-align: center;
	}
#completeclasscheck_container{
/* border: 1px solid red; */
}
#table td{
	border-bottom:1px solid black;

		padding: 3px 0;
}
</style>
</head>
<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>

<div class="Biggroup">
<div class="Smallgroup">

<div id="my_info_sidebarDiv"></div><script type="text/javascript">ajaxDo('my_info_sidebar?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=completeclasscheck','#my_info_sidebarDiv');</script>
	<div id="completeclasscheck_container">
		<div id="completeclasscheck_div">
			<div style="width: 75%; border-bottom: 1px solid black;margin:-10px auto 30px auto;font-size: 24px;height: 60px;font-size: 35px; ">
				<span>완료된 강의</span><br>
			</div>
		<%
		int num=0;
			for(int i=0;i<list.size();i++){
				if(list.get(i).getFinished()==1)
					num++;
			}		
		
		%>
		<%if(list.size()==0||num==0){ %>	<!-- /* 리스트에 아무것도 안 들어있거나 현재진행 중인 강의가 없을때 */ -->
			수강 완료된 강의가 없습니다.
		<%}else{ %>
			<table id='table' style="width: 90%;border-collapse: collapse;margin:auto;	border:1px solid black; border-bottom: 0px;margin-bottom: 20px;">
				<tr style="background-color: #333;color:white; font-size: 17px; height: 32px;">
					<td>강의명</td>
					<td>시간</td>
					<td>강사</td>
					<td>강의실</td>
					<td>강의시작일</td>
					<td>강의종료일</td>
					<td>수강신청일</td>	
				</tr>
				
				<%for(int i=0;i<list.size();i++){ %>
					<%if(list.get(i).getFinished()==1){ %>
					
					<tr style="font-size: 17px; height:30px; ">
						<td><%=list.get(i).getName() %></td>
						<td><%=list.get(i).getTime() %></td>
						<td><%=list.get(i).getTeacher_name() %></td>
						<td><%=list.get(i).getRoom_name() %></td>
						<td><%=list.get(i).getS_date() %></td>
						<td><%=list.get(i).getE_date() %></td>
						<td><%=list.get(i).getDate() %></td>	
					<tr>
					
					<%} %>
				<%} %>
				
				</table>
			<%} %>
		</div>
	</div>
</div>
</div>
<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
</body>
</html>
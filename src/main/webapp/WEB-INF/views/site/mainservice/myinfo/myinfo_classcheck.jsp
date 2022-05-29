<%@page import="com.jj.vo.ClassVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%ArrayList<ClassVo> list=(ArrayList<ClassVo>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보_수강 현황</title>
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
.myinfo_classcheck_h2{
color: #1a1a1a;
font-weight: bold;
font-size: 18px;
line-height: 30px;
letter-spacing: -2px;
margin: 20px 10px 12px;
}
.myinfo_classcheck_div{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:40px;
width: 800px;
margin:auto;
text-align: center;
padding:20px 0 0 0;
}
#classcheck_div , #check_container{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
width: 800px;
/* padding : 30px; */
margin:auto;
text-align: center;
padding:20px 0 20px 0;
}
#classcheck_container{
/* border: 1px solid red; */
}
#classTable td{
	border-bottom:1px solid black;
		padding: 3px 0;
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
			<script type="text/javascript">ajaxDo('myinfo_sidebar? &bgColorSet=myinfo_classcheck','#myinfo_sidebarDiv');
		</script>

		<div id="myinfoMain_container">
		<div id="container">
		<div class="myinfo_classcheck_h2"><h2>수강 현황</h2>
		
	
		
		</div>
		<div class="myinfo_classcheck_div">
				
			<%
		int num=0;
			for(int i=0;i<list.size();i++){
				if(list.get(i).getFinished()==0)
					num++;
			}		
		
		%>
		<%if(list.size()==0||num==0){ %>	<!-- /* 리스트에 아무것도 안 들어있거나 현재진행 중인 강의가 없을때 */ -->
			수강중인 강의가 없습니다.
		<%}else{ %>
			<table id='classTable' style="width: 90%;border-collapse: collapse;margin:auto;	border:1px solid black; border-bottom:0;margin-bottom: 20px;">
				<tr style="font-size:17px; color:white;background-color: #333; height: 32px;">
					<td>학원명</td>
					<td>강의명</td>
					<td>시간</td>
					<td>강사</td>
					<td>강의실</td>
					<td>강의시작일</td>
					<td>강의종료일</td>
					
				</tr>
				
				<%for(int i=0;i<list.size();i++){ %>
					<%if(list.get(i).getFinished()==0){ %>
					
					<tr style="font-size: 17px; height:32px; cursor: pointer;" onclick='getCheck(<%=list.get(i).getIdx()%> , <%=list.get(i).getTeacher()%>);'>
						<td><a href='academyMain?academyidx=<%=list.get(i).getAcademy()%>'><%=list.get(i).getAcademy_name() %></a></td>
						<td><%=list.get(i).getName() %></td>
						<td><%=list.get(i).getTime() %></td>
						<td><%=list.get(i).getTeacher_name() %></td>
						<td><%=list.get(i).getRoom_name() %></td>
						<td><%=list.get(i).getS_date() %></td>
						<td><%=list.get(i).getE_date() %></td>
					
					<tr>
					
					<%} %>
				<%} %>
				
				</table>
			<%} %>
		</div>
		</div>
		<div id="check_container" style="display: none;">
			<div style="width: 75%; border-bottom: 1px solid black;margin:-10px auto 30px auto;font-size: 24px;height: 60px;font-size: 35px; ">
					<span>출결 관리</span><br>
			</div>
			<form name="saveForm" action="saveCheck">
				<div id="check_div"style="width: 95%; margin:auto;overflow: auto;"></div>
				<input id='saveButton' type="button" value="저장" onclick="to_ajax()">
				<div id="comCheckDiv" style="width: 100%; text-align: center; margin: 30px 0 0 0;"><span id='comCheckSpan' style="font-size: 28px"></span></div>
			</form>
			
		</div>
	</div>
</div>
</div>

<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
<script type="text/javascript">
function getCheck(idx,teacher){
	$("#check_container").show();
	var login_idx = '<%=session.getAttribute("idx")%>';
	if(teacher==login_idx){
		$("#saveButton").show();
		$("#comCheckDiv").hide();
		ajaxDo('getTCheckKit?classIdx='+idx,'#check_div');
	}else{
		$("#saveButton").hide();
		$("#comCheckDiv").show();
		
		ajaxDo('getCheckKit?classIdx='+idx,'#check_div');
		if($('#comCheck').val())
			$("#comCheckSpan").html('출석률 : '+$('#comCheck').val());
		else
			$("#comCheckSpan").html('');
	}
	
}
</script>
</body>
</html>
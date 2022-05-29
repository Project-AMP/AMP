<%@page import="java.util.ArrayList"%>
<%@page import="com.jj.vo.MyAlarmListVo"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<MyAlarmListVo> myAlarmlist = (ArrayList<MyAlarmListVo>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#alarmList{
		height : 300px;
	 	overflow: auto;
	 	
	}
	
	#alarmTd{
		cursor: pointer;
		padding: 5px;	
		
	}
	#alarmTd:hover{
		background-color: gray;
	}
	.alTable{
		border-collapse : collapse;
		border: 0.5px solid black;
		border-right: 0px;
		border-left:0px;
		
	}
</style>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<body>
	
	<div id="alarmList" class="col-sm-12">
		<table class='alTable' style="width: 100%;">
		<% for(int i=0; i<myAlarmlist.size(); i++){  %>
			<%-- <div style="font-size: 13px;"><%= myAlarmlist.get(i) %></div> --%>
		
				<tr class='alTable' >
					<td class='alTable'  id='alarmTd' onclick='goNotice(<%=myAlarmlist.get(i).getAcademy() %>,<%=myAlarmlist.get(i).getNotice_idx()%>)' style="padding: 5px 5px;	">
					<b><%= myAlarmlist.get(i).getNotice_academy_name() %> </b>
					<br> 
					<%=myAlarmlist.get(i).getNotice_title() %>
					</td>
				</tr>
			
		<%} %>
		</table>
	</div>
	<script type="text/javascript">
		function goNotice(academy,notice){
				location.href='notice_detail.do?academyidx='+academy+'&idx='+notice;
			}
	</script>
</body>
</html>
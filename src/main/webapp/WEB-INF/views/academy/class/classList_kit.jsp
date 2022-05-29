<%@page import="com.jj.vo.ClassVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<ClassVo> list=(ArrayList<ClassVo>)request.getAttribute("list");%>
    <!-- c.idx,c.name,c.room,c.time,c.s_date,c.e_date,c.teacher,c.price,c.limited,c.kategorie,r.name as room_name,m.name as teacher_name -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>


<body>

<%if(list.size()==0){ %>	<!-- /* 리스트에 아무것도 안 들어있거나 현재진행 중인 강의가 없을때 */ -->
			 등록된 강의가  없습니다.
		<%}else{ %>
			<table id='table' style="width: 100%;border-collapse: collapse; margin:auto; text-align: center">
				<tr style="background-color: #333; font-size: 17px; color:white; height: 30px;">
				
					<td>강의명</td>
					<td>강사명</td>						
					<td>강의시간</td>
					<td>시작일</td>				
					<td>종료일</td>				
					<td>가격</td>
					<td>인원수제한</td>

				</tr>
		
				<%for(int i=0;i<list.size();i++){ %>
					
					<tr id='classTr<%=list.get(i).getIdx()%>' class='classTr' onclick="lineClicked(<%=list.get(i).getIdx()%>,
					                                                                               '<%=list.get(i).getName() %>',
					                                                                               '<%=list.get(i).getTeacher_name()%>',
					                                                                               '<%=list.get(i).getRoom_name() %>',
					                                                                               '<%=list.get(i).getTime()%>',
					                                                                               '<%=list.get(i).getS_date()%>',
					                                                                               '<%=list.get(i).getE_date() %>',
					                                                                               '<%=list.get(i).getPrice()%>' )" 
					                                                                               style="font-size: 16px; height: 30px; cursor: pointer;
					                                                                               border-bottom: 0.5px solid gray;">
						<td><%=list.get(i).getName() %></td>
						<td><%=list.get(i).getTeacher_name()%></td>	
						<td><%=list.get(i).getTime()%></td>
						<td><%=list.get(i).getS_date()%></td>
						<td><%=list.get(i).getE_date() %></td>
						<td><%=(list.get(i).getPrice()+"").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>원</td>
						<td><%=list.get(i).getLimited()%></td>
						
					<tr>

				<%} %>
				
				</table>
		<%} %>
</body>
</html>
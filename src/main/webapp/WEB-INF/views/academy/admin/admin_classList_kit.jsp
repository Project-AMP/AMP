<%@page import="com.jj.vo.ClassVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%ArrayList<ClassVo> list = (ArrayList<ClassVo>)request.getAttribute("adminClassList");%>
    
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
				<tr style="background-color: #333; color:white; height: 32px; font-size:15px;border-bottom:1px solid black;">
					<td></td>
					<td>선택</td>
					<td>강의명</td>					
					<td>요일 및 시간</td>
					<td>시작일</td>				
					<td>종료일</td>				
					<td>가격</td>
					<td>인원수 제한</td>
					<td>카테고리</td>
				</tr>
				
				<%for(int i=0;i<list.size();i++){ %>
					<tr id='classTr<%=list.get(i).getIdx()%>' class='classTr' onclick="lineClicked('<%=list.get(i).getIdx() %>',
																								   '<%=list.get(i).getName()%>',
					                                                                               '<%=list.get(i).getTime() %>',
					                                                                               '<%=list.get(i).getS_date()%>',
					                                                                               '<%=list.get(i).getE_date() %>',
					                                                                               '<%=list.get(i).getPrice()%>',
					                                                                               '<%=list.get(i).getLimited()%>',
					                                                                               '<%=list.get(i).getRoom() %>',
					                                                                               '<%=list.get(i).getTeacher() %>',
					                                                                               '<%=list.get(i).getKategorie() %>')"
					                                                                               
					                                                                               style=" height: 32px; font-size:15px;border-bottom:1px solid black;">
					                                                                               
						<td> <input type="hidden" name="checkbox_class_list_hidden" value="<%=list.get(i).getIdx()%>"> </td>
						<td> <input type="checkbox" id="checkbox_class" name="checkbox_class_list"> </td>
						<td><%=list.get(i).getName() %></td>
						<td><%=list.get(i).getTime()%></td>
						<td><%=list.get(i).getS_date() %></td>	
						<td><%=list.get(i).getE_date()%></td>
						<td><%=(list.get(i).getPrice()+"").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></td>
						<td><%=list.get(i).getLimited() %></td>
						<td><%=list.get(i).getKategorie()%></td>
						
					<tr>

				<%} %>
				
				</table>
		<%} %>
</body>
</html>
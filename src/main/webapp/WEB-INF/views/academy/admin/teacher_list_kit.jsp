<%@page import="java.util.List"%>
<%@page import="com.jj.vo.RimVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<RimVo> teacher_list = (ArrayList<RimVo>)request.getAttribute("teacher_list");
%>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		#teacher_list_Tr:hover{
			background: gray;
			cursor: pointer;
		}
	</style>
</head>
<body>
	
	<%if(teacher_list.size() == 0){ %>
			목록이 없습니다
			<%}else{ %>
				<table id="teacher_list_table" style="width: 100%;border-collapse: collapse; margin:auto; text-align: center;font-size: 16px;border-right: 1px solid black;border-left:1px solid black;">
					<tr style="background-color: #333; color:white; height: 32px; font-size:17px;border-bottom:1px solid black;  ">
						<td></td>
						<td>선택</td>
						<td>NO</td>
						<td>이름</td>
						<td>아이디</td>
						<td>전화번호</td>
						<td>이메일</td>
						<td>주소</td>
					</tr>
					<% for(int i = 0; i<teacher_list.size(); i++) {%>
						<tr id="teacher_list_Tr<%=i%>" style="height: 32px; font-size:17px;border-bottom:1px solid black;">
							<td><input type="hidden" name="checkbox_list_hidden" value="<%=teacher_list.get(i).getIdx()%>"/></td>
							<td><input type="checkbox" name="checkbox_list" onclick="check_bold()"></td>
							<td><%=i+1%></td>
							<td><%=teacher_list.get(i).getName()%></td>
							<td><%=teacher_list.get(i).getId()%></td>
							<td><%=teacher_list.get(i).getPhone().replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3")%></td>
							<td><%=teacher_list.get(i).getEmail()%></td>
							<td><%=teacher_list.get(i).getAddress()%></td>
						</tr>
					<% } %>
				</table>
	<%} %>
	
</body>
</html>
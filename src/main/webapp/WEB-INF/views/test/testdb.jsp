<%@page import="com.jj.vo.TestVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% ArrayList<TestVo> list=(ArrayList<TestVo>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>디비테스트 </h1>
	<%for(int i=0;i<list.size();i++){ %>
		<h2><%=list.get(i).getIdx() %> . <%=list.get(i).getName() %> </h2>
	<%} %>
</body>
</html>
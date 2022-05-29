<%@page import="com.jj.vo.AcademyVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%ArrayList<AcademyVo> list=(ArrayList<AcademyVo>)request.getAttribute("list"); %>
    <%String search_str=request.getParameter("keyword"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%if(list.size()==0||search_str.equals("")){ %>
			<span id="search_span" class="search_bar">검색결과 없음</span>
		<%}else{ %>
			<%for(int i=0; i<list.size();i++){ %>
			
				<% String board_name=list.get(i).getTag();%>
				
						<% board_name=board_name.replaceAll(search_str, "<span style='background-color: #cffcd8;'>"+search_str+"</span>");%>
		
				<span id="search_span" class="search_bar"><a href='tagSearch?keyword=<%=list.get(i).getTag()%>'><%=board_name %></a></span><br>
			<%} %>
		<%} %>	
</body>
</html>
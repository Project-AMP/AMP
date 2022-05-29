<%@page import="com.jj.vo.MessageVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<MessageVo> list=(ArrayList<MessageVo>)request.getAttribute("list");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(list.size()==0){ %>
	채팅 가능한 회원 없음
<%}else{ %>
	<input type="checkbox" onclick="selectAll(this)"> 전체 선택 <br>
	<%for(int i=0;i<list.size();i++){ %>
		<input name='members' class="members" type="checkbox" value='<%=list.get(i).getMember_idx()%>'>
		<%=list.get(i).getMember_name() %><br>
	<%} %>
<%} %>
	<script type="text/javascript">

		function selectAll(selectAll)  {
			  const checkboxes 
			     = document.querySelectorAll('input[type="checkbox"]');
			  
				  checkboxes.forEach((checkbox) => {
				    checkbox.checked = selectAll.checked
				  })
			}
	</script>
</body>
</html>
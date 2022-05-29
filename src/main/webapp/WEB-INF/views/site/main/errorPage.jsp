<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
		<script type="text/javascript">alert("잘못 된 요청입니다.")</script>    
	</c:if>	
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
		<script type="text/javascript">alert("요청하신 페이지를 찾을 수 없습니다.")</script>   
	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
		<script type="text/javascript">alert("요청된 메소드가 허용되지 않습니다.")</script>   
	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
		<script type="text/javascript">alert("서버에 오류가 발생하여 요청을 수행할 수 없습니다.")</script>
	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
		<script type="text/javascript">alert("서비스를 사용할 수 없습니다.")</script>
	</c:if>

	<script type="text/javascript">
		location.href="main";
	</script>

</body>
</html>
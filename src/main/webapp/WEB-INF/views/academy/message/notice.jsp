<%@page import="com.jj.vo.NoticeVo"%>
<%@page import="java.util.ArrayList"%>
<%-- <%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> --%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <%
  	String academyidx = request.getParameter("academyidx");
  	String idx = session.getAttribute("idx")+"";
  %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Academy_notice</title>
<link rel="stylesheet" href="resources/CSS/academy/main/main_banner.css" type="text/css">
<link rel="stylesheet" href="resources/CSS/notice/notice.css" type="text/css">


<script type="text/javascript">
	function goWrite() {
		location.href="noticeWrite.do?academyidx="+ '<%= academyidx %>';
	}
</script>

</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>

<div id="academyMain_topBarDiv" style=" "></div>
<script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=academyidx %>','#academyMain_topBarDiv');</script>
	<div id="npotice_container" style="width: 100%; margin: auto; max-width: 1100px;min-width: 500px;margin-top: 20px;min-height: 700px;">
		<div id="notice_div" style=""></div>
    
    </div>
<footer >
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
    <script type="text/javascript">
    get_notice_div(1,'','');
    function get_notice_div(page,condition,keyword){
    	ajaxDo('notice_kit?academyidx=<%=academyidx%>&page='+page+'&condition='+condition+'&keyword='+keyword,'#notice_div');
        }
	
    </script>
</body>
</html>

























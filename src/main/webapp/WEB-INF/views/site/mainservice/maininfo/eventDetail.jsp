<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.jj.vo.EventVo"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	EventVo event_detail = (EventVo) request.getAttribute("event_detail");
	//String academyidx = request.getParameter("academyidx");
	//String academyname_ = URLEncoder.encode(academyname, "UTF-8");
	String idx = request.getParameter("idx");
%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>공지사항</title>


<style type="text/css">
/* .detail_main{
  			place-items: center;
  			display: grid;
		} */
body {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 16px;
	color: #666;
	-webkit-text-size-adjust: none;
}

#title {
	float: left;
	font-weight: 600;
	font-size: 35px;
	line-height: 1;
	color: #172b4f;
	letter-spacing: -1px;
}

.ul_list li{
    display: table;
    width: 100%;
    table-layout: fixed;
    border-bottom: 1px solid #e7e9ed;
}

li p{       
    display: table-cell;
    padding: 15px 25px;
    line-height: 15px;
    vertical-align: middle;
    box-sizing: border-box;
    color: #666;
}

.p_title_date_name{
	width: 180px;
    background: #333;
    text-align: center;
    color:white;
    font-size: 18px;
}

.ul_list{
	display: table-cell;
    padding: 15px 25px;
    line-height: 15px;
    vertical-align: middle;
    box-sizing: border-box;
    color: #666;
}

.btn_list_modify_delete{
	margin: 0 auto; 
	text-align:right; 
	width: 45%; 
	margin-top: 35px";
}
.btn-dark{
	font-size: 16px;
	padding: 7px 15px;
	background: #333;
	color:white;
	border: 0px;
	margin: 0 3px;
	cursor: pointer;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function event_delete() {
		<%-- alert('<%=academyname%>'); --%>
		
		var idx_ = <%=idx%>;
		<%-- var academyidx_ = '<%=academyidx%>';  --%>
		
		if(confirm("정말 삭제하시겠습니까?")){
			
			/* alert(academyname_ + "&&& " + idx_); */
			if(idx_ != null)
			{
				location.href = "event_delete.do?idx=" + <%=idx%>;
			}
			else
			{
				alert("취소하였습니다.");
			}
		}
	}
</script>
</head>

<body>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/JS/ajax/ajax.js"></script>

	<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar','#topBarDiv');</script>

		
		
		
		
		
		
	<div class="detail_head" style=" margin: 25px auto 15px auto; width: 45%;text-align: center;">
		<div id="title">공지사항</div><br><br>
		<div style="margin: 0px 0 0px 0; padding: 0 0 10px; border-bottom: 3px solid #172b4f;"></div>
	</div>
	
	<div class="detail_body" style=" margin: 0 auto; width: 45%; ">
		<div style="margin: 0 0 25px; padding: 0 0 8px; border-bottom: 3px solid #172b4f;"></div>
		<div class="detail_body_box" style="width:100%;">
			<ul class="ul_list" style=" list-style-type: none;margin:0 0 20px 0;padding:0;font-size: 15px;">
				<li>
					<p class="p_title_date_name"><b>제목</b></p>
					<p>
						<span> ${ event_detail.title }</span>
					</p>
				</li>
				<li>
					<p class="p_title_date_name"><b>작성일</b></p>
					<p>${ event_detail.date }</p>
				</li>
				<li>
					<p class="p_title_date_name"><b>작성자</b></p>
					<p>관리자</p>
						<p class="p_title_date_name"><b>조회수</b></p>
					<p>${ event_detail.view }</p>
				</li>
			
			</ul>
			
			
		</div>
		
		<div class="detail_content_box" style="background-color:#fff; min-height: 700px; margin-top: 20px;font-size: 15px;">
			<p>${ event_detail.con }</p>
		</div>
	</div>
		<div style="margin: 0 0 40px 0; padding: 0 0 19px; border-bottom: 3px solid #172b4f; width:45%; margin:auto;"></div>
		
	<div class="btn_list_modify_delete" style=" margin-top: 15px;">
		<input type="button" value="목록" class="btn btn-dark" onclick="location.href='event.do?idx=<%=idx%>'">
		<input type="button" value="수정" class="btn btn-dark" onclick="location.href='event_update.do?idx=<%=idx%>'">
		<input type="button" value="삭제" class="btn btn-dark" onclick="event_delete();">
	</div>
	<br><br><br><br><br>

</body>
</html>









































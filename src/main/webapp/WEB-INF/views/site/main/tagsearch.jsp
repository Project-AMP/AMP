<%@page import="com.jj.vo.AcademyVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<AcademyVo> list= (ArrayList<AcademyVo>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<!-- 2021-02-27 김용민 검색창 태그 수정 추가해야함 -->
<style type="text/css">
/* 태그 */
.academytags {
  list-style: none;
  margin: 0;
  overflow: hidden; 
  padding: 0;
}

.academytags li {
  float: left; 
}

.academytag {
  background: #333;
  color:#fff;
  border-radius: 3px 0 0 3px;
  display: inline-block;
  height: 26px;
  line-height: 26px;
  padding: 0 20px 0 23px;
  position: relative;
  margin: 0 10px 10px 0;
  text-decoration: none;
  -webkit-transition: color 0.2s;
}

.academytag::before {
  background: #fff;
  border-radius: 10px;
  box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
  content: '';
  height: 6px;
  left: 10px;
  position: absolute;
  width: 6px;
  top: 10px;
}

.academytag::after {
  background: #fff;
  border-bottom: 13px solid transparent;
  border-left: 10px solid #333;
  border-top: 13px solid transparent;
  content: '';
  position: absolute;
  right: 0;
  top: 0;
}

.academytag:hover {
  background-color: crimson;
  color: white;
}

.academytag:hover::after {
   border-left-color: crimson; 
}

.Biggroup{
width: 100%; 
min-height: calc(100vh - 215px); 
display: flex; 
justify-content: center;
}
.Smallgroup{
display: flex; 
justify-content: center;
width:100%; 
max-width: 1300px; 
min-width:500px;
height:100%;
}

.academyidx{
text-decoration: none;
font-size:15px;
font-weight: bold;
color:#000;
}
.academyidx:hover{
color: crimson;
}

.tagSearchDiv{
margin-top:15px;
}
</style>
</head>
<body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar?keyword=<%=request.getParameter("keyword")%>','#topBarDiv');</script>

<div class="Biggroup">
<div class="Smallgroup">		
<div class="tagSearchDiv">
<%for(int i=0;i<list.size();i++){ %>
<ul class="academytags"  style="margin-bottom: 4px;">
	<li ><a href="academyMain?academyidx=<%= list.get(i).getIdx()%>" class="academyidx" style="font-size: 22px;"><%= list.get(i).getName()%></a></li>
</ul>
	<%String [] tags= list.get(i).getTag().split(",");%>
<ul class="academytags" style="margin-bottom: 5.5px;">
	<%for(int j=0;j<tags.length;j++){ %>
		<%if(!tags[j].equals(list.get(i).getName())){ %><!-- 여기줄  -->
		<li><a href="tagSearch?keyword=<%=tags[j] %>" class="academytag"><%= tags[j]%></a></li>
		<%} %><!-- 여기줄 -->
	<%}%>
</ul>
<%}%>
</div>
</div>
</div>

</body>
</html>
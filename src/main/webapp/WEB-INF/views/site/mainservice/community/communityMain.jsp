<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String academyidx = request.getParameter("academyidx"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#container{
}
#communityMain_container{
width: calc( 100% - 300px); 
width: 860px;
min-width:600px; 
float: left;
}
.communityMain_h2{
color: #1a1a1a;
font-weight: bold;
font-size: 24px;
line-height: 30px;
letter-spacing: -2px;
margin: 20px 10px 12px;
}
.communityMain_div{
display: block;
position: relative;
background-color: #ebf0ed;
height:100%;
}
.communityMain_div_li_ex{
display: inline-block;
vertical-align: middle;
}
.communityMain_div ul{
position: relative;
width: 100%;
border-top: 2px solid #848484;
border-bottom: 1px solid #dbdbdb;
background-color: #ebf0ed;
list-style: none;

display: block;
list-style-type: disc;
margin-block-start: 1em;
margin-block-end: 1em;
margin-inline-start: 0px;
margin-inline-end: 0px;
padding-inline-start: 0px;
padding-inline-end: 0px;
}
.communityMain_div li{
float: left;
background-color: #ebf0ed;
list-style: none;
display: list-item;
text-align: -webkit-match-parent;
}
.communityMain_a{
display: block;
position: relative;
width: 192px;
min-height: 16px;
padding: 10px 10.5px;
border-bottom: 0;
color: #333;
font-size: 12px;
line-height: 1.2em;
text-align: center;
text-decoration: none;
border-left: 1px solid #fff;
border-right: 1px solid #d9d9d9;
}
.communityMain_div ul li.on .communityMain_a {
z-index: 3;
margin-bottom: -1px;
border-bottom: 1px solid #fff;
background-color: #fff;
color: #6ea300;
font-weight: bold;
}
.communityMainMain_div {
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:60px;
margin-bottom:20px;
width: 800px;
padding: 30px;
text-align: center;
}
#serach_categori{
text-align: right; 
float:right; 
font-size: 26px;
display: inline-block;
position: relative;
text-align: center;
width: 400px;
}
#search_input {
width: 100%;
border: 1px solid #2c3338;
padding: 10px 10px;
}
#search_div{
float:right; 
width: 200px; 
}
#kategorie{
margin-right: 3px; 
display:block; 
float:right;
font-size: 16px; 
padding: 7px;
}
</style>
</head>
<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar','#topBarDiv');</script>

<div class="Biggroup">
	<div class="Smallgroup">
	
		<div id="community_sidebarDiv"></div>
			<script type="text/javascript">ajaxDo('community_sidebar? &bgColorSet=communityMain','#community_sidebarDiv');
		</script>
		
		<div id="communityMain_container">
		<div class="communityMain_container_div">
			
		<div id="serach_categori">
			<div id="search_div">
				<input id="search_input" type="text">
			</div>
				<span style="float:rigth; margin-right: 3px">카테고리 </span>
					<select id='kategorie'>
						<option value="">전체</option>									
					</select>
		</div>

			
		<div id="container">
			<h2 class="communityMain_h2">커뮤니티</h2>
			
				<div class="communityMain_div">
					<ul>
						<li class="communityMain_div_li">
							<a href="communityMain" class="communityMain_a">
							<span class="communityMain_div_li_ex">예시1</span></a>
						</li>
						<li class="communityMain_div_li">
							<a href="communityMain" class="communityMain_a">
							<span class="communityMain_div_li_ex">예시2</span></a>
						</li>
						<li class="communityMain_div_li">
							<a href="communityMain" class="communityMain_a">
							<span class="communityMain_div_li_ex">예시3</span></a>
						</li>
						<li class="communityMain_div_li">
							<a href="communityMain" class="communityMain_a">
							<span class="communityMain_div_li_ex">예시4</span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="communityMainMain_div">
			들어갈 내용
			
		</div>
	</div>
</div>
</div>

<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
</body>
</html>
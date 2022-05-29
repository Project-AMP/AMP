<%@page import="com.jj.vo.EventVo"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<EventVo> list = (ArrayList<EventVo>) request.getAttribute("list");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style type="text/css">
#container {
	/* text-align: center; */
	
}

#event_container {
	width: calc(100% - 300px);
	width: 860px;
	min-width: 600px;
	float: left;
}

.event_h2 {
	color: #1a1a1a;
	font-weight: bold;
	font-size: 24px;
	line-height: 30px;
	letter-spacing: -2px;
	margin: 20px 10px 12px;
}

.event_div {
	display: block;
	position: relative;
	background-color: #ebf0ed;
	height: 100%;
}

.event_div_li_ex {
	display: inline-block;
	vertical-align: middle;
}

.event_div ul {
	position: relative;
	width: 859px;
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

.event_div li {
	float: left;
	background-color: #ebf0ed;
	list-style: none;
	display: list-item;
	text-align: -webkit-match-parent;
	
}

.event_a {
	display: block;
	position: relative;
	width: 406px;
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

.event_div ul li.on .event_a {
	z-index: 3;
	margin-bottom: -1px;
	border-bottom: 1px solid #fff;
	background-color: #fff;
	color: #6ea300;
	font-weight: bold;
}

.eventMain_div {
	border: 3px solid #d3d3d3;
	border-radius: 50px;
	margin-top: 60px;
	margin-bottom: 20px;
	width: 800px;
	padding: 30px;
	text-align: center;
}

#serach_categori {
	text-align: right;
	float: right;
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

#search_div {
	float: right;
	width: 200px;
}

#kategorie {

	display: block;
	float: right;
	font-size: 16px;
	padding: 7px;
}

.event_info_div {
	width: 250px;
	height: 210px;
	border: black 1px solid;
	display: inline-block;
		margin: 5px 0px;
}

.eventphoto {

	width: 150px;
	height: 150px;
	display: inline-block;
	margin: 1px 0px;
}

#write_btn {
	color: #fff;
	background-color: #0d6efd;
	border-color: #0d6efd;
	display: inline-block;
	font-weight: 400;
	line-height: 1.5;
	/* color: #212529; */
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
	/* background-color: transparent; */
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	border-radius: .25rem;
	/* transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out; */
}



.modal_body{
	display:none;
 	position:fixed;
  	top:50%; left:50%;
  	transform: translate(-50%,-50%);
  	max-width: 60%;
  	min-height: 30%;
  	background:#fff;
}

#modals{
    z-index : 50;
	position: fixed;
	width: 100%; height: 100%;
	background: rgba(0,0,0,0.3);
	top:0; left:0;
	display: none;
}

#modals_con{
	  z-index : 51;
	  display:none;
	  position:fixed;
	  top:50%; left:50%;
	  transform: translate(-50%,-50%);
	  max-width: 80%;
	  min-height: 50%;
	  width:400px;
	  height :600px;
	  background:#fff;
	  overflow:auto; 
	  word-break:break-all;
	  word-wrap:break-word;
}

#modals_con #con{
	font-size:15px; 
	line-height:1.3;
    padding: 30px;
}

.btn_eventinfo{
	color: #fff;
	background-color: #0d6efd;
	border-color: #0d6efd;
	display: inline-block;
	font-weight: 400;
	line-height: 1.5;
	/* color: #212529; */
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
	/* background-color: transparent; */
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 10px;
	border-radius: .25rem;
}
</style>
<script type="text/javascript">
	function goWrite() {
		location.href = "eventWrite.do";
	}
	
    function openModal(idx) {
    	//alert("idx >>> " + idx);
		document.get
		$("#modals").fadeIn(300);
		$("#modals_con").fadeIn(300);
		
		ajaxDo('event_con.do?idx='+idx, '#con');
		
		
	}
    
    $(document).ready(function() {
		$("#modals").on("click", function() {
			//alert("클릭테스트");
			$("#modals").fadeOut(300);
			$("#modals_con").fadeOut(300);
		});
	});
    

</script>
</head>
<body>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/JS/ajax/ajax.js"></script>
	<div id="topBarDiv"></div>
	<script type="text/javascript">
		ajaxDo('topBar', '#topBarDiv');
	</script>

<div id="modals" onclick="closeModal()"></div>
	<div id="modals_con">
		<div id="con"></div>
	</div>


	<div class="Biggroup">
		<div class="Smallgroup">

			<!-- <div id="event_sidebarDiv"></div>
			<script type="text/javascript">
				ajaxDo('event_sidebar? &bgColorSet=event', '#event_sidebarDiv');
			</script> -->

			<div id="event_container">
				<div class="event_container_div">

					<div id="serach_categori">
						<div id="search_div">
							<input id="search_input" type="text">
						</div>
						<span style="float: rigth; margin-right: 3px; ">카테고리 </span> <select
							id='kategorie'>
							<option value="">전체</option>
						</select>
					</div>

					<div id="container">
						<h2 class="event_h2">
							이벤트
						</h2>
						<div class="event_div">
							<ul>
								<li class="event_div_li">
									<a href="event" class="event_a"><span class="event_div_li_ex">진행중인 이벤트</span></a>
								</li>
								<li class="event_div_li">
									<a href="event" class="event_a"><span class="event_div_li_ex">완료된 이벤트</span></a>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
				<div class="eventMain_div">
					<%
					for (int i = 0; i < list.size(); i++) {
					%>
					<div class="event_info_div" style="">
						<div class="eventphoto">
							<img src="resources/IMG/event/img_0<%=i+1%>.jpg"/>
						</div>
						<div><%=list.get(i).getTitle()%></div>
						<div>
							<div class="btn_event">
								<input type="submit" class="btn_eventinfo" value="이벤트 보기" onclick="openModal(<%=list.get(i).getIdx()%>)">
							</div>
						</div>
					</div>

					<%
					}
					%>



				</div>
			</div>
		</div>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/site/main/footer.jsp"%>
	</footer>
</body>
</html>
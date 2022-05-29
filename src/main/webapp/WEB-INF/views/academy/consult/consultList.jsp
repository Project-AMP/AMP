<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 상담 관리</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#consultList_container{
/* border: 1px solid red; */
}
#consultList_div{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
width: 800px;
padding : 30px;
text-align: center;
}
#consultList_table{
width:100%;
}
#searchbar{
text-align: center;
padding:5px;
border: 1px solid black;
}
#serach_categori{
display: inline-block;
}
.search {
display: inline-block;
position: relative;
text-align: center;
width: 400px;
}
	
#search{
width: 100%;
border: 1px solid #bbb;
margin: 10px 0;
padding: 10px 12px;
}
.fa-search {
position: absolute;
left: 390px;
top: 20px;
margin: 0;
}	
.consultListlist{
border: 1px solid black;
margin-top: 10px;
margin-bottom: 10px;
}
.consultListlistdiv{
border-top: 1px solid black;
}
.btn_group{

display: inline-block;
}
#btn_consultcomentcheck{
vertical-align: middle;
display: inline-block;
line-height: 1;
cursor: pointer; 
padding: 8px 12px;
transition: all 0.3s;
box-shadow: inset 0 1px 0 rgba(255,255,255,.2);
text-shadow: 0 -1px 0 rgba(0,0,0,.4);
border-radius: 6px;
font-size: 15px;
text-transform: uppercase;
border-style: solid;
border-width: 1px;
width: 150px;
height: 50px;
}

</style>
</head>

<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>
<div class="Biggroup">
<div class="Smallgroup">

<div id="adminDiv"></div><script type="text/javascript">ajaxDo('admin?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=consultList','#adminDiv');</script>
<div id="consultList_container">

		<div id="consultList_div">
		<span style="font-size:35px;">수강 상담 관리</span><br><br>
			<div id="searchbar">
	<div id="serach_categori">
	상담 목록 
	<select id="state" onchange="getConsultList()">
			<option value="">전체</option>
			<option value="0">미완료</option>
			<option value="1">상담완료</option>
			</select>
	</div>

			<script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>
		    <div class="search">
		    	<i class="fas fa-search"></i>
		    	<input id="search" type="text" onkeyup="getConsultList()">
		    </div>
		</div>
		
		<div class="consultListlist">
		<div style="margin-top:10px; margin-bottom:10px;"><h2>수강 상담</h2></div>
		
			<div id="consultList_kit" class="consultListlistdiv"></div>
			
		</div>
		</div>
	</div>
</div>
</div>
<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
<script type="text/javascript">

getConsultList();
	function getConsultList(){
		ajaxDo('consultList_kit?academyidx=<%=request.getParameter("academyidx")%>&state='+$('#state').val()+'&keyword='+$('#search').val(),'#consultList_kit');
		}
</script>
</body>
</html>
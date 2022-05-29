<%@page import="com.jj.vo.ClassVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<ClassVo> kategories= (ArrayList<ClassVo>)request.getAttribute("kategories"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 상담</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#consult_container{
/* border: 1px solid red; */
}
#consult_div{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
width: 800px;
padding : 30px;
text-align: center;
}
/* 검색창 */
.search {
display: inline-block;
position: relative;
text-align: center;
width: 400px;
font-size: 23px;
height: 23px;
}
	
#search{
width: 100%;
border: 1px solid #bbb;
margin: 10px 0;
padding: 8px 12px;
}

.fa-search {
position: absolute;
left: 390px;
top: 20px;
margin: 0;
}

#searchbar{
text-align: center;
border: 1px solid black;
}
#serach_categori{
display: inline-block;
}
#search_classoption{
display: inline-block;
}
#search_option{
margin: 10px 0px 0px 0px;
border: 1px solid black;
}
#privacy_buttondiv{
margin:10px 0px 0px 0px; 
border : 1px solid black;
height: 100px;
}
#privacy{

display:inline-block; 
text-align: right;
margin:10px 0px 0px 0px; 
}
#comentbox{
margin:10px 0px 0px 0px; 
border:1px solid black;
}
.studentname,.phone{
display: inline-block;
width: 300px;
}
#stuname,#phone{
margin:auto 0;
padding: 10px 12px;
}

.coment{
display: inline-block;
width: 100%;
font-size: 20px;
}

#comenttxt{
margin:auto 0;
padding: 10px 12px;
width:700px;
height:150px;
resize:none;
}

#btn_consult{
display: inline-block;
}
	
	
#completebutton{
display:inline-block;
vertical-align: top;
margin-top:10px;
}
#consultcomplete {
display: inline-block;
cursor: pointer;
text-align: center;
padding: 8px 12px;

box-shadow: inset 0 1px 0 rgba(255,255,255,.2);
text-shadow: 0 -1px 0 rgba(0,0,0,.4);
border-radius: 6px;
font-size: 20px;

border-style: solid;
border-width: 1px;  
width :130px;
height:83px;
color: #fff;
        background-color: #0d6efd;
        border-color: #0d6efd;

        display: inline-block;
        font-weight: 200;
        line-height: 1.5;
        /* color: #212529; */
        text-align: center;
        text-decoration: none;
        vertical-align: middle;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
        border: 1px solid transparent;
        padding: .300rem .45rem;
        font-size: 20px;
        border-radius: .25rem;
} 

.classTr {

	cursor: pointer;
}

</style>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>

<script type="text/javascript">
function setTime(value){
	$('.time_list').hide();
	$('.'+value).show();
	
	$("#name").on("change", function(){

		$("#time").find("option:eq(0)").prop("selected", true);
	});
}

/* $('#comenttxt').keyup(function (e){
	
    var content = $(this).val();
    
    $('#counter').val(500-content.length);
    
    if(content.length > 500) {
    $(this).val($(this).val().substring(0, 500));
    
    }
}); */
$(document).ready(function() {
    $('#comenttxt').on('keyup', function() {
        $('#comentlength').html("("+$(this).val().length+" / 500)");
 
        if($(this).val().length > 500) {
            $(this).val($(this).val().substring(0, 500));
            $('#comentlength').html("(500 / 500)");
        }
    });
});


</script>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>
<div class="Biggroup">
<div class="Smallgroup">

<div id="class_sidebarDiv"></div><script type="text/javascript">ajaxDo('class_sidebar?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=consult','#class_sidebarDiv');</script>	
	<div id="consult_container">
		<div id="consult_div">
		<span style="font-size:35px;">수강 상담</span><br><br>
		<div id="searchbar">
	  상담하실 강의를 클릭해 주세요<br>
	

		  <div class="search"  style="float:right; text-align: right; width: 200px; margin:0 35px 0 15px;">
		  		    
		    	<input id="search" type="text" onkeyup="getClassList()">

		  </div>
		<div id="serach_categori" style="text-align: right; float:right; margin-top: 13px;font-size: 24px;">
 
			<span style="float:rigth; margin-right: 3px">카테고리 </span>
			<select id='kategorie' onchange="getClassList()" style="display:block; float:right;font-size: 16px; padding: 4px;">
					<option value="">전체</option>
					<%for(int i=0;i<kategories.size();i++){ %>
						<option value='<%=kategories.get(i).getKategorie() %>'><%=kategories.get(i).getKategorie() %></option>
					<%} %>
			</select>
		</div>

		<div id='classListDiv' style="height:100%; border : 1px solid black; margin-top:60px;width: 100%;">수강목록</div>
</div>
		
		
		
	
		
			
			<div id="comentbox">

		
			<div class="coment">상담 내용
			<form action="joinConsult.do" onsubmit="return checkForm();">
			<input id='classIdx' type="hidden" name='classIdx' value=''>
			<br>
			<textarea id="comenttxt" name="coment"></textarea>
			
			<div style="display:inline-block; font-size:15px; margin-bottom:10px;">
			<div style="display:inline-block;">남은 글자 수 : 
			<div style="display:inline-block;" id="comentlength">(0 / 500)
			</div></div></div>
			</div></div>
			
			<div id="privacy_buttondiv">
			
			<div id="privacy">
			<div class="studentname">이름
				<input id="stuname" name="stuname" type="text">
			</div>
			<br>
			
			<div class="phone">핸드폰번호
				<input id="phone" name="phone" type="text">
			</div>
			<br>
			</div>
			
			<div id="completebutton">
			<input type="hidden" name="academyidx" value='<%=request.getParameter("academyidx")%>'>
			<input type="submit" id="consultcomplete" value="상담 신청">
			</form>
			</div>
			
			</div>
		
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
getClassList();
function getClassList(){
	ajaxDo('classList_kit?academyidx=<%=request.getParameter("academyidx")%>&kategorie='+$("#kategorie").val()+'&keyword='+$("#search").val(),'#classListDiv');
}
function lineClicked(classIdx){
	$('.classTr').css('background-color','white');
	$('.classTr').css('font-weight','normal');

	$('#classTr'+classIdx).css('background-color','#ffeb99');
	$('#classTr'+classIdx).css('font-weight','bold');
	$('#classIdx').val(classIdx);
}
function checkForm(){

	return true;
	
}

</script>
<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
</body>
</html>
<%@page import="com.jj.vo.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String academyidx = request.getParameter("academyidx"); %>
<%
	ArrayList<MemberVo> list= (ArrayList<MemberVo>)request.getAttribute("list");
    String phone_num = list.get(0).getPhone().replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
	#container{
	}
	#myinfoMain_container{
	
	width: calc( 100% - 300px); 
	width: 860px;
	min-width:600px; 
	float: left;
	}
	.myinfoMain_h2{
	color: #1a1a1a;
	font-weight: bold;
	font-size: 18px;
	line-height: 30px;
	letter-spacing: -2px;
	margin: 20px 10px 12px;
	}
	.myinfoMain_div{
	border: 3px solid #d3d3d3;
	border-radius:50px;
	margin-top:20px;
	margin-bottom:20px;
	width: 800px;
	margin:auto;
	padding:20px 0 0 0;
	text-align: center;
	font-size: 22px;
	
	}
	.td1{
	text-align: right;
	padding-right: 15px;
	}
	
	.myinforMain_btn {
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
	    padding: .175rem .45rem;
	    font-size: 15px;
	    border-radius: .25rem;
}
	
</style>

<script type="text/javascript">
<%-- $(document).ready(function() {
    
	  var test = <%= list.get(0).getPhone() %>;
	  var testDate = test.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	  
	  $(".test").text(testDate);
	 
	}); --%>
</script>
</head>
<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar','#topBarDiv');</script>

<div class="Biggroup">
	<div class="Smallgroup">
		<div id="myinfo_sidebarDiv"></div>
			<script type="text/javascript">ajaxDo('myinfo_sidebar? &bgColorSet=myinfoMain','#myinfo_sidebarDiv');
		</script>
		
		<div id="myinfoMain_container">
		<div id="container">
		<div class="myinfoMain_h2"><h2>내 정보</h2></div>
		<div class="myinfoMain_div" >
			<table style="margin: auto;text-align: left; margin-bottom: 15px;">
				<tr>
					<td class='td1'>이름 :</td>
					<td><%=list.get(0).getName() %></td>
					<td></td>
				</tr>
				<tr>
					<td class='td1'>id :</td>
					<td><%=list.get(0).getId() %></td>
					<td></td>
				</tr>
				<tr>
					<td class='td1'>비밀번호 :</td>
					<td><%=list.get(0).getPw() %>*** </td>
					<td><input class="myinforMain_btn" type="button" value="비밀번호변경"></td>
				</tr>
				<tr>
					<td class='td1'>전화번호 :</td>
					<td class="test"><%= phone_num %></td>
					<td><input class="myinforMain_btn" type="button" value="번호변경"></td>
				</tr>
				<tr>
					<td class='td1'>이메일 :</td>
					<td><%=list.get(0).getEmail() %> </td>
					<td></td>
				</tr>
				<tr>
					<td class='td1'>주소 :</td>
					<td><%=list.get(0).getAddress() %> </td>
					<td></td>
				</tr>
				<tr>
					<td class='td1'>생년월일 :</td>
					<td><%=list.get(0).getBirth() %> </td>
					<td></td>
				</tr>
				<tr>
					<td style="font-size: 24px;padding: 20px 0 5px 0;"><strong>연동된 계정</strong></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class='td1'>카카오 :</td>
					<td><%=(list.get(0).getKakao()==null||list.get(0).getKakao().equals("")?"연동 안됨":list.get(0).getKakao())%> </td>
					<td><%=(list.get(0).getKakao()==null||list.get(0).getKakao().equals("")?"<input class='myinforMain_btn' type='button' value='계정연동'>":"<input class='myinforMain_btn' type='button' value='계정변경'>")%></td>
				</tr>
				<tr>
					<td class='td1'>구글 :</td>
					<td><%=(list.get(0).getGoole()==null||list.get(0).getGoole().equals("")?"연동 안됨":list.get(0).getGoole())%> </td>
					<td><%=(list.get(0).getGoole()==null||list.get(0).getGoole().equals("")?"<input class='myinforMain_btn' type='button' value='계정연동'>":"<input class='myinforMain_btn' type='button' value='계정변경'>")%></td>
				</tr>
				<tr>
					<td class='td1'>네이버 :</td>
					<td><%=(list.get(0).getNaver()==null||list.get(0).getNaver().equals("")?"연동 안됨":list.get(0).getNaver())%> </td>
					<td><%=(list.get(0).getNaver()==null||list.get(0).getNaver().equals("")?"<input class='myinforMain_btn' type='button' value='계정연동'>":"<input class='myinforMain_btn' type='button' value='계정변경'>")%></td>
				</tr>
				<tr>
					<td class='td1'>페이스북 :</td>
					<td><%=(list.get(0).getFace()==null||list.get(0).getFace().equals("")?"연동 안됨":list.get(0).getFace())%> </td>
					<td><%=(list.get(0).getFace()==null||list.get(0).getFace().equals("")?"<input class='myinforMain_btn' type='button' value='계정연동'>":"<input class='myinforMain_btn' type='button' value='계정변경'>")%></td>
				</tr>
		
			
			</table>

			
			
		</div>
		</div>
	</div>
</div>
</div>

<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
</body>
</html>
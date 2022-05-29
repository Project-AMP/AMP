<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">

<style type="text/css">
#coupon_div{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
width: 800px;
padding : 30px;
text-align: center;
	}
#coupon_container{
/* border: 1px solid red; */
}
#coupon_creatediv{
width: 750px;

margin: auto;
padding:10px 0px 3px 0;
}
.couponinput {
display: inline-block;
position: relative;
text-align: center;
width: 400px;
}
	
#couponinputbar{
vertical-align: middle;
display: inline-block;
width: 100%;
padding: 10px 12px;
}
#couponList{

margin:10px 0px 20px 0px;
}
#btn_coupondiv{
display: inline-block;
margin-left: 50px;
}
#btn_coupon {
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
	    font-size: 22px;
	    border-radius: .25rem;
}
</style>
</head>
<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>

<div class="Biggroup">
<div class="Smallgroup">

<div id="my_info_sidebarDiv"></div><script type="text/javascript">ajaxDo('my_info_sidebar?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=coupon','#my_info_sidebarDiv');</script>
	<div id="coupon_container">
		<div id="coupon_div">
		<span style="font-size:35px;">쿠폰</span><br><br>
		<div style="width: 75%; border-bottom: 1px solid black;margin:-10px auto 0 auto;;height: 0px;font-size: 35px; "></div>
			<div id="coupon_creatediv">
			<h2 style="margin: 20px 0 5px 0;">쿠폰 등록</h2>
			
				<div class="couponinput" style="width: 100%;">
		    	<input id="couponinputbar" type="text" placeholder="쿠폰코드를 입력해주세요" style="width: 400px;">
		    	
		    	<input type="submit" id="btn_coupon" value="쿠폰 등록" onclick="addCoupon()" >
		    	</div>
			</div>
				<div style="width: 75%; border-bottom: 1px solid black;margin:30px auto;height: 0px;font-size: 35px; "></div>
			<h2 style="margin: 20px 0 5px 0;">쿠폰목록</h2>
			<div id="couponList">
				<h1>쿠폰 리스트 형식</h1>
			</div>
			
		</div>
	</div>
</div>
</div>
<%-- <footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer> --%>
<script type="text/javascript">
getCouponList();
function getCouponList(){
	ajaxDo('coupon_kit?academyidx=<%=request.getParameter("academyidx")%>','#couponList');
}
function addCoupon(){

	var result =ajaxDo('isCoupon?academyidx=<%=request.getParameter("academyidx")%>&code='+$('#couponinputbar').val(),'');
	if(result=='false'){
		alert("쿠폰코드 잘못입력");
	}else if(result=='finished'){
		alert("만료된 쿠폰");
	}else if(result=="have"){
		alert("이미 사용한 쿠폰입니다.");
	}else{
		
		ajaxDo('addCoupon?&idx='+result,'');

	}
	getCouponList();
	$('#couponinputbar').val('');

}

</script>
</body>
</html>
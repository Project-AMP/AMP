<%@page import="com.jj.vo.CouponVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%ArrayList<CouponVo> list=(ArrayList<CouponVo>) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보_쿠폰</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#container{
}
#myinfoMain_container{
d red;
width: calc( 100% - 300px); 
width: 860px;
min-width:600px; 
float: left;
}
.myinfo_coupon_h2{
color: #1a1a1a;
font-weight: bold;
font-size: 18px;
line-height: 30px;
letter-spacing: -2px;
margin: 20px 10px 12px;
}
.myinfo_coupon_div{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
width: 800px;
height:200px;
margin:auto;
padding:20px 0 0 0;
text-align: center;
}

</style>
</head>
<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar','#topBarDiv');</script>

<div class="Biggroup">
	<div class="Smallgroup">
		<div id="myinfo_sidebarDiv"></div>
			<script type="text/javascript">ajaxDo('myinfo_sidebar? &bgColorSet=myinfo_coupon','#myinfo_sidebarDiv');
		</script>

		<div id="myinfoMain_container">
		<div id="container">
		<div class="myinfo_coupon_h2"><h2>쿠폰</h2></div>
		<div class="myinfo_coupon_div">
			<%if(list.size()==0){ %>	<!-- /* 리스트에 아무것도 안 들어있거나 현재진행 중인 강의가 없을때 */ -->
			쿠폰이없습니다.
		<%}else{ %>
			<table id='table' style="width: 90%;border-collapse: collapse; margin:auto;border: 1px solid black; border-bottom:0px;margin-top: 17px;">
				<tr style="background-color: #333;color:white;font-size: 17px; height: 32px; border-bottom:1px solid black;">
					<td style="border:0px;width: 75px;">NO</td>
					<td>학원</td>
					<td>쿠폰명</td>
					<td>할인율</td>
					<td>쿠폰만료일</td>						
					<td style="border:0px;width: 77px;">삭제</td>
				</tr>
		
				<%for(int i=0;i<list.size();i++){ %>
					
					
					<tr style="font-size: 17px; height: 32px;border-bottom:1px solid black;">

						<td><%=i+1 %></td>
						<td><a href='academyMain?academyidx=<%=list.get(i).getAcademy()%>'><%=list.get(i).getAcademy_name() %></a></td>
						<td><%=list.get(i).getName() %></td>
						<td><%=(int)(list.get(i).getSale()*100) %>%</td>	
						<td><%=list.get(i).getU_date()%></td>
				
						<td style="border:0px;">
							<a>쿠폰삭제</a>
						</td>

					<tr>

				<%} %>
				
				</table>
		<%} %>
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
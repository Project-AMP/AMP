<%@page import="com.jj.vo.ClassVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<ClassVo> list=(ArrayList<ClassVo>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#payment_div{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
width: 800px;
padding : 30px;
text-align: center;
	}
#payment_container{
/* border: 1px solid red; */
}
#table td{
	border:1px solid black;
	padding: 3px 0;
}
.btn{
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
	    font-size: 17px;
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

<div id="my_info_sidebarDiv"></div><script type="text/javascript">ajaxDo('my_info_sidebar?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=payment','#my_info_sidebarDiv');</script>
	<div id="payment_container">
		<div id="payment_div">
			<div style="width: 75%; border-bottom: 1px solid black;margin:-10px auto 50px auto;font-size: 24px;height: 60px;font-size: 35px; ">
				<span>결제내역</span><br>
			</div>
		<%int total_price=0,total_saled_price=0,total_sale=0; %>
		<%if(list.size()==0){ %>	<!-- /* 리스트에 아무것도 안 들어있거나 현재진행 중인 강의가 없을때 */ -->
			결제 내역이 없습니다.
		<%}else{ %>
			<table id='table' style="width: 90%;border-collapse: collapse; margin:auto;border:solid black 1px; border-bottom:0px;">
				<tr style="background-color: #333; color:white; height: 32px; font-size:17px;border-bottom:1px solid black;">
				
					<td>강의명</td>
					<td>시간</td>						
					<td>가격</td>
					<td>할인적용가</td>				
					<td>결제일</td>
					<td style="border:0px;width: 75px;"></td>
				</tr>
		
				<%for(int i=0;i<list.size();i++){ %>
						<%total_price+=list.get(i).getPrice(); %>
						<%total_saled_price+=(int)(list.get(i).getPrice()*(1-list.get(i).getSale())); %>
						<%total_sale+=(int)(list.get(i).getPrice()*list.get(i).getSale()); %>
					
					<tr style="height: 32px; font-size:17px;border-bottom:1px solid black;">
						<td><%=list.get(i).getName() %></td>
						<td><%=list.get(i).getTime() %></td>	
						<td><%=(list.get(i).getPrice()+"").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>원</td>
						<td><%=((int)(list.get(i).getPrice()*(1-list.get(i).getSale()))+"").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>원 <%=(int)(list.get(i).getPrice()*list.get(i).getSale())==0?"":"(-"+((int)(list.get(i).getPrice()*list.get(i).getSale())+"").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")+")"%></td>
						<td><%=list.get(i).getDate() %></td>
						<td style="border:0px;">
							<%if(list.get(i).getFinished()==1){ %>
								<span style="color:gray;">환불불가</span>
							<%}else{ %>
								<a href="javascript:alert('환불문의가 완료되었습니다.')" style="color:blue;">환불문의</a>
							<%} %>
						</td>

					<tr>

				<%} %>
				
				</table>
			
			<div style="float: left; margin-top:20px; margin-left: 100px;"><strong><h2>결제상세</h2></strong></div>
			
			<div id="total_price" style="border-top: 1px solid black; margin:50px auto; width: 75%;font-size: 24px;"><!-- 총금액 -->
				<div style="float: left; width: 100%;">
					<span style="margin-top:20px; float: left;">총가격</span> <span style="float:right; text-align:right; margin:20px;"><%=(total_price+"").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>원</span><br>
				</div>
				<br>
				<div style="float: left; width: 100%; margin-top: -30px;">	
					<span style="margin-top:20px; float: left; color: #888;">ㄴ할인 </span> <span style="float:right;margin:20px; color: #888;">-<%=(total_sale+"").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",") %>원</span>
				</div>
				<br>
			</div>
				
			<div style="width: 75%; border-top: 1px solid black;margin:20px auto;font-size: 24px;height: 100px; ">
				<span style="float:left; margin-top: 80px;">총결제금액</span><br>
				<span style="float:right;margin:20px;color:blue; font-size: 32px; margin-top: 40px;"><%=(total_saled_price+"").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",") %>원</span>
			</div>

			
				
			<div style="width: 75%; border-top: 1px solid black;margin:20px auto;font-size: 24px;height: 200px; ">
				<input class="btn" type="button" value="문의하기" style="float:right;margin:10px 5px;">
				<input class="btn" type="button" value="영수증출력"style="float:right;margin:10px 5px;">
			</div>	
		
		<%} %>
		</div>
	</div>
</div>
</div>
<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
</body>
</html>
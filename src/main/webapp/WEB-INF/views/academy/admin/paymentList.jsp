<%@page import="com.jj.vo.ClassVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<ClassVo> list= (ArrayList<ClassVo> )request.getAttribute("list");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 관리</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#paymentList_container{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
}

#paymentList_div{
width: 800px;
padding : 30px;
}
#paymentList_container{
/* border: 1px solid red; */
text-align: center;
}
</style>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>

<div class="Biggroup">
<div class="Smallgroup">
	
<div id="adminDiv"></div><script type="text/javascript">ajaxDo('admin?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=paymentList','#adminDiv');</script>
	<div id="paymentList_container">
	<div style="width: 75%; border-bottom: 1px solid black;margin:30px auto 30px auto;font-size: 24px;height: 60px;font-size: 35px; ">
		<span>결제내역</span><br>
	</div>
		<div id="paymentList_div">
					<%int total_price=0,total_saled_price=0,total_sale=0; %>
		<%if(list.size()==0){ %>	<!-- /* 리스트에 아무것도 안 들어있거나 현재진행 중인 강의가 없을때 */ -->
			결제 내역이 없습니다.
		<%}else{ %>
			<table id='table' style="width: 90%;border-collapse: collapse; margin:auto;">
				<tr style="border:1px solid black; background-color: #333; font-size: 17px; color:white; height: 30px;">
					<td>수강생</td>
					<td>강의명</td>					
					<td>가격</td>
					<td>할인적용가</td>				
					<td>결제일</td>
					<td style="border:0px;width: 75px;"></td>
				</tr>
		
				<%for(int i=0;i<list.size();i++){ %>
						<%total_price+=list.get(i).getPrice(); %>
						<%total_saled_price+=(int)(list.get(i).getPrice()*(1-list.get(i).getSale())); %>
						<%total_sale+=(int)(list.get(i).getPrice()*list.get(i).getSale()); %>
					
					<tr style="border:1px solid black; height: 25px;">
						<td><%=list.get(i).getMember_name() %></td>
						<td><%=list.get(i).getName() %></td>
						<td><%=(list.get(i).getPrice()+"").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>원</td>
						<td><%=((int)(list.get(i).getPrice()*(1-list.get(i).getSale()))+"").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>원 <%=(int)(list.get(i).getPrice()*list.get(i).getSale())==0?"":"(-"+((int)(list.get(i).getPrice()*list.get(i).getSale())+"").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")+")"%></td>
						<td><%=list.get(i).getDate() %></td>
						<td style="border:0px;">
							<%if(list.get(i).getFinished()==1){ %>
								<span style="color:gray;">수강마감</span>
							<%}else{ %>
								<span style="color:blue;">수강중</span>
							<%} %>
						</td>

					<tr>

				<%} %>
				
				</table>
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
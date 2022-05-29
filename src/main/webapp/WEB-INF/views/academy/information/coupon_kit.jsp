<%@page import="com.jj.vo.CouponVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<CouponVo> list=(ArrayList<CouponVo>) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(list.size()==0){ %>	<!-- /* 리스트에 아무것도 안 들어있거나 현재진행 중인 강의가 없을때 */ -->
			쿠폰이없습니다.
		<%}else{ %>
			<table id='table' style="width: 90%;border-collapse: collapse; margin:auto;border: 1px solid black; border-bottom:0px;">
				<tr style="background-color: #333;color:white;font-size: 17px; height: 32px; border-bottom:1px solid black;">
					<td style="border:0px;width: 75px;">NO</td>
					<td>쿠폰명</td>
					<td>할인율</td>
					<td>쿠폰만료일</td>						
					<td style="border:0px;width: 77px;">삭제</td>
				</tr>
		
				<%for(int i=0;i<list.size();i++){ %>
					
					
					<tr style="font-size: 17px; height: 32px;border-bottom:1px solid black;">
						<td><%=i+1 %></td>
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

</body>
</html>
<%@page import="com.jj.vo.CouponVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<CouponVo> list=(ArrayList<CouponVo>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#table td{
	border:1px solid black;
	padding: 3px 0;
}


</style>
</head>
<body>
<table id='table' style="width: 90%;border-collapse: collapse; margin:auto;">
				<tr style="border:1px solid black; background-color: #333; font-size: 17px; color:white; height: 30px;">
					<td>쿠폰명</td>
					<td>쿠폰개수</td>
					<td>쿠폰코드</td>						
					<td>할인율</td>
					<td>쿠폰등록가능</td>
					<td>쿠폰발행일</td>				
					<td>쿠폰만료일</td>
					

				
					<td style="background-color:#fff; border:1px solid white; width: 75px;"></td>
				</tr>
				<%ArrayList l=new ArrayList(); %>
				<%for(int i=0;i<list.size();i++){ %>
					<%if(list.get(i).getG()==0){ %>
					
					<tr>
						<td><%=list.get(i).getName() %></td>
						<td><%=list.get(i).getNum() %></td>
						<td><%=list.get(i).getCode() %></td>	
						<td><%=(int)(list.get(i).getSale()*100)%>%</td>
						<td><%=list.get(i).getS_date()+" ~ "+list.get(i).getE_date()%></td>
						<td><%=list.get(i).getDate() %></td>
						<td><%=list.get(i).getU_date() %></td>
					
						<td style="border:0px;">
							<a href='javascript:deleteCoupon(<%=list.get(i).getIdx()%>,<%=list.get(i).getIdx()%>);'>쿠폰삭제</a>
						</td>

					<tr>
					<%}else if (list.get(i).getG()==1){%>
						<%String[] codeArr=list.get(i).getCode().split(","); %>
						<%String[] idxArr=list.get(i).getG_idx().split(","); %>
						<%l.add(list.get(i).getIdx());%>
						<tr>
							<td><%=list.get(i).getName() %></td>
							<td><%=codeArr.length %></td>
							<td>개별쿠폰</td>	
							<td><%=(int)(list.get(i).getSale()*100)%>%</td>
							<td><%=list.get(i).getS_date()+" ~ "+list.get(i).getE_date()%></td>
							<td><%=list.get(i).getDate() %></td>
							<td><%=list.get(i).getU_date() %></td>
					
							<td style="border:0px;">
								<a href='javascript:plusDiv(<%=list.get(i).getIdx()%>);'><span id='plus<%=list.get(i).getIdx()%>'>펼치기</span></a>
							</td>
						<tr>
				
						
						<%for(int j=0;j<codeArr.length;j++){ %>
						
							<tr class='<%=list.get(i).getIdx()%>div' style="display: none;">
								<td style="border:0px;"></td>
								<td>NO.<%=j+1 %></td>
								<td><%=codeArr[j] %></td>	
								<td><%=(int)(list.get(i).getSale()*100)%>%</td>
								<td><%=list.get(i).getS_date()+" ~ "+list.get(i).getE_date()%></td>
								<td><%=list.get(i).getDate() %></td>
								<td><%=list.get(i).getU_date() %></td>
								<td style="border:0px;"><a href='javascript:deleteCoupon(<%=idxArr[j]%>,<%=(idxArr[j].equals(list.get(i).getIdx()+"")&&j!=idxArr.length-1?idxArr[j+1]:idxArr[j])%>);'>쿠폰삭제</a></td>
							<tr>
						
						<%} %>
					
					<%} %>
				<%} %>
				
				</table>
				<script type="text/javascript">


				<%for(int i=0;i<l.size();i++){%>
					if(getCookie('<%=request.getParameter("academyidx")%>cookie<%=l.get(i)%>')!=null){
								plusDiv(<%=l.get(i)%>);
						}
				<%}%>	
				
				
					function deleteCoupon(idx1,idx2){
							ajaxDo('deleteCoupon?idx='+idx1,'');
						
							if(idx1!=idx2){
								setCookie('<%=request.getParameter("academyidx")%>cookie'+idx2,'1',1);
								}
							getCouponList();
						}
					function plusDiv(idx){					
							if($('.'+idx+"div").css('display')=='none'){
								setCookie('<%=request.getParameter("academyidx")%>cookie'+idx,'1',1);
								$('.'+idx+"div").show();
								$('#plus'+idx).html('축소');				
							}else{
								setCookie('<%=request.getParameter("academyidx")%>cookie'+idx,'1',0);
								$('.'+idx+"div").hide();
								$('#plus'+idx).html('펼치기');								
							}
						}
					function setCookie(name, value, exp) {
						var date = new Date();
						date.setTime(date.getTime() + exp*24*60*60*1000);
						document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
						};
				
					function getCookie(name) {
						var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
						return value? value[2] : null;
						};

				</script>
</body>
</html>
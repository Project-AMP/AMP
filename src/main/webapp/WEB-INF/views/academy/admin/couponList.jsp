<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 관리</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#couponMake_div{
padding:20px;
width: 70%;
text-align:left;
height: 100px;
margin:auto;
font-size: 22px;
}
#couponList_div{
width: 100%;
margin:auto;
}
#couponList_container{
width: 1000px;
text-align: center;
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
}
.save_btn{
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
	    font-size: 22px;
	    border-radius: .25rem;
}
</style>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>

<div class="Biggroup">
<div class="Smallgroup">
	
<div id="adminDiv"></div><script type="text/javascript">ajaxDo('admin?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=couponList','#adminDiv');</script>
	<div id="couponList_container">
		<div style="width: 75%; border-bottom: 1px solid black;margin:20px auto 0px auto;font-size: 24px;height: 60px;font-size: 35px; ">
				<span>쿠폰 생성</span><br>
		</div>
		<div id='couponMake_div'>
			<form>
				<table style="margin-bottom: 8px;">
					<tr>
						<td style="width: 150px;">
							쿠폰명
						</td>
						<td>
							<input name='name' type="text">
						</td>
					</tr>
					<tr>
						<td style="">
							할인
						</td>
						<td>
							<input name='sale' type='number' max="99" min="0" value='0'style="width: 40px;"  oninput="if((this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'))>=100)this.value='99'" />%
						</td>
					</tr>
					<tr>
						<td style="">
							등록 기간
						</td>
						<td>
							<input name='s_date' type="date"> ~ <input name='e_date' type="date">
						</td>
					</tr>
					<tr>
						<td style="">
							사용 마감일
						</td>
						<td>
							<input name='u_date' type="date">
						</td>
					</tr>
					<tr>
						<td style="">
							발행 개수
						</td>
						<td>
							<input name='num' type="number" min='0' max="1000" value='0' style="width: 50px;" oninput="if((this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'))>1000)this.value='1000'" >개 
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
						</td>
					</tr>
				
				</table>
				
				<input name='mod' type="checkbox" >개별 발행
				 <br> <span style="font-size: 13px; ">※개별발행시 같은 쿠폰이름으로 서로 다른코드로 발행됩니다.</span><br>
				 <div style="width: 100%; text-align: right;margin-top: 15px;">
				  <input class='save_btn' type="button" value='쿠폰 발행' style="" onclick="makeCoupon(this.form)">
				 </div>
				
				 <script type="text/javascript">
				 	function makeCoupon(f){
							ajaxDo('makeCoupon?sale='+f.sale.value+'&name='+f.name.value+'&academy=<%=request.getParameter("academyidx")%>&s_date='+f.s_date.value+'&e_date='+f.e_date.value+'&u_date='+f.u_date.value+'&num='+f.num.value+'&mod='+f.mod.checked,'')
				                f.reset();
							getCouponList();
				        
						 	}
				 </script>
			</form>
		</div>
			<div style="width: 75%; border-bottom: 1px solid black; border-top: 1px solid black;margin:180px auto 0px auto;font-size: 24px;height: 60px;font-size: 35px;padding-top: 20px; ">
		
				<span>쿠폰 관리</span>
			</div>
		<div id="couponList_div" style="margin:30px auto; width: 100%;">ajax</div>
	</div>
</div>
</div>

<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>

<script type="text/javascript">
	getCouponList();
	function getCouponList(){
		ajaxDo('couponList_kit?academyidx=<%=request.getParameter("academyidx")%>','#couponList_div');
		}

</script>

</body>
</html>
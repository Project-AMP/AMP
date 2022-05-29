<%@page import="com.jj.vo.CouponVo"%>
<%@page import="com.jj.vo.ClassVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
ArrayList<ClassVo> resultnamelist = (ArrayList<ClassVo>) request.getAttribute("resultnamelist");
String academyidx = request.getParameter("academyidx");

// 카테고리 목록 불러오기
ArrayList<ClassVo> kategories = (ArrayList<ClassVo>) request.getAttribute("kategories");

// 회원 쿠폰 리스트 가져오기
ArrayList<CouponVo> mycouponList = (ArrayList<CouponVo>) request.getAttribute("mycouponList");

ClassVo classvo = (ClassVo)request.getAttribute("paging");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청</title>
<link rel="stylesheet"
	href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<link rel="stylesheet" href="resources/CSS/academy/main/footer.css"
	type="text/css">

<style type="text/css">
/* 검색창 */
.search_div {
	display: inline-block;
	position: relative;
	text-align: center;
	width: 400px;
}

#search_input {
	width: 100%;
	border: 1px solid #2c3338;
	margin: 10px 0;
	padding: 10px 12px;
}

.table_hide {
	display: none;
}

#searchbar {
	text-align: center;
	padding: 5px;
	/* border: 1px solid blue; */
	display: inline-block;
}

.table_center {
	display: flex;
	justify-content: center;
	align-items: center;
}

#searchbar_top {
	border: 1px solid #2c3338;
	flex-direction: column;
	display: flex;
	justify-content: center;
	align-items: center;
}

.fa-search {
	position: absolute;
	left: 390px;
	top: 20px;
	margin: 0;
}

#registration_div {
	border: 3px solid #d3d3d3;
	border-radius: 50px;
	margin-top: 20px;
	margin-bottom: 20px;
	width: 800px;
	padding: 30px;
	text-align: center;
}

#registration_container {
	/* border: 1px solid red; */
	
}

#search_classoption {
	display: inline-block;
}

#serach_categori {
	display: inline-block;
}

#search_option {
	margin: -30px 0px 0px 0px;
	border: 1px solid #2c3338;
}

#search_complete {
	margin: 10px 0px 0px 0px;
	text-align: center;
}

.sale {
	display: inline-block;
	width: 400px;
}

.salecode {
	margin: 10px 0;
	padding: 10px 12px;
}

#btn_course {
	display: inline-block;
	margin: 20px;
}

#btn_course1 {
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


<script type="text/javascript">

</script>

</head>
<body>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/JS/ajax/ajax.js"></script>
	<script type="text/javascript">




</script>
	<div id="academyMain_topBarDiv"></div>
	<script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=academyidx%>','#academyMain_topBarDiv');</script>

	<div class="Biggroup">
		<div class="Smallgroup">
			<div id="class_sidebarDiv"></div>
			<script type="text/javascript">ajaxDo('class_sidebar?academyidx=<%=academyidx%> &bgColorSet=registration','#class_sidebarDiv');
			</script>
			<div id="registration_container">

				<div id="registration_div">
					<span style="font-size: 35px;">수강 신청</span><br>
					<br>
					<form action="class_member_apply.do" method="post">
						<!-- 수강신청 버튼 클릭시 폼테그 실행 -->

						<div id="searchbar_top">
							<div id="searchbar">
								<div class="search_div" style="float: right; width: 200px; margin: 0 35px 0 15px;">
									<input id="search_input" type="text" onkeyup="getClassList()">
								</div>


								<div id="serach_categori"
									style="text-align: right; float: right; margin-top: 13px; font-size: 24px;">
									<span style="float: rigth; margin-right: 3px">카테고리 </span> <select
										id='kategorie' onchange="getClassList()"
										style="display: block; float: right; font-size: 16px; padding: 4px;">
										<option value="">전체</option>
										<%for (int i = 0; i < kategories.size(); i++) {%>
											<option value='<%=kategories.get(i).getKategorie()%>'><%=kategories.get(i).getKategorie()%></option>
										<%}%>
									</select>
								</div>
							</div>
							<br>

							<div id="Class_List_Div" style="width: 100%; margin-top: -20px;"></div>
						</div>

						<br> <br>

						<div id="search_option">

							<div class="table_center">
								<table class="table_hide"
									style="text-align: left; margin: 10px 0; font-size: 18px;">
									<input id="classIdx" name="classIdx" type="hidden" />
									<input id="sale_input" name="sale" type="hidden" />
									<tr>
										<td>강의명 :</td>
										<td id="class_name"></td>
									</tr>
									<tr>
										<td>강사 :</td>
										<td id="class_teacher"></td>
									</tr>
									<tr>
										<td>강의실 :</td>
										<td id="class_room"></td>
									</tr>
									<tr>
										<td>강의시간 :</td>
										<td id="class_time"></td>
									</tr>
									<tr>
										<td>시작일 :</td>
										<td id="class_start_date"></td>
									</tr>
									<tr>
										<td>종료일 :</td>
										<td id="class_end_date"></td>
									</tr>
									<tr>
										<td>가격 :</td>
										<td id="class_price"></td>
									</tr>
								</table>
							</div>
						</div>
							
							
							
						<!-- 페이징처리 -->
						<div style="display: block; text-align: center; margin: 10px 10px">
							<c:if test="${paging.startPage != 1 }">
								<a href="registration?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
							</c:if>
							
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<%-- <div>${p} ${paging.nowPage}</div> --%>
								<c:choose>
									<c:when test="${p == paging.nowPage}">
										<a href='javascript:void(0);' onclick="listfunc(${p},${paging.cntPerPage},'<%=academyidx%>')">${p}</a>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<a href='javascript:void(0);' onclick="listfunc(${p},${paging.cntPerPage},'<%=academyidx%>')">${p}</a>
									</c:when>
								</c:choose>
							</c:forEach>
							
							<c:if test="${paging.endPage != paging.lastPage}">
								<a href="registration?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
							</c:if>
						</div>
						<!-- 페이징처리 -->

						<div id="search_complete">

							<div class="sale">
								쿠폰 코드 <select id="selectMyCoupon" onchange="price_discount()"
									style="font-size: 16px;">
									<option id="option_choice" value="1">선택</option>
									<%
									for (int i = 0; i < mycouponList.size(); i++) {
									%>
									<option value='<%=mycouponList.get(i).getSale()%>'><%=mycouponList.get(i).getName()%>
										/
										<%="-" + mycouponList.get(i).getSale() * 100 + "%"%></option>
									<%
									}
									%>
								</select>
							</div>
							<br>
							<div id="btn_course">
								<input type="submit" id="btn_course1" value="수강신청" disabled="disabled">
							</div>

							<input type="hidden"
								value='<%=request.getParameter("academyidx")%>'
								name="academyIdx">
							<!-- 폼태그 실행시 academyidx값도 같이 가져가기 위해 숨겨둠 -->

						</div>


					</form>
				</div>



			</div>
		</div>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/site/main/footer.jsp"%>
	</footer>

	<script type="text/javascript">
		getClassList();
		var price_;
		var idx_ = null; // 1
		var idx_2 = null; //
		
		function getClassList(){	
			$('#btn_course1').attr("disabled",true); // 수강신청버튼 비활성화
			$(".table_hide").css("display","none"); // 테이블 숨기기
			
			$('#classIdx').val(-1);
			$('#class_teacher').text("");
			$('#class_name').text("");
			$('#class_teacher').text("");
			$('#class_room').text("");
			$('#class_time').text("");
			$('#class_start_date').text("");
			$('#class_end_date').text("");
			$('#class_price').text("");
			
			//alert($('#classIdx').val());
			
			ajaxDo('classList_kit?academyidx=' + '<%=academyidx%>' +
			        '&kategorie=' + $("#kategorie").val() + '&keyword='+ $("#search_input").val(), '#Class_List_Div');
		}
		
		
		function lineClicked(classIdx, name, teacher, room, time, S_date,
				E_date, price) {

			price_ = price;
			idx_ = classIdx;

			//쿠폰 초기화
			$("#option_choice").val("").prop("selected", true);
			$(".table_hide").css("display", "block");
			$('#class_price').css("color", "black");

			// 수강신청 버튼 활성화
			$('#btn_course1').attr("disabled", false);

			$('.classTr').css('background-color', 'white');
			$('.classTr').css('font-weight', 'normal');

			$('#classTr' + classIdx).css('background-color', '#ffeb99');
			$('#classTr' + classIdx).css('font-weight', 'bold');
			//$('#classIdx').val(classIdx); // input 태그 값 추가

			$('#classIdx').val(classIdx); // input 태그 값 추가
			$('#class_teacher').text(classIdx);
			$('#class_name').text(name);
			$('#class_teacher').text(teacher);
			$('#class_room').text(room);
			$('#class_time').text(time);
			$('#class_start_date').text(S_date);
			$('#class_end_date').text(E_date);
			$('#class_price').text(price_);

		}
		function checkForm() {
			return true;
		}
		function price_discount() {

			//var classidx = $('#classIdx').val();

			//alert(classidx);

			if ($('#classIdx').val() == -1) {
				alert("강의를 선택해주세요");
				$("#option_choice").val("선택").prop("selected", true);

			} else {

				var discount = $('#selectMyCoupon').val(); // 할인율

				$('#sale_input').val(discount); // 할인율

				if (discount == 0) {
					//alert("1")
					$('#class_price').text(price_ * 1); // 할인값
					$('#class_price').css("color", "black");
				} else {
					//alert("2")
					var result = price_ * discount;
					$('#class_price').text(price_ - result); // 할인값
					$('#class_price').css("color", "red"); // 빨간색
				}

			}

		}
		
		
		function listfunc(p, cntPerPage, academyidx) {
			var p_ = p;
			var cntPerPage_ = cntPerPage;
			var academyidx_ = academyidx
			
			var kategorie_ = $("#kategorie").val() || "";
			var keyword_ = $("#keyword").val() || "";
			
			ajaxDo('classList_kit?kategorie='+ kategorie_ + '&keyword=' + keyword_ + 
					'&academyidx='+ academyidx_ +'&nowPage='+ p_ + '&cntPerPage=' + cntPerPage_
					,'#Class_List_Div');
			
			ajaxDo('registration?academyidx='+ academyidx_ +'&nowPage='+ p_ + '&cntPerPage=' + cntPerPage_
					,'');
			
		}
	</script>
</body>
</html>
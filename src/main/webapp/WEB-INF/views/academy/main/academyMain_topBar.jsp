<%@page import="com.jj.util.FontUtil"%>
<%@page import="com.jj.vo.AcademyStyleVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
FontUtil fontUtil = new FontUtil();
AcademyStyleVo academyStyleVo = (AcademyStyleVo)request.getAttribute("banner_style");

String top_img="";
int top_img_size = 0;
String font_col="#000000";
String hover_col= "#32c2e6";
String back_col= "#ffffff";
int top_font_size = 70;
int font=0;

if(academyStyleVo!=null){
	top_img=academyStyleVo.getTop_img();
	top_img_size =academyStyleVo.getTop_img_size();
	font_col="#"+academyStyleVo.getFont_col();
	hover_col= "#"+academyStyleVo.getHover_col();
	back_col= "#"+academyStyleVo.getBack_col();
	top_font_size = academyStyleVo.getTop_font_size();
	font=academyStyleVo.getFont();
}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 스타일 시트 -->
<link rel="stylesheet" href="resources/CSS/notice/notice.css" type="text/css">
<link rel="stylesheet" href="resources/CSS/topbars/academyMain_TopBar.css" type="text/css">
<link rel="stylesheet" href="resources/CSS/notice/notice_Alarm_bottom.css" type="text/css">

<style type="text/css">
	<%=fontUtil.fontImport()%>
</style>
<!-- 메뉴바 -->
<script>
//웹소켓 연결부
var n = $("#gnb > li:first-child li").length;
var lh = n * 40 + 110;

$("#gnb > li").on("mouseover",function(){
	$("#topBar").stop().animate({"height":lh},300);
	$("#gnb > li").removeClass("select");
	$(this).addClass("select");
});

$("#gnb").on("mouseleave",function(){
	$("#topBar").stop().animate({"height":"110px"},300);
});

</script>
<style type="text/css">
#academyNameDiv a:link { color: black; text-decoration: none;}
#academyNameDiv a:visited { color: black; text-decoration: none;}
#academyNameSpan:hover { color: <%=hover_col%>; text-decoration: none;}
#academyNameSpan{
	color:<%=font_col%>
}

</style>
</head>
<body>

<% 
	String academyidx = request.getParameter("academyidx");
	String user_idx = session.getAttribute("idx")+"";
%>

<header id="topBar" >
<div style=' height: 70px;background-color: <%=back_col%>'>
	<span id="message_notice" ><b style="position: relative;z-index: 7;">새로운 메시지가 도착했습니다.</b></span>
	
	<div style="float: left;height:100%; margin: 0px 10px 0px 8px;"> <!-- 탑바 학원 로고 -->
		<a href='academyMain?academyidx=<%=academyidx%>'>
			<span style=" display: inline-block;height: 100%;vertical-align: middle; width: 0px; font-size: 0;"></span>
			<img alt="" src='resources\IMG\academy_style\<%=top_img%>' style='height:<%=top_img_size%>%; max-height: 100%;display: inline-block;vertical-align: middle;'>
		</a>
	</div>
	
	<div id='academyNameDiv' style="height: 100%; float: left;"><!-- 탑바 학원 이름 -->
	
		<a href='academyMain?academyidx=<%=academyidx%>' style="">
			<span style=" display: inline-block;height: 100%;vertical-align: middle; width: 0px; font-size: 0;"></span>
			<span id='academyNameSpan'  style="font-size: <%=57*top_font_size/100%>px; display: inline-block;vertical-align: middle;margin-top:<%=fontUtil.getMarginTop(font) %>px; font-family:<%=fontUtil.getFont(font)%> ">
				<%=request.getAttribute("academyName") %>
			</span>
		</a>
	</div>
		<!-- 로그인 조인 -->
		<h1 style="margin-right: 10px;"> 
		<%if(user_idx!=null&&!user_idx.equals("null")&&Integer.parseInt(academyidx)==-Integer.parseInt(user_idx)) {%>
		<a href="rim?academyidx=<%=academyidx%>"> 학원 관리 | </a> 
		<%} %>
		<%=(session.getAttribute("idx")==null)?"<a href='login'>LOGIN JOIN</a> | <a href='main'>MAIN</a>" : 
			request.getAttribute("name")+"님 환영합니다  |  <a href='logout'>LOGOUT</a> | " + 
		"<a style='cursor: pointer;' onclick='notice_alarm()'><img style='margin:10px 0 -10px 0;' src='resources/IMG/notice/bell.png' height='30px'; ></a>" + 
		" | <a href=''>구독중</a> | <a href='message?academyidx="+academyidx+"' class='message_text'><img style='margin:10px 0 -10px 0;' src='resources/IMG/site/top_bar/messageIcon.png' height='30px'; > <span id='message_count' class='nav-counter'>0</span></a>| <a href='main'>MAIN</a>" %></h1>
		
		
		<!-- 공지사항 모달창 -->
		<div id="modal" class="searchModal" style="display: none; ">
			<div class="search-modal-content">
				<div style="text-align: left" class="page-header">
					<p>공지사항 알림</p>
				</div>
					<div class="row" >
						<div  class="col-sm-12">
							<div class="row">
								<div id="myList"></div> <!-- ajax List -->
							</div>
						</div>
					</div>
					
					<hr>
				<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="closeModal();">
					<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">닫기</span>
				</div>
			</div>
		</div>
</div>	
	<!-- <img alt="" src="" width="" style="cursor: pointer;"> -->
		
    <!-- 메뉴바 -->
   <!-- <div class="top_banner">상단 배너</div> -->
   
   <nav id="nav" >
    <ul id="gnb">
    	<li><a>수강</a>
        	<ul class="sub">
        		<li><a href="registration?academyidx=<%=academyidx%>">수강 신청</a></li>
                <li><a href="consult?academyidx=<%=academyidx%>">수강 상담</a></li>
           		<li><a href="registration_teacher?academyidx=<%=academyidx%>">강사 소개</a></li>
            </ul>
        </li>
        
        <li><a>소통</a>
        	<ul class="sub">
            	<li><a href='message?academyidx=<%=academyidx%>'>메세지</a></li>
                <li><a href="notice?academyidx=<%=academyidx%>">공지사항</a></li>
            </ul>
        </li>
        <li><a>내 정보</a>
        	<ul class="sub">
        		<%-- <li><a href="myclass?academyidx=<%=academyidx%>">내 강의</a></li> --%>
        		<li><a href="classcheck?academyidx=<%=academyidx%>">수강 현황</a></li>
            	<li><a href="coupon?academyidx=<%=academyidx%>">쿠폰</a></li>
            	<li><a href="payment?academyidx=<%=academyidx%>">결제내역</a></li>
            </ul>
        </li>
    </ul>
    </nav>
    
</header>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">
	$( document ).ready(function() {
		// 로그인이 안된경우
		<%if(session.getAttribute("idx") == null){%>
			$('.searchModal').hide();
		<%}%>
		
		// 로그인이 됐을경우
		<%if(session.getAttribute("idx") != null){%>
			$('.searchModal').hide();
			ajaxDo('myNoticeAlarmList.do?user_idx='+<%=user_idx%>,'#myList');		
		<%}%>
		
		
	});
	
	
	<%if(session.getAttribute("idx")!=null){%>/* 알림: 로그인 시에만  */
		message_new();/* 첨에 메시지 갯수 확인 */
		let sock = new SockJS("echo");//웹소켓 연결부
		let sock2 = new SockJS("echo2"); // 웹소켓 연결부2	

		sock.onmessage = onMessage_top;/*상대 또는 본인  메시지 전송 감지시 자동 실행 메서드*/
		sock.onclose = onClose_top;/* 메시지 연결 끊고 싶을때 실행하는 메서드 */
		sock2.onmessage = onNotice_bottom;
		sock2.onclose = onClose_top2;

		function onMessage_top(msg){
			var json=JSON.parse(msg.data);
			if(ajaxDo('isMyRoom?roomId='+json.roomId)=='true'){	/* 본인이 속한 방이면	 */		
				message_new();
				messageNotice(json.roomId);
			}
		}// onMessage_top
		
		function onNotice_bottom(msg) {
			ajaxDo('myNoticeAlarmList.do?user_idx='+<%=user_idx%>,'#myList');
			
			var json = JSON.parse(msg.data);
			if(ajaxDo('myAcademy_notice?academyidx='+json.academy_idx)=='true'){	    
			    
			    var toast = "<div class='position-fixed bottom-0 end-0 p-3' style='z-index: 15'>";
			    toast += "<div id='liveToast' class='toast hide' role='alert' aria-live='assertive' aria-atomic='true'>";
			    toast +=  "<div class='toast-header'>";
			    toast +=   "<img src='resources/IMG/site/notice/baseline_notifications_active_black_24dp.png' class='rounded me-2' alt='...'>";
			    toast +=   "<strong class='me-auto'>알림</strong>";
			    toast +=   "<small>just now</small>";
			    toast +=   "<button type='button' class='btn-close' data-bs-dismiss='toast' aria-label='Close'></button>";
			    toast += "</div>";
			    toast += "<div class='toast-body'>" + json.notice+"!!" + "</div></div></div>";

			    
			    $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
			    $(".toast").toast({"animation": true, "autohide": true});
			    $('.toast').toast('show');
			    
			}else{
				
			}
		}
		

		function onClose_top(){	
		}
		function onClose_top2(){	
			let sock2 = new SockJS("echo2"); // 웹소켓 연결부2
		}
		function message_new(){ /* 새메시지 갯수 알림 */
			var newMessage=ajaxDo('hasNewMessage',''); /* 본인이 속한방에 안읽은 메시지가 몇개냐 */
			if(newMessage=='0')
				$('#message_count').hide();	
			else{
				$('#message_count').text(newMessage);	
				$('#message_count').show();	
						
			}
		}
		var canMessageNotice=1;
		function messageNotice(room){/* 새메시지 팝업 알림  */
		
			if(canMessageNotice==1&& (typeof room_click == 'undefined'||room_click!=room) ){	
				/* 
				if(1.팝업 알림 딜레이가 끝났다면  &&  (2.messag페이지가 아니거나message페이지에서도 그방에 없다면)   ) 
					1.팝업이 미친듯이 뜨는걸 방지
					2.본인이 그방에 입장중이라면 팝업 알림 띄우지 않음
				*/
				$("#message_notice").slideDown(400).delay(2000).slideUp(1000);/* 팝업알림 애니메이션 */
				canMessageNotice=0;
				setTimeout(function(){ canMessageNotice=1 }, 5000);/* 팝업알림 딜레이 */
				}
		
		}
		function notice_alarm() {
			//alert("알람창");
			var modal = document.getElementById("modal");
			modal.style.display = "block";
			$('.searchModal').show();
		}
		
		/* 공지사항 모달 알림창 */
		function closeModal() {
			$('.searchModal').hide();
		};

		/* 모달창 밖의 영역 클릭시 닫힘 */
		window.onclick = function(e) {
			if(e.target == modal)
			{
				$('#modal').hide();
			}
		}
		
	<%}%>
		
	
</script>
<div id="msgStack"></div>


</body>
</html>
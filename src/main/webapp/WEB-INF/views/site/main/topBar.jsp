<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String user_idx = session.getAttribute("idx")+"";
%>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 스타일 시트 -->
<link rel="stylesheet" href="resources/CSS/topbars/topBar.css" type="text/css">
<link rel="stylesheet" href="resources/CSS/notice/notice_Alarm_bottom.css" type="text/css">

<script>
var n = $("#gnb > li:first-child li").length;
var lh = n * 40 + 157;

$("#gnb > li").on("mouseover",function(){
	$("header").stop().animate({"height":lh},300);
	$("#gnb > li").removeClass("select");
	$(this).addClass("select");
});

$("#gnb").on("mouseleave",function(){
	$("header").stop().animate({"height":"157px"},300);
});




function enterKey(){

	 if (window.event.keyCode == 13) {
       location.href='tagSearch?keyword='+$('#searchText').val();
   }
}



</script>

</head>
<body>
<header>
	<span id="message_notice" ><b style="position: relative;z-index: 7;">새로운 메시지가 도착했습니다.</b></span>
	<!-- 로그인 조인 -->
	<h1 style="margin-right: 10px;"> <%=(session.getAttribute("idx")==null)?"<a href='login'>LOGIN JOIN</a> | <a href='main'>MAIN</a>":
		request.getAttribute("name")+"님 환영합니다  |  <a href='logout'>LOGOUT</a> | <a style='cursor: pointer;' onclick='notice_alarm()'><img style='margin:10px 0 -10px 0;' src='resources/IMG/notice/bell.png' height='30px'; ></a> | <a href=''>구독중</a> |"+
		"<a href='message' class='message_text'><img style='margin:10px 0 -10px 0;' src='resources/IMG/site/top_bar/messageIcon.png' height='30px'; > <span id='message_count' class='nav-counter'>0</span></a>| <a href='main'>MAIN </a>" %> </h1>
		

	<!-- 검색창 -->
	<script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>
    <div class="search">
    	<i class="fas fa-search"></i>
    	<input id="searchText" class="searchText" type="text" placeholder="태그를 입력해주세요. ex) 취업" value='<%=request.getParameter("keyword")==null?"":request.getParameter("keyword")%>' onkeydown="enterKey()" onkeyup='getSearchbar()'>
    </div>
	
	
	
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
	
	
	
    <!--서치바  -->
     <div id='searchbar' style=""></div>
    <script type="text/javascript">

	function getSearchbar(){
		ajaxDo('searchbar?keyword='+$('#searchText').val(),'#searchbar');
		$('#searchbar').show();
			if($("#searchText").val()=="")
				$('#searchbar').hide();
				
		}
		
	$('html').click(function(e) { 
		if((!$(e.target).hasClass("searchbar"))&&$("#searchbar").css("display")=="block"&&(!$(e.target).hasClass("searchText"))) { 
			$('#searchbar').hide();
			} 
		if($("#searchbar").css("display")=="none"&&$(e.target).hasClass("searchText")&&!$("#searchText").val()=="") { 
			$('#searchbar').show();
			getSearchbar();
			} 
		
	});

    </script>
    <!-- 메뉴바 -->
    <nav id="nav">
    <ul id="gnb" style="width:800px;">
    	<li><a href="communityMain">커뮤니티</a><li>
    	<li><a href="myinfoMain">내 정보</a><li>
    	<li><a href="timetable">시간표</a><li>
    	<li><a href="event">이벤트</a><li>
    	<!-- <li><a href="tagSearch?keyword=입시/보습">입시/보습</a>
        	<ul class="sub">
            	<li><a href="tagSearch?keyword=수학">수학</a></li>
                <li><a href="tagSearch?keyword=국어">국어</a></li>
                <li><a href="tagSearch?keyword=한국사">한국사</a></li>
                <li><a href="tagSearch?keyword=사탐/과탐">사탐/과탐</a></li>
            </ul>
        </li>  
        <li><a href="tagSearch?keyword=취업">취업</a>
        	<ul class="sub">
            	<li><a href="tagSearch?keyword=IT">IT</a></li>
            	<li><a href="tagSearch?keyword=프로그래밍">프로그래밍</a></li>
            </ul>
        </li>
        <li><a href="tagSearch?keyword=외국어">외국어</a>
        	<ul class="sub">
            	<li><a href="tagSearch?keyword=영어">영어</a></li>
                <li><a href="tagSearch?keyword=일본어">일본어</a></li>
                <li><a href="tagSearch?keyword=중국어">중국어</a></li>
                <li><a href="tagSearch?keyword=기타언어">기타언어</a></li>
            </ul>
        </li>
        <li><a href="tagSearch?keyword=예체능">예체능</a>
        	<ul class="sub">
            	<li><a href="tagSearch?keyword=미술(입시)">미술(입시)</a></li>
                <li><a href="tagSearch?keyword=음악(입시)">음악(입시)</a></li>
                <li><a href="tagSearch?keyword=체육">체육</a></li>
            </ul>
        </li>
        <li><a href="tagSearch?keyword=취미">취미</a>
        	<ul class="sub">
            	<li><a href="tagSearch?keyword=요리">요리</a></li>
                <li><a href="tagSearch?keyword=제빵">제빵</a></li>
                <li><a href="tagSearch?keyword=음악(취미)">음악(취미)</a></li>
                <li><a href="tagSearch?keyword=미술(취미)">미술(취미)</a></li>
            </ul>
        </li> -->
    </ul>
    </nav>
</header>
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
		}//  onNotice_bottom()
		
		function onClose_top(){	
		}
		
		function onClose_top2(){	
			let sock2 = new SockJS("echo2") // 웹소켓 연결부2
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
				$('.searchModal').hide();
			}
		}

	<%}%>
		
	
	</script>
	<div id="msgStack"></div>
</body>
</html>
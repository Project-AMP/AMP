<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String academyidx = request.getParameter("academyidx");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<!-- 웹소켓 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>


<!-- summernote -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<title>공지사항작성</title>
<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});	
	
	$(document).ready(function() {
		  $('#summernote').summernote({
		        
			  placeholder: '내용을 작성해주세요',
			  tabsize: 2,
		      minHeight: 400,
		      maxHeight: null,
		      lang : 'ko-KR'
		  });
		  connectWs();		    
	}); // $(document).ready
	
	
	//전역변수 선언
	 var socket2 = null;
	
    function connectWs(){
	   
	  var sock2 = new SockJS("echo2");//웹소켓 연결부
      socket2 = sock2;
	   
      sock2.onopen = function(evt) {}; // sock.onopen
      sock2.onclose = function() {}; // sock.onclose
      sock2.onerror = function (err) {console.log('Errors : ' , err);};
      
  } // connectWs()
	
	
	function notice_write_save() {
		
		if($('#title_id').val().trim() == "")
		{
			alert("제목을 입력해주세요!");
			return false;
		}else if($('#summernote').val().trim() == "")
		{
			alert("내용을 입력해주세요!");
			return false;
		}
		else{
			alert("글 작성완료");
			
			var title_id =  document.getElementById( 'title_id' ).value;
			var title_content = document.getElementById('summernote').value;
			
			var Notice_Data = {
					"notice_academyidx" : '<%= academyidx %>',
					"title_id" : title_id,
					"title_content" : title_content
			};
			
			
			
			// DB에 저장
			$.ajax({
				
				type:'post',
				url:'notice_write_alarm_save.do',
				data : JSON.stringify(Notice_Data),
				contentType:"application/json; charset=utf-8",
				dataType:'text',
				async:false,
				success:function(data, textStatus){
					
					if(socket2){
						
						var socketMsg = {"notice" : "새로운 공지사항이 왔습니다.", "academy_idx" : '<%=academyidx%>'};			
						socket2.send(JSON.stringify(socketMsg));
						
						return true;
					}// if
					
				}, // success:function()
				error: function(jqXHR, textStatus, errorThrown) {
					
				}
			}); // ajax
			
			return true;
		}
		
	} // notice_write_save()
	
</script>

<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>

</head>

<body>
	<article>
		<div class="container" role="main">
			<h2>공지사항</h2>

			<form action='notice.do?academyidx=<%=academyidx %>' name="form" id="form" role="form" method="post" onsubmit="return notice_write_save();">
				
				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="title" id="title_id"
						placeholder="제목을 입력해 주세요">
				</div>


				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content"
						id="summernote" placeholder="내용을 입력해 주세요"></textarea>
				</div>



				<!-- <div class="mb-3">
					<label for="tag">TAG</label> <input type="text"
						class="form-control" name="tag" id="tag" placeholder="태그를 입력해 주세요">
				</div> -->
				
				<div style="text-align: right">
					<button type="submit" class="btn btn-sm btn-primary" id="btnSave" >저장</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='notice.do?academyidx=<%=academyidx%>';">목록</button>
				</div>
			</form>

		</div>

	</article>

</body>

</html>


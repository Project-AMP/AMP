<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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

<title>이벤트작성</title>
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
	
	

	
	
	function event_write_save() {
		var fileCheck = document.getElementById("file").value;
		
		var frm = document.getElementById("form");
		var fd = new FormData(frm);
		
		if($('#title_id').val().trim() == ""){
			alert("제목을 입력해주세요!");
			return false;
		}else if($('#summernote').val().trim() == ""){
			alert("내용을 입력해주세요!");
			return false;
		}
		else if(!fileCheck){
			alert("이미지를 선택해주세요");
			return false;
		}
		else{
			alert("글 작성완료");
			
			var title_id =  document.getElementById( 'title_id' ).value;
			var title_content = document.getElementById('summernote').value;
			//var title_image = document.getElementById('file').value;
			//alert(title_image);
			
			var Event_Data = {
					"title_id" : title_id,
					"title_content" : title_content,
					"request" : fd
			};
			
			//alert(title_id+title_content);
			
			// DB에 저장
			$.ajax({
				method:'POST',
				url:'event_save.do',
				data : Event_Data,
				//contentType:"application/json; charset=utf-8",
				dataType:'TEXT',
				async:false,
				success:function(data){
					if(data == 'success'){
						alert("저장 성공");
					}
					
				}, // success:function()
				error : function(request,status,error) {
					alert("실패");
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			}); // ajax
			

			return true;
		}
		
	} // notice_write_save()
	
	// 이미지파일인지 검사
	function fileCheck(obj) {
		
	    pathpoint = obj.value.lastIndexOf('.');
	    filepoint = obj.value.substring(pathpoint+1,obj.length);
	    filetype = filepoint.toLowerCase();
	    if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
	
	        // 정상적인 이미지 확장자 파일일 경우 ...
	
	    } else {
	        alert('이미지 파일만 선택할 수 있습니다.');
	
	        parentObj  = obj.parentNode
	        node = parentObj.replaceChild(obj.cloneNode(true),obj);
	        $("#file").val("");
	        return false;
	    }
	    if(filetype=='bmp') {
	        upload = confirm('BMP 파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다.\n그래도 계속 하시겠습니까?');
	        if(!upload) return false;
	    } 
	    
	
	}
	
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
			<h2>이벤트 작성</h2>

			<form action='event' name="form" id="form" role="form" method="post" onsubmit="return event_write_save();">
				<div>이미지 선택: <input type="file" id="file" name="file" onchange="fileCheck(this)" accept="image/gif,image/jpeg,image/png"> </div>

				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="title" id="title_id"
						placeholder="제목을 입력해 주세요">
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="summernote" placeholder="내용을 입력해 주세요"></textarea>
				</div>
				
				<div style="text-align: right">
					<button type="submit" class="btn btn-sm btn-primary" id="btnSave" >저장</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='event';">목록</button>
				</div>
			</form>

		</div>

	</article>

</body>

</html>


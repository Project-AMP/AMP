<%@page import="com.jj.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String academyidx = request.getParameter("academyidx");
	NoticeVo notice_update_detail = (NoticeVo) request.getAttribute("notice_update_detail");
	String idx = request.getParameter("idx");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
</script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">


<title>공지사항 수정</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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
		      lang : 'ko-KR'/* ,
		      onImageUpload: function(files, editor, welEditable) { 
		    	  sendFile(files[0], editor, welEditable); 
		       } */

		       
		  });
		  
		});
	
	function notice_write_update_save() {
		
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
		
			return true;
		}
		
	} // notice_write_save()
	
	function notice_write_list() {
		location.href="#";
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
			<h2>공지사항 수정</h2>

			<form name="form" id="form" role="form" method="post" onsubmit="return notice_write_update_save();" 
							action="notice_update2.do">
				<input type="hidden" name="academyidx" value="<%=academyidx%>">
				<input type="hidden" name="idx" value="<%=idx%>">
				<div class="mb-3">
					<label for="title">제목</label> 
					<input type="text" class="form-control" name="title" id="title_id" value="<%=notice_update_detail.getTitle() %>"
						placeholder="제목을 입력해 주세요">
				</div>


				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content"
						id="summernote" placeholder="내용을 입력해 주세요"><%=notice_update_detail.getCon() %></textarea>
				</div>



				<!-- <div class="mb-3">
					<label for="tag">TAG</label> <input type="text"
						class="form-control" name="tag" id="tag" placeholder="태그를 입력해 주세요">
				</div> -->
				
				<div style="text-align: right">
					<!-- <button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="notice_write_save()">저장</button> -->
					<button type="submit" class="btn btn-sm btn-primary" id="btnSave" >수정</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='notice.do?academyidx=<%=academyidx%>';">목록</button>
				</div>
			</form>

		</div>

	</article>

</body>

</html>


<%@page import="com.jj.vo.AcademyStyleVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%AcademyStyleVo academyStyleVo = (AcademyStyleVo)request.getAttribute("banner_style");


String main_img="defImg.PNG";
int main_size=40;

if(academyStyleVo!=null){
	
	main_img=academyStyleVo.getMain_img();
		if(main_img==null)
			main_img="defImg.PNG";
	main_size=academyStyleVo.getMain_size();
		if(main_size==0)
			main_size=40;
		
} 
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학원 메인</title>
<style type="text/css">
.main_img{
width: <%=main_size %>%;
margin: 50px auto;
}
.main_banner{
border: 3px solid black;
width: 1000px;
height: 600px;
margin: auto;
margin-top: 100px;
}
.review{
border: 3px solid black;
width: 1000px;
height: 100%;
margin: auto;
margin-top: 100px;
padding:10px;
}
li {list-style: none}
</style>

<!-- sockjs -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<!--  jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>



</head>




<body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<%  
	String academyidx = request.getParameter("academyidx");
%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>
<div class="main_img" >
		<img src="resources/IMG/academy_style/<%=main_img %>" style="width: 100%; margin: 0px auto -4px auto;">
	</div>

	
	
	
	<div class="review">
	
	<div id="academy_reviewDiv"></div>
	<script type="text/javascript">ajaxDo('academy_review?academyidx=<%=request.getParameter("academyidx") %>','#academy_reviewDiv');</script>
	
	</div>
	<br>
	<br>
	

	
<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>

<script>
$(function() {
   
        
    $("#TopButton").click(function() {
        $('html').animate({scrollTop : 0}, 600);
    });
 
    $("#BottomButton").click(function() {
        $('html').animate({scrollTop : ($('#footer').offset().top)}, 600);
    });
});

function review_write() {
	ajaxDo('academy_review_write.do?content='+$('#content').val()+'&academyidx=<%=academyidx%>','');
	ajaxDo('academy_review?academyidx=<%=request.getParameter("academyidx") %>','#academy_reviewDiv');
}

function review_delete(idx){
	ajaxDo('academy_review_delete.do?idx='+idx,'');
	ajaxDo('academy_review?academyidx=<%=request.getParameter("academyidx") %>','#academy_reviewDiv');
}
</script>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<script src="/docs/5.0/assets/js/docs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.js"></script>
<script src="/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>



</body>
</html>



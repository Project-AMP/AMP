<%@page import="com.jj.vo.ReviewVo"%>
<%@page import="java.util.ArrayList"%>
<%ArrayList<ReviewVo> list=(ArrayList<ReviewVo>)request.getAttribute("list"); %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<title>Insert title here</title>

<style type="text/css">

#content{
margin:auto 0;
width:960px;
height:100px;
resize:none;
margin-left:20px;
}
.btn{
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
	    padding: .175rem .45rem;
	    font-size: 22px;
	    border-radius: .25rem;
	    float:right;
	    margin-right: -20px;
}


</style>

</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
    $('#content').on('keyup', function() {
        $('#comentlength').html("("+$(this).val().length+" / 500)");
 
        if($(this).val().length > 500) {
            $(this).val($(this).val().substring(0, 500));
            $('#comentlength').html("(500 / 500)");
        }
    });
});
</script>
<header>

  
<div>	
 	<div class="container">
        <label for="content" style="font-weight:bold"> Review</label>
        
        <div style="text-align:center;">
        <form name="insertReviewForm">
        
            <div class="input-group" style="width:960px; margin-bottom: 30px;">
               <%-- <input type="hidden" name="bno" value="${detail.bno}"/> --%>
               <!-- <input type="text" class="form-control" id="content" name="content" style="margin-left:20px; width:960px" placeholder="내용을 입력하세요."> -->
               
               <textarea class="form-control" id="content" name="content" placeholder="내용을 입력하세요."></textarea>
               <div style="display:inline-block; font-size:15px; margin-bottom:10px;">
			   <div style="display:inline-block;">남은 글자 수 : 
			   <div style="display:inline-block;" id="comentlength">(0 / 500)
			   
			   </div></div></div>
			
             
               
       			<button class="btn btn-default" type="button" name="insertReviewBtn" onclick="review_write()">등록</button>
            </div>
            
        </form>
             
        </div>
    </div>
    
    <div class="container" style="text-align:left; padding-bottom: 15px;">
    <% for(int i=0; i<list.size(); i++) { %>
    	<div style="margin-top:12px;">
    	<span style="background-color:#f0eded; margin-left: 20px;"><%=list.get(i).getName() %></span> / <%=list.get(i).getDate() %>  	  	
    	</div>
        <div class="commentList"><div style="word-wrap:break-word; width:960px; margin-left:20px;margin-top: 4px;"><%=list.get(i).getCon()%></div></div>
        <%if(i!=list.size()-1){ %><hr style="margin-left:20px; width:960px; border:1px solid black;margin-top: 15px;"><%}%>
        <%}%>
    </div>
</div>

</header>

</body>

</html>

























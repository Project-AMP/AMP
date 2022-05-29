<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String id = (String)request.getAttribute("id");
%>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<style type="text/css">
		body{
			background-color: #2c3338;
		}
		
		.pw_check{
			border: 1px solid #ccc;
	    	font-size: 15px;
	  	  	color: #555;
	   	 	height: 35px;
	    	box-sizing: border-box;
	   	 	padding: 10px;
	    	line-height: 1;
	    	margin-bottom: 0;
		}
		
		.pw_ok{
			height: 40px;
			width:80px;
			background-color: #ea4c88;
			color: #eee;
			font-weight: 700;
			border-radius : 5px;
			 border: 0;
			 
			 cursor: pointer;
		}
		.pw_ok:hover{
			background-color: #d44179;
			
			-webkit-transition: all 0.2s ease-in-out; 
			-moz-transition: all 0.2s ease-in-out; 
			-o-transition: all 0.2s ease-in-out; 
			transition: all 0.2s ease-in-out;
		}
	</style>
	
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/JS/ajax/ajax.js"></script>
	<script type="text/javascript">
		
	// 21.04.04 진렬 수정
		$(document).ready(function(){
			
			$('#pw_ok').on('click',function(){
				var pw1 = $('#pw').val().trim();
				var pw2 = $('#pw_check').val().trim();
				
				alert(pw2);
				
				var url = "updatepw_ok.do?pw="+pw2+"&id=" + '<%= id %>';
				
				if(pw1 == pw2){
					
					<%-- location.href="updatepw_ok.do?pw="+pw2 +"&id=" + '<%= id %>'; --%>
					
					//alert("성공");
					if( ajaxDo(url,'') == "true" ){
						alert("비밀번호 변경 성공");
						location.href="login";
					}else{
						alert("비밀번호 변경 실패");
					}
					
					
				}else{
					alert("비밀번호가 일치하지 않습니다.");
					$('#pw_check').val('');
					$('#pw_check').focus();
				}
			});
			
		});

	</script>
</head>

<body>

	<div style=" display: grid; place-items: center; height: 100vh;">
	
		<form action="" method="get">
			<div style="border:3px solid #d3d3d3;  padding: 30px">
				<div style="margin-bottom: 10px">
					<input id="pw" class="pw_check" type="password" placeholder="비밀번호"/>
				</div>
				
				<div style="margin-bottom: 10px">
					<input id="pw_check" class="pw_check" type="password" placeholder="비밀번호 확인"/>
				</div>
				
				<div style="text-align: right;">
					<input id="pw_ok" class="pw_ok" type="button" value="확인" onclick=""/>
				</div>
			</div>
		</form>

	</div>

</body>
</html>
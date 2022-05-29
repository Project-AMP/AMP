<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>약관 동의</title>
	
	<script type="text/javascript">
	function agree_check(){

		var agree = document.getElementsByName("agree");
		
		
		if(agree[0].checked){
				return true;
			}
		else{
				alert("동의에 체크해주세요");
				return false;
			}
					
	}
		
</script>
	
	<style type="text/css">
	
	body{
			background-color: #2c3338;
		}
		
		.agree_container{
		width: 750px;
		margin:20px auto;
		}
		
		.agree_div{
		border: 1px solid #d3d3d3;
		margin:auto;
		overflow: scroll;
		width: 700px;
		height: 300px;
	}
	.test {
	margin-bottom: 20px; 
	}
	.test td{
	border: solid 1px black;
	padding:5px;
	font-size: 18px;
	}
	.next{
	height: 40px;
	width:90px;
	background-color: #ea4c88;
	color: #eee;
	font-weight: 700;
	border-radius : 5px;
	border: 0;
	cursor: pointer;
	font-size: 15px;
	}
	.next:hover{
			background-color: #d44179;
			
			-webkit-transition: all 0.2s ease-in-out; 
			-moz-transition: all 0.2s ease-in-out; 
			-o-transition: all 0.2s ease-in-out; 
			transition: all 0.2s ease-in-out;
		}
	</style>
	
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar','#topBarDiv');</script>

<div style=" display: grid; place-items: center;">
<h2 style="text-align: center; color:#fff; margin:20px">AMP(Academy Management Program) 약관</h2>
	<form name="f" action="phone" method="post" onsubmit="return agree_check()">
		<div style="border: solid 3px #d3d3d3; padding:20px; color:#fff; display: grid; place-items: center;">
			<table class="test">
				<td style="background-color: yellow; color:#000;">1.약관동의</td>
				<td>2.번호인증</td>
				<td>3.정보입력</td>
			</table>
			<div class="agree_container">
				<div>
					<div class="agree_div">
						<p>
						AMP 서비스 내 회원관리 및 서비스 제공을 위해 개인정보 제공을 위한 약관입니다.<br>
						정보는 개인정보 제3자 제공 동의 시 부터 서비스 탈퇴 시 지체없이 파기됩니다.<br><br>
						제공 항목 : 이름, 핸드폰 번호, E-Mail, 주소, 생년월일</p>
					</div>
					<input id="agree1" class="agree" type="checkbox" name="agree" style="margin-left: 25px">
					<label for="agree1" style="cursor: pointer;"><span class="agree_span">내용을 확인하였으며,동의합니다.</span></label>
					<input type="hidden" name="platform" value='<%=request.getAttribute("platform")%>'>
					<input type="hidden" name="email" value='<%=request.getAttribute("email")%>'>
					<br>
				</div>
			</div>
			<input type="submit" class="next" value="동의">
		</div>
	</form>
	</div>
</body>
</html>
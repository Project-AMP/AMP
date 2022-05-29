<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html id="login_html">
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="resources/CSS/site/member/login.css">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script src="resources/JS/ajax/ajax.js"></script>
	<script type="text/javascript">
		function agree() {
			$('#goPhone').submit();
			return true;
		}
		
		function find() {
			location.href="#";
			return true;
		}
		function kakaoLogin(){
			location.href='<%=request.getAttribute("kakaoLoginUrl")%>'
		}
		function googleLogin(){
			location.href='<%=request.getAttribute("googleLoginUrl")%>'
		}
		function naverLogin(){
			location.href='<%=request.getAttribute("naverLoginUrl")%>'
		}
		function facebookLogin(){
			location.href='<%=request.getAttribute("faceLoginUrl")%>'
		}

		function login(){
				var s=ajaxDo("normalLogin?id="+$("#login__id").val()+"&pw="+$("#login__password").val(),"");
				if(s=="1"){
						alert("환영합니다.");
						return true;
					}else if(s=="2"){
						alert("존재하지 않는 아이디");
					
						return false;
						}
					else if(s=="3"){
						alert("존재하지 않는 비밀번호");
					
						return false;
						}
					else{
						alert("로그인 실패");
					
						return false;
						}
			}
	</script>
</head>
<body id="login_body" style="height: 100vh;display:flex; flex-direction: column; ">
	
	<form id='goPhone' action="agree" method="post">
		<input type="hidden" name="platform" value="normal">
		</form>

<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar','#topBarDiv');</script>
	

		
<div id="login_container" style="flex: 1; " >
		 
	
		<div class="align" style="">
		<div>
			  <div class="grid">
			
			    <form action="main" method="post" class="form login" onsubmit="return login();">
			
			      <div class="form__field">
			        <label for="login__id"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg><span class="hidden">ID</span></label>
			        <input id="login__id" type="text" name="id" class="form__input" style="height: 53px;padding-left: 5px;" placeholder="ID" required>
			      </div>
			
			      <div class="form__field">
			        <label for="login__password"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#lock"></use></svg><span class="hidden">Password</span></label>
			        <input id="login__password" type="password" name="password" class="form__input" style="height: 53px;padding-left: 5px;" placeholder="Password" required>
			      </div>
			
			      <div class="form__field">
			        <input type="submit" value="Sign In" >
			      </div>
			
			    </form>
				
				<div>
					<div><p style="margin: 12px 0px 0px 0px;"  class="text--center"><a href="findIdpw" onclick="find();" style="cursor: pointer;">아이디/비밀번호 찾기</a> <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/images/icons.svg#arrow-right"></use></svg></p></div>
			    	<div></div><p style="margin: 0px 0px 0px 0px;" class="text--center">Not a member? <a onclick="agree();" style="cursor: pointer;">Sign up now</a> <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/images/icons.svg#arrow-right"></use></svg></p>
				</div>
			  </div>
			
			  <svg xmlns="http://www.w3.org/2000/svg" class="icons"><symbol id="arrow-right" viewBox="0 0 1792 1792"><path d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z"/></symbol><symbol id="lock" viewBox="0 0 1792 1792"><path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z"/></symbol><symbol id="user" viewBox="0 0 1792 1792"><path d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z"/></symbol></svg>
			  
			  <hr style="margin-top: 30px; margin-bottom: 30px">
			  
			  <div>
				  <div><img style="margin: 0px 0px 0px 0px" src="resources/IMG/site/member/login/kakao.png" width="350" height="70" onclick="kakaoLogin()"></div>
				  <div><img style="margin: 0px 0px 0px 0px" src="resources/IMG/site/member/login/google.png" width="350" height="70" onclick="googleLogin()"></div>
				  <div><img style="margin: 0px 0px 0px 0px" src="resources/IMG/site/member/login/naver.png" width="350" height="70" onclick="naverLogin()"></div>
				  <div><img style="margin: 0px 0px 0px 0px" src="resources/IMG/site/member/login/facebook.png" width="350" height="70" onclick="facebookLogin()"></div>
			  </div>
		  </div>
		</div>
  </div>
<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>
</body>
</html>










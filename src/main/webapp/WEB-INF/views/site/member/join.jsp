<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String platform= request.getParameter("platform");
    String isMember=request.getParameter("isMember");
    if(platform==null){
    	platform="null";
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
<%if(!platform.equals("normal")){%>/* 1 */
	#div1{
		display: none;
	 }
<%}else{%>
	<%if(isMember.equals("true")){%>/* 2 */
	#div2{
		display: none;
	}
	<%}else{%>/* 3 */
	
	<%}%>
<%}%>

</style>

<script type="text/javascript">


<%if(!platform.equals("normal")){%>/* 1 */	
	id_check = true;
	pw_check = true;
<%}else{%>
	<%if(isMember.equals("true")){%>/* 2 */
	name_check = true;
	email_check = true;
	addressnumber_check = true;
	address_check = true;
	birth_check = true;
	<%}else{%>/* 3 */

		
	<%}%>
<%}%>


/* 변수가 다true인지 혹인하는 메서드 */
function total_check(){
	if(id_check == true && name_check == true && pw_check == true &&email_check == true && birth_check == true &&addressnumber_check == true && address_check == true){
		
	$(".signupbtn").prop("disabled", false);
	}else{
	$(".signupbtn").prop("disabled", true);
	}
}
	
//아이디
$(function(){
	$("#id").keyup(function(){
		
		 if(ajaxDo('idCheck?id='+$('#id').val(),'')=='true'){
			$('#id_check').text('사용 가능한 아이디 :)');
			$('#id_check').css('color', 'green'); 
			id_check = true;
			

		}else{				 
			$('#id_check').text('사용 불가능한 아이디 :)');
			$('#id_check').css('color', 'red');
			id_check = false;
			
		}
		 total_check();
		}); 
	
	});
	//패스워드
$(function(){
	$(".pw").keyup(function(){
		
		var pw1=$("#pw1").val(); 
		var pw2=$("#pw2").val();
		
		if(pw1 != "" || pw2 != ""){ 
			if(pw1 == pw2){

				$('#pw_check').text('비밀번호가 일치합니다 :)');
				$('#pw_check').css('color', 'green'); 
				pw_check = true;
				
			}else{ 

					$('#pw_check').text('비밀번호가 일치하지 않습니다 :)');
					$('#pw_check').css('color', 'red'); 
					pw_check = false;
					
					} 
			}
		total_check();
	}); 
	
});
//이름
$(function(){
	$("#name").keyup(function(){
		var name = $("#name").val(); 
		
		if(name == ""){
			name_check = false;
		}else{				 
			name_check = true;
		}
		total_check();
	});
});
//이메일
$(function(){
	$("#email").keyup(function(){
		var email = $("#email").val(); 
		
		if(email == ""){
			email_check = false;
		}else{				 
			email_check = true;
		}
		total_check();

	});
});

function abc(){
	
	 	var addnumber = $("#addnumber").val(); 
		var address = $("#address").val(); 
	
		
		if(addnumber == ""){
			addressnumber_check = false;
		}else{				 
			addressnumber_check = true;
		}


		if(address == ""){
			address_check = false;
		}else{				 
			address_check = true;
		}
		
		total_check(); 
}


//생년월일
$(function(){
$('#user_birth').keyup(function(){
	var dateStr = $(this).val();		
   var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
   var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
   var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
   var today = new Date(); // 날짜 변수 선언
   var yearNow = today.getFullYear(); // 올해 연도 가져옴
	
   if (dateStr.length <=8) {
	    if (1900 > year || year > yearNow){
	    	$('#birth_check').text('생년월일을 확인해주세요 :)');
			$('#birth_check').css('color', 'red');
			birth_check = false;
		
			
	    }else if (month < 1 || month > 12) {
	    	$('#birth_check').text('생년월일을 확인해주세요 :)');
			$('#birth_check').css('color', 'red'); 
			birth_check = false;
			
			
	    }else if (day < 1 || day > 31) {
	    	$('#birth_check').text('생년월일을 확인해주세요 :)');
			$('#birth_check').css('color', 'red'); 
			birth_check = false;
		
			
	    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
	    	$('#birth_check').text('생년월일을 확인해주세요 :)');
			$('#birth_check').css('color', 'red'); 
			birth_check = false;
		
			
	    }else if (month == 2) {
	    	 
	       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	       	
	     	if (day>29 || (day==29 && !isleap)) {
	     		$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
				birth_check = false;
			
				
			}else{
				$('#birth_check').text('');
				birth_check = true;
			
			}// (day>29 || (day==29 && !isleap))
	     	
	    }else{
	    	$('#birth_check').text(''); 
	    	birth_check = true;
	    	
		}
		
		}else{
			//1.입력된 생년월일이 8자 초과할때 :  auth:false
			$('#birth_check').text('생년월일을 확인해주세요 :)');
			$('#birth_check').css('color', 'red'); 
			birth_check = false;
			
		}
   total_check();
	});
});





	
	

</script>
<style type="text/css">
.pw, .form-control{
border: 1px solid #ccc;
font-size: 15px;
color: #555;
height: 35px;
box-sizing: border-box;
padding: 10px;
line-height: 1;
margin-bottom: 0;
}
.signupbtn{
background-color: #d44179;
height: 40px;
width:100px;
color: #eee;
font-weight: 700;
border-radius : 5px;
border: 0;
cursor: pointer;
margin: 20px auto -10px auto;
font-size: 16px;
}
.signupbtn:hover{
background-color: #d44179;
-webkit-transition: all 0.2s ease-in-out; 
-moz-transition: all 0.2s ease-in-out; 
-o-transition: all 0.2s ease-in-out; 
transition: all 0.2s ease-in-out;
}
.check_font{
width: 200px;
}
</style>
</head>

<body>
<div>
	<div id="div1">
		<input id="id" name="id" class="input_text" type="text" placeholder="ID" style="margin-top:15px; margin-bottom:10px; ">
		<div class="check_font" id="id_check"></div>
		<input class="pw" id="pw1" name="pw" type="password" placeholder="PW" style="margin-bottom:10px;"> 
		<br>
		<input class="pw" id="pw2" type="password" placeholder="PW 확인" style="">
		<div class="check_font" id="pw_check"></div>
	</div>
	<div id="div2">
		<input id="name" name="name" class="input_text" type="text" placeholder="이름" style="margin-top:15px; margin-bottom:10px;">
		<br>
		<input id="email" name="email" class="input_text" type="text" placeholder="이메일" style="margin-bottom:10px;">
		<br>
		<input type="text" id="addnumber" class="input_text" name="address" placeholder="우편번호" style="margin-bottom:10px;">
		<input type="button" class="button_check" onclick="addnumberSearch()" value="우편번호 찾기"><br>
		<input type="text" id="address" class="input_text" name="address" placeholder="주소" style="margin-bottom:10px;"><br>
		<input type="text" id="adddetail" class="input_text" name="address" placeholder="상세주소" style="margin-bottom:10px;">
		<input type="text" id="addextra" class="input_text" name="address" placeholder="참고항목" style="margin-bottom:10px;"><br>
		<!-- <input type="text" id="birth" name="birth" placeholder="생년월일(YYYYMMDD)"><br> -->
		<div class="form-group required">
				<input type="text" class="form-control" id="user_birth" name="user_birth" placeholder="생년월일 (YYYYMMDD)" style="margin-bottom:10px;">
				<div class="check_font" id="birth_check"></div>
		</div>
	
	</div>
	<div style="width: 100%; text-align: center;">
	<input type="submit" class="signupbtn" disabled="disabled" value="가입하기" >
	</div>
		
</div>

</body>
</html>
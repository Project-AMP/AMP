<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/JS/ajax/ajax.js"></script>
	<script type="text/javascript">

	var id_check = false;				// 아이디
	var pw_check = false;				// 비밀번호
	var name_check = false;			// 이름
	var email_check = false;			// 이메일
	var addressnumber_check = false;	// 우편번호
	var address_check = false;	// 상세주소
	var birth_check = false;			// 생일
		
	<%if(request.getParameter("platform")==null){
		response.sendRedirect("/amp/login");
		}
	%>
	
		function send(url){
		
				if($('#phone').val().trim() == "")
				{
					alert("번호를 입력해주세요");
					$('#phone').val('');
					$('#phone').focus();
				}else{
					
					var phone = $('#phone').val();
					var phoneCheck = /^01(0)(\d{4})\d{4}$/;
					
					if(phoneCheck.test(phone)){
						alert("ok");
						$('#code').focus();
						
						url=url+'?to='+$('#phone').val();
						ajaxDo(url,'');
						$("#phone").attr("readonly" ,"readonly");
					}else{
						alert("핸드폰 번호를 바르게 입력해주세요");
						$('#phone').attr("readonly",false);
						$('#phone').val('');
						$('#phone').focus();
					}					
				}
			
			}
		
		function checkCode(url){
			url=url+"?code="+$('#code').val();

			if(ajaxDo(url,'#checkCode')=='true'){/* 코드확인 */
			
				
					if(<%=request.getParameter("platform")!=null&&!request.getParameter("platform").equals("normal")%>){/* api */
							var mem=ajaxDo('isMember?phone='+$('#phone').val(),'');
							if( mem=='ajm'||mem=='true'){/* 있다면 */
									location.href='join.do?platform='+$('#platform').val()+'&apiEmail='+$('#apiEmail').val()+'&phone='+$('#phone').val();
								}else{/* 없다면 */
									ajaxDo('join?platform=api&isMember=false','#join_ajax');
									joinYellow()
								}
					
						}else{/* 일반 */
							if(ajaxDo('isMember?phone='+$('#phone').val(),'')=='true'){/* 있다면 */
								ajaxDo('join?platform='+$('#platform').val()+'&isMember=true','#join_ajax');
								joinYellow()
							}else if(ajaxDo('isMember?phone='+$('#phone').val(),'')=='false'){/* 없다면 */
								ajaxDo('join?platform='+$('#platform').val()+'&isMember=false','#join_ajax');
								joinYellow()
							}else if(ajaxDo('isMember?phone='+$('#phone').val(),'')=='ajm'){
								alert("이미 가입된 회원입니다.");
								$('#phone').attr("readonly",false);
								$('#phone').val('');
								$('#code').val('');
							}
						}
	
				
			}else{
				alert("코드 잘못 입력");

				}
		
							
		}


function joinYellow(){
		document.getElementById('phone_txt').style.backgroundColor='rgb(0,0,0,0)';
		document.getElementById('join_txt').style.backgroundColor='yellow';
		document.getElementById('phone_txt').style.color='white';
		document.getElementById('join_txt').style.color='black';
		
	}
	
	
	

		
	
		var themeObj = {
				   bgColor: "#162525", //바탕 배경색
				   searchBgColor: "#162525", //검색창 배경색
				   contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
				   pageBgColor: "#162525", //페이지 배경색
				   textColor: "#FFFFFF", //기본 글자색
				   queryTextColor: "#FFFFFF", //검색창 글자색
				   //postcodeTextColor: "", //우편번호 글자색
				   //emphTextColor: "", //강조 글자색
				   outlineColor: "#444444" //테두리
				};
		
		function addnumberSearch() {
	
	        new daum.Postcode({
	        	theme: themeObj,
	        	 onclose: function(state) {
		     			abc();
	     			
	        	    },
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('addnumber').value = data.zonecode;
	                document.getElementById("address").value = roadAddr;
	                $("#addnumber").attr("readonly" ,"readonly");	/* 2021-03-05 */
	                $("#address").attr("readonly" ,"readonly");		/* 2021-03-05 */
	                /* document.getElementById("sample4_jibunAddress").value = data.jibunAddress; */
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("addextra").value = extraRoadAddr;
	                    $("#addextra").attr("readonly" ,"readonly");
	                } else {
	                    document.getElementById("addextra").value = '';
	                }

	        
	            }

	        }).open({popupName: 'addnumberSearch' ,autoClose: true });	/* 2021-03-05 */
	    }
	
	</script>
<style type="text/css">
body{
background-color: #2c3338;
}
.test {
	margin-bottom: 20px; 
}
.test td{
border: solid 1px black;
padding:5px;
font-size: 18px;
}
.button_check{
height: 40px;
width:100px;
background-color: #ea4c88;
color: #eee;
font-weight: 700;
border-radius : 5px;
border: 0;
cursor: pointer;
font-size: 14px;
}
.button_check:hover{
background-color: #d44179;
-webkit-transition: all 0.2s ease-in-out; 
-moz-transition: all 0.2s ease-in-out; 
-o-transition: all 0.2s ease-in-out; 
transition: all 0.2s ease-in-out;
}
.input_text{
border: 1px solid #ccc;
font-size: 15px;
color: #555;
height: 35px;
box-sizing: border-box;
padding: 10px;
line-height: 1;
margin-bottom: 0;
}
	</style>
</head>
<body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar','#topBarDiv');</script>

<div style="display: grid; place-items: center;">
	<h2 style="text-align: center; color:#fff;margin:20px;">정보입력</h2>

	<div style="border: solid 3px #d3d3d3;padding:30px 40px; display: grid; place-items: center; color:#fff;">
		<table class="test">
			<td>1.약관동의</td>
			<td id='phone_txt' style="background-color: yellow; color:#000;">2.번호인증</td>
			<td id='join_txt' >3.정보입력</td>
		</table>
				<div class="phone_div">
			<form id='phone_form' action="join.do" method="get" > <!-- 2021-02-24 김용민 -->
				<input id='platform' name='platform' type="hidden" value='<%=request.getParameter("platform") %>' > 
				<input id='apiEmail' name='apiEmail' type="hidden" value='<%=request.getParameter("email") %>'>
				<input name="phone" type="text" id="phone" class="input_text" style="margin-bottom:10px;"placeholder="휴대폰번호">
				<input type="button" value="인증번호 전송" class="button_check" onclick="send('smsPage.do')"><br>
				<input type="text" id="code" class="input_text" placeholder="인증번호">
				<input type="button" value="확인" class="button_check" onclick="checkCode('smsIsCode.do')">
						<div id="join_ajax"></div>		
			</form>
		</div>
	</div>
	</div>


	

	
</body>
</html>
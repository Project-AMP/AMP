<%@page import="com.jj.vo.MessageVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<MessageVo> classList=  (ArrayList<MessageVo>)request.getAttribute("classList");%>
    <%ArrayList<MessageVo> academyList=  (ArrayList<MessageVo>)request.getAttribute("academyList");%>
	<%String room_click=(String)request.getAttribute("room_click"); %>
	<%String academyidx=(String)request.getParameter("academyidx"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지</title>
<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet"><!-- 큰화면 css -->
<style type="text/css">
	#message_container{
	display:flex; flex-direction: row;
	width: 98%;
	margin:5px auto;
	height: 800px;
	}
		#left_container{
		border:1px black solid;
		width:250px;
		height: 100%;
		float: left;
		 
		}
			#left_top{
			width: 100%;
			height: 90px;
			border-bottom:1px solid black; 
			}
			
				#write_div{
				width: 70px;
				border-right:1px solid black;
				height: 99%;
				float:left;
				text-align: center;
				
				}
				#write_div:hover{
				cursor: pointer;
				}
				#class_combo_div{
				text-align: center;
				float:left;
				width:140px;
				}
					#class_combo{
					width: 100px;
					}
			#left_div{
			width: 100%;
			height:705px;
		
			overflow-x:hidden;
			overflow-y:auto;

			
			}
				.room_div{
				border-bottom:1px solid black;
				width:234px;
			
				padding:6px 8px;
		

				}
			
					
		#right_container{
		margin-left:5px;
		width:100%;
		height:100%;
		float: left;
		flex: 1;
		border:1px solid black;
		}
			#right_top{
			border-bottom:1px solid black;
			width: 100%;
			height:90px;
			}
			#message_div{
			width: 100%;
			
			height:705px;
			}
				
				.message_div{
			
				max-width: 40%;

			
				}
				.message_line{
			
				width: 100%;
				padding:  10px;
				}
				.message_span{
				font-size: 30px;
				}
				
				#message_right{
				float:right;
				border: 1px solid blue;
				}
				
				
				/*  */		
  .chat-history {
	border-bottom:1px solid black;
    overflow-y: scroll;
    height: 620px;
    padding: 15px;
    background-color: #f7faff;
 
    
  }
    .message-data {
      margin-bottom: 15px;
    }
    .message-data-name{
    color: black;
    }
    .message-data-time {
      color:gray;

    }

    
    .message {      
      padding: 18px 20px;
      line-height: 26px;
      font-size: 16px;
      border-radius: 7px;
      margin-bottom: 30px;
      word-break:break-all;
      white-space:normal;
      max-width: 60%;


    }
    
    .my-message {
       
          background: #86BB71;
  
    }
    
    .other-message {
   
          background: #94C2ED;
    }


.align-left {
  text-align: left;
}

.align-right {
  text-align: right;
}

.float-right {
  float: right;
}
.float-left{
	float:left;
}
.clearfix:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;

}
li{ list-style-type : none }
#chat_input_div{
width: 100%;  height: 55px; text-align: center;
display: grid; place-items:center;
}

				
				/*  */
				
		#modalMessage{
		width: 100%; height: 100vh; background-color:black; background-color: rgba(0,0,0,0.5); position: absolute; top: 0 ; left:0;visibility:hidden;display: grid; place-items:center;
		
		}
		#write_member{
		width:99%; height: 350px;border: 1px solid black;margin:auto;
		}
		#write_button{
		
		width: 100%;text-align: center;
		}
	

#sendBtn{
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
        padding: .200rem .35rem;
        font-size: 17px;
        border-radius: .25rem;
        margin-left: 3px;
}

.close{
	
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
        padding: .200rem .25rem;
        font-size: 15px;
        border-radius: .25rem;

}

.make{

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
        padding: .200rem .25rem;
        font-size: 15px;
        border-radius: .25rem;

}

</style>

      <link rel="stylesheet" href="resources/CSS/academy/message/scrollbar.css">
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">
let sock = new SockJS("echo");/* 웹소켓 객체생성 (생성자에 만들어둔 Echohandler클래스의 매핑 url을 작성)*/

var room_click=null;

	<%if(room_click!=null){%>
		room_click=<%=room_click%>;
	<%}%>


</script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<%if(academyidx==null){ %>
<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar','#topBarDiv');</script>
<%}else{ %>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>
<%} %>

	<div id="message_container" >
	
		<div id="left_container">
			<div id="left_top">
						<div id="write_div" style="">
							<img alt="" src="resources/IMG/sample/pencil.png" height="60" width="60" >
							글작성
						</div>
						<div id="class_combo_div">
							과목 분류
							<select id="class_combo" name="class">
								<option>전체</option>
								<option>수학</option>
								<option>과학</option>
								<option>영어</option>
							</select>
						</div>			
				</div>
				
				<div id="room_container"  ><!-- ajax --></div>
		
		</div>
			

		<div id="right_container">
			 <div id="right_top"><h1 ><span id="room_title"></span><br><span id="room_member">방제목</span></h1></div>
			 	<div id="message_div" >
			 	<div id="message_kit_container"><!-- ajax --></div>
				 <div id="chat_input_div">
				 	<div style="width: 70%;">
				 	<input id="message" type="text"  onkeydown="enterKey()" style="width:70%;height: 23px;"><input id="sendBtn" type="button" value="전송">
						<form id="fileForm" method="post" enctype="multipart/form-data"> 
							<span onclick=" document.getElementById('file').click();">파일추가</span>
				 			<input id="file" type="file" name="file"  style="display: none;"> 
				 		</form>
					</div> 
		     	 </div>
			</div>		
		</div>
	
	
	</div>
	<script>
	
	 $(function() {
		  $("#file").change(function(e){
			  var formData = new FormData($('#fileForm')[0]);
				if($("#file").val()!=""){
				  $.ajax({
					  type: "POST",
					  enctype: 'multipart/form-data',// 필수
					   url: 'fileUpload.do?room='+room_click,
					    data: formData, // 필수 
					   processData: false, // 필수 
					   contentType: false, // 필수
					    cache: false,
					    success: function (e) { 
					    	var json={ "message" : '' , "id" : <%=session.getAttribute("idx")%> , "roomId" : room_click}; 
						    sock.send(JSON.stringify(json));
						    reflashRoom();
						    }, error: function (e) { }
				  });
				  
				
				}
				
			  
			});
			
		});

	</script>
	
	
	
	
	<div id="modalMessage"  style=""> 
		
		<div style="width: 400px; height: 500px;  background-color: white;">
		 	맴버선택<br><br>
		<form action="makeRoom">
	
		 <%if(academyList.size()!=0){ %>	
		 	학원
		 		<select  name="academy" onchange='academyChange(this.value);'>
		 				<option>학원선택</option>
		 			<%for(int i=0;i<academyList.size();i++){ %>
						<option value='<%=academyList.get(i).getAcademy_idx()%>'><%=academyList.get(i).getAcademy_name()%></option>
				    <%} %>	
				</select>
		 	수강중인 과목
		 		<select  name="classIdx" onchange="getMembers(this.value)">
		 			<option>과목선택</option>
					<%for(int i=0;i<classList.size();i++){ %>
						<option class='class<%=classList.get(i).getAcademy_idx() %> classes' 
						value='<%=classList.get(i).getClass_idx()%>' style="display: none;"><%=classList.get(i).getClass_name()%></option>
				    <%} %>	
				</select>
					
		 <%}else{ %>
		 가입된 학원이 없습니다.		
		 <%} %>		
				
					
					<div id='write_member' style=""></div>
					
		 		<div id="write_button" style="padding-top:10px; ">
		 		<input name='roomName' id='roomName' type="text" style="height: 20px;font-size: 18px;" placeholder="방제목"><br>
		 		<input class="make" type="submit" value="방생성" style="margin-top: 5px;">	 
			 		<input class="close" type="button" value="취소" style="margin-top: 5px;"> 
			 			
		 		</div>
		 		
		 </form>
		 			<script type="text/javascript">
						function getMembers(v){
								if(v!=''){
									ajaxDo('message_members?classIdx='+v,'#write_member');
									}
							}
		 			</script>
		 
		</div>
	</div>

	<script src="resources/JS/ajax/ajax.js"></script>

<script type="text/javascript">

reflashRoom();

function reflashRoom(){
	ajaxDo("message_room?roomId="+room_click,"#room_container");

	
}

function reflashMessage(idx){
	
	ajaxDo("message_kit?roomId="+idx,"#message_kit_container");
	
	
}
function academyChange(t){
	var val=t;
	
	$('.classes').hide();
	$('.class'+t).show();
	
	
}



		 	$('#write_div').click(function(){
			 	
					$('#modalMessage').css("visibility","visible");
			 	});
		$('.close').click(function(){
					$('#modalMessage').css("visibility","hidden");
			 	});

	 	
</script>

</body>
</html>
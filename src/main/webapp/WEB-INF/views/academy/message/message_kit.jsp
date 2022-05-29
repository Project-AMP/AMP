<%@page import="com.jj.vo.MessageVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%
            String id=session.getAttribute("idx")+"";
    String roomId=request.getParameter("roomId");
    MessageVo messageVo=(MessageVo)request.getAttribute("messageVo");
    ArrayList<MessageVo> list=(ArrayList<MessageVo>)request.getAttribute("list");
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">



room_click=<%=roomId%>;


<%if(messageVo!=null){%>//방 타이틀
	$("#room_title").text('방제목: <%=messageVo.getRoom_title()%>');
	$("#room_member").text('인원: <%=messageVo.getRoom_member()%>');
<%}%>
</script>


</head>
<body>
           
		
				
		    <div id="chat-history" class="chat-history style-7">
		    
					     <ul style="margin-left: 0px;">			 
					        <%for(int i=0;i<list.size();i++){ %>
					        	<%if(list.get(i).getMember()==Integer.parseInt(id)){ %>
					        	
					        	<li class='clearfix'>
						        	<div class='message-data align-right'><span class='message-data-time' ><%=list.get(i).getDate() %></span> &nbsp; </div>				            
			         				 <div class='message my-message float-right' >
			         				 	<%if(list.get(i).getType().equals("img")){ %>
			         				 	<a href='resources/IMG/site/message/<%=list.get(i).getFile()%>' download>
			         				 		<img width="300px" height="200px"  src='resources/IMG/site/message/<%=list.get(i).getFile()%>'>
			         				 		</a><br>
			         				 	<%}else if(list.get(i).getType().equals("video")){%>
			         				 		<video controls loop muted preload="auto"  width="300px" height="200px">
												  <source src='resources/IMG/site/message/<%=list.get(i).getFile()%>' >
											</video><br>
			         				 	<%}else if(list.get(i).getFile()!=null){%>
		         				 		<a href='resources/IMG/site/message/<%=list.get(i).getFile()%>' download>
											  파일 다운로드
										</a><br>
		         				 	<%} %>
			         				 	<%= list.get(i).getCon()%>		         				 
			         				 </div>
			         				 <div style="float:right;"><%=list.get(i).getView_count() %></div> 
		         				 </li>
					        	<%}else if(list.get(i).getMember()!=0){ %>
					        	<li class='clearfix'><div class='message-data'> 
							          <span class='message-data-name'><%=list.get(i).getName() %></span> <span class='message-data-time'><%=list.get(i).getDate() %></span> </div>
							          <div class='message  other-message float-left'> 
							          	<%if(list.get(i).getType().equals("img")){ %>
			         				 		 	<a href='resources/IMG/site/message/<%=list.get(i).getFile()%>' download>
			         				 		<img width="300px" height="200px"  src='resources/IMG/site/message/<%=list.get(i).getFile()%>'>
			         				 		</a><br>
			         				 	<%}else if(list.get(i).getType().equals("video")){%>
			         				 		<video controls loop muted preload="auto"  width="300px" height="200px">
												  <source src='resources/IMG/site/message/<%=list.get(i).getFile()%>' >
											</video><br>
			         				 	<%}else if(list.get(i).getFile()!=null){%>
		         				 		<a href='resources/IMG/site/message/<%=list.get(i).getFile()%>' download>
											  파일 다운로드
										</a><br>
		         				 	<%} %>
							          <%= list.get(i).getCon()%>
							          </div>
							          <div style="float: left"><%=list.get(i).getView_count() %></div> 
						        </li>
					        	<%}else{%>
					        		
						        <%} %>
					        <%} %>
	        			</ul>
	     			 </div> <!-- chat-history -->

</body>

<script type="text/javascript">

if(room_click==00){
	$('#right_container').hide();
}else{
	$('#right_container').show();
	focusMe();
	scrollDrop();
	
}
	

$('.room_white').css('backgroundColor', 'white');
$('#room<%=roomId%>').css('backgroundColor', '#99cc00');



function scrollDrop(){
document.getElementById('chat-history').scrollTop = document.getElementById('chat-history').scrollHeight;
}
function focusMe(){
document.getElementById('message').focus();
}

function enterKey() {
 if (window.event.keyCode == 13) {
	sendMessage();
   $('#message').val('');

 }
}

sock.onmessage = onMessage;/*상대 또는 본인  메시지 전송 감지시 자동 실행 메서드*/
sock.onclose = onClose;/* 메시지 연결 끊고 싶을때 실행하는 메서드 */

$("#sendBtn").click(function(){ /* 전송 버튼 눌렸을 시 */
   	 sendMessage();/* sendMessage메서드 호출 */
	 $('#message').val('')/* 메시지 입력상자 지우기 */
 });

function sendMessage() {/* 소켓을 통한 Echohandler에게 메시지 전송 */
	
	/* sock.send()를 통해 EchoHandler에게 값을 전달할 때
	 파라미터로 String 타입 하나를 받는다.
	하지만 우린 입력한 사람의 id와 방번호를 같이 보내서 디비에 저장할거다.
	그래서 필자는 json형태의 string으로 정보를 담아 보내기로 하였다 */
	var json={ "message" : $('#message').val() , "id" : <%=id%>, "roomId" : '<%=roomId%>'}; /* 우선 필요한 정보를 담은 json을 만들었고*/
    sock.send(JSON.stringify(json));/* 그 json을 String으로 변환 하여 보냈다. EchoHandler에서 받을때 json형태로 받아 값을 추출해서 디비에 저장할 것이다. */ 
    focusMe();
   
 }
 
function onMessage(msg){

		var json=JSON.parse(msg.data);//msg로 오는 데이터가 json형태의 문자열이 온다. 그문자열을  json 타입으로 바꾸어 roomId,id,message를 추출한다.
 
		  if(json.roomId == '<%=roomId%>'){ //이방이 맞다면	
			  reflashRoom();
		    	 scrollDrop();
		  }
		    	 onMessageRoom(json.roomId);
			      

				 

	     
}
function onClose(evt) {
	   alert("연결 끊김");
}
//편의기능 메서드 구현부


   
readMessage();
function readMessage(){

	
		if(ajaxDo('readMessage?roomId=<%=roomId%>','')=='true'){/* 읽을게 있다 */
				message_new();
				
				var json={ "message" : '' , "id" : <%=id%> , "roomId" : '<%=roomId%>'}; /* 우선 필요한 정보를 담은 json을 만들었고*/
			    sock.send(JSON.stringify(json));
			   
	
		}

	
}



</script>


</html>
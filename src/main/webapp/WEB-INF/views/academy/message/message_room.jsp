<%@page import="com.jj.vo.MessageVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%ArrayList<MessageVo> list =(ArrayList<MessageVo>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
</head>
<body>
			
			<div id="left_div" class='style-7'>
				<%if(list.size()!=0) {%>
					<script type="text/javascript">
						if(room_click==null){
							reflashMessage(00);	
							   
						}else{
							reflashMessage(room_click);	
							}
						
															
						$('#room'+room_click).css('backgroundColor', '#99cc00');
					</script>
				<%}%>
				<%int count=0; %>
				<div style="width: 250px;position: relative;">
				<%for(int i=0;i<list.size();i++){ %>
					<div class='room_div <%=(count=list.get(i).getView_count())==0?"room_white":"" %>' id='room<%=list.get(i).getRoom_idx()%>' onclick='reflashMessage(<%=list.get(i).getRoom_idx()%>);' style=' <%=(count=list.get(i).getView_count())==0?"background-color:white;":"background-color:#ffc0cb;" %>'>
					
						 <div style=" position:relative;width:100%;overflow:hidden;text-overflow:ellipsis; white-space:nowrap;">							 
							 방제목 : <%=list.get(i).getRoom_title()%> 
							 
						 </div>
					
						 <div style="width:100%;overflow:hidden;text-overflow:ellipsis; white-space:nowrap;"><%=list.get(i).getName()%> : <%=list.get(i).getCon()%></div>
						 
						 <div style="position: relative;">
						 (<%=list.get(i).getDate()%>)<%=(count=list.get(i).getView_count())==0?"":"<span  class='nav-counter' style='margin-right:10px;'> "+count+" </span>" %>
						 </div>
					
					 </div>
				<%}%>
				</div>
				
				
			</div>
		<script type="text/javascript">

	 
		function onMessageRoom(roomId){
			if(ajaxDo('isMyRoom?roomId='+roomId)=='true'){
								reflashRoom();
					
			}

	
		}
	
				
	</script>
</body>
</html>


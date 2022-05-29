<%@page import="com.jj.vo.CheckVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% ArrayList<String[]> dowList  = (ArrayList<String[]>)request.getAttribute("dowList");%>
    <% ArrayList<CheckVo> checkList  = (ArrayList<CheckVo>)request.getAttribute("checkList");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%//출석률 계산
double comCheck=0;
double totalCheck=dowList.size();
double checkCount=0;
for(int i=0; i<checkList.size();i++){
	if(checkList.get(i).getState()==1||checkList.get(i).getState()==2){
		checkCount++;
	}
}
	comCheck=(double)(checkCount/totalCheck)*100;
%>
<body>
<%if(dowList.size()==0||checkList.size()==0){ %>
	출석 내용이 없습니다.
<%}else{ %>
<input id='comCheck' type="hidden" value='<%=Math.floor(comCheck*10000)/10000.0%>%'>
	<table style="margin:auto; border-bottom:0;margin-bottom: 20px;">
				<tr style="font-size:17px; color:white;background-color: #333; height: 32px; width: 2000px">
						<th style="width:200px;margin: 5px; border: white 1px solid; padding: 5px 8px; "></th>
					<%for(int i=0; i<dowList.size();i++){ %>
						<th style="width:100px;margin: 5px; border: white 1px solid; padding: 5px 8px;" width="200"><%=dowList.get(i)[0]%> (<%=dowList.get(i)[1] %>)</th>
					<%} %>
				</tr>
				<tr>
					<td style="width:100px;margin: 5px; border: black 1px solid; padding: 5px 8px;" height="40">
						<%=checkList.get(0).getName() %>
					</td>
					<%for(int i=0; i<dowList.size();i++){ %>
						<td id='td<%=dowList.get(i)[0]%>' style="width:100px;margin: 5px; border: black 1px solid; padding: 4px 3px; font-size: 20px;" height="40">
							<%for(int j=0;j<checkList.size();j++) {%>
								<%if(dowList.get(i)[0].equals(checkList.get(j).getDate())){ %>
									<%=checkList.get(j).getState()==1?"출석":(checkList.get(j).getState()==2?"지각":"결석")  %>
									<script>
										var state= <%=checkList.get(j).getState()%>;
										if(state==1)
										$('#td<%=dowList.get(i)[0]%>').css('backgroundColor','#99e2ff');
										else if(state==2)
										$('#td<%=dowList.get(i)[0]%>').css('backgroundColor','#f5fab6');
										else if(state==3)
										$('#td<%=dowList.get(i)[0]%>').css('backgroundColor','#ff7d7d');
									</script>
								<%} %>
							<%} %>
						</td>
					<%} %>
				</tr>
				
	</table>
<%} %>




</body>
</html>
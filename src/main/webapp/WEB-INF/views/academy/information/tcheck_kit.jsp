<%@page import="com.jj.vo.ClassMemberVo"%>
<%@page import="com.jj.vo.CheckVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% ArrayList<String[]> dowList  = (ArrayList<String[]>)request.getAttribute("dowList");%>
    <% ArrayList<ClassMemberVo> memberList  = (ArrayList<ClassMemberVo>)request.getAttribute("memberList");%>
    <% ArrayList<CheckVo> checkList  = (ArrayList<CheckVo>)request.getAttribute("checkList");%>
    <%int has =0; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" name='classIdx' value='<%=request.getParameter("classIdx")%>'>
	<span style="float: left; margin-left:10px;"><input type="checkbox">전체 출석</span>
	<table style="margin:auto; border-bottom:0;margin-bottom: 20px;">
				<tr style="font-size:17px; color:white;background-color: #333; height: 32px; width: 2000px">
						<th style="width:200px;margin: 5px; border: white 1px solid; padding: 5px 8px; "></th>
					<%for(int i=0; i<dowList.size();i++){ %>
						<th style="width:100px;margin: 5px; border: white 1px solid; padding: 5px 8px;" width="200"><%=dowList.get(i)[0]%> (<%=dowList.get(i)[1] %>)</th>
					<%} %>
				</tr>
				
				<%for(int k=0;k<memberList.size();k++){ %>
					<%if(memberList.get(k).getMember()!=(int)session.getAttribute("idx")) {%>
						<tr>
							<td style="width:100px;margin: 5px; border: black 1px solid; padding: 5px 8px;" height="40">
								<%=memberList.get(k).getName() %>
							</td>
							<%for(int i=0; i<dowList.size();i++){ %>
								
								<td id='td<%=dowList.get(i)[0]%><%=memberList.get(k).getMember()%>' style="width:100px;margin: 5px; border: black 1px solid; padding: 5px 3px;" height="40">
									<%has=0;%>
										<%for(int j=0;j<checkList.size();j++){ %>			
											<%if(dowList.get(i)[0].equals(checkList.get(j).getDate())&&memberList.get(k).getMember()==checkList.get(j).getMember()){ %>
													<select name="chk" style="font-size: 20px" onchange="tdChange('<%=dowList.get(i)[0]%><%=memberList.get(k).getMember()%>',this)">
														<option <%=checkList.get(j).getState()==1?"selected":"" %> value='1_<%=memberList.get(k).getMember()%>_<%=dowList.get(i)[0]%>'>출석</option>
														<option <%=checkList.get(j).getState()==2?"selected":"" %> value='2_<%=memberList.get(k).getMember()%>_<%=dowList.get(i)[0]%>'>지각</option>
														<option <%=checkList.get(j).getState()==3?"selected":"" %> value='3_<%=memberList.get(k).getMember()%>_<%=dowList.get(i)[0]%>'>결석</option>
													</select>
													<script>
														var state= <%=checkList.get(j).getState()%>;
														if(state==1)
														$('#td<%=dowList.get(i)[0]%><%=memberList.get(k).getMember()%>').css('backgroundColor','#99e2ff');
														else if(state==2)
														$('#td<%=dowList.get(i)[0]%><%=memberList.get(k).getMember()%>').css('backgroundColor','#f5fab6');
														else if(state==3)
														$('#td<%=dowList.get(i)[0]%><%=memberList.get(k).getMember()%>').css('backgroundColor','#ff7d7d');
													</script>
											<%has=1;}%>
										<%}%>
									
									<%if(has==0){ %>
													<select name="chk" style="font-size: 20px" onchange="tdChange('<%=dowList.get(i)[0]%><%=memberList.get(k).getMember()%>',this)">
														<option value="0"></option>
														<option value='1_<%=memberList.get(k).getMember()%>_<%=dowList.get(i)[0]%>'>출석</option>
														<option value='2_<%=memberList.get(k).getMember()%>_<%=dowList.get(i)[0]%>'>지각</option>
														<option value='3_<%=memberList.get(k).getMember()%>_<%=dowList.get(i)[0]%>'>결석</option>
													</select>
												
									<%} %>	
								</td>
							<%} %>
						</tr>
					
					<%} %>
				<%} %>
	</table>

<script>

    function to_ajax(){
        var queryString = $("form[name=saveForm]").serialize() ;
        $.ajax({
            type : 'post',
            url : 'saveCheck?classIdx=<%=request.getParameter("classIdx")%>',
            data : queryString,
            success : function(){

            }
        });
        alert('저장 완료');
    }

   function tdChange(d,t){
			var val=t.value.split('_')[0];
			if(val==0){
				$('#td'+d).css('backgroundColor','white');
			}else if(val==1){
				$('#td'+d).css('backgroundColor','#99e2ff');
  			}else if(val==2){
				$('#td'+d).css('backgroundColor','#f5fab6');
  			}else{
				$('#td'+d).css('backgroundColor','#ff7d7d');
  			}

        }
 
</script>


</body>
</html>
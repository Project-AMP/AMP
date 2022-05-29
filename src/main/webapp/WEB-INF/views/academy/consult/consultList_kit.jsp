<%@page import="com.jj.vo.ConsultVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%ArrayList<ConsultVo> list=(ArrayList<ConsultVo>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#consultListcheck_div{
border:1px solid black;
width: 800px;
text-align: center;
}
#comentbox{
border:1px solid black;
}
.coment{
display: inline-block;
width: 100%;
font-size: 20px;
}
#comenttxt{
margin:auto 0;
padding: 10px 12px;
width:700px;
height:150px;
resize:none;
}
#stu_info_div{
border:1px solid black;
}
#stu_info{
border:1px solid black;
margin: 10px;
}
.checkListlist{

}
.btn_group{
display: inline-block;
}
#btn_close, #btn_consultcheck{
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
	    padding: .300rem .45rem;
	    font-size: 22px;
	    border-radius: .25rem;
	    margin: 15px 0;
}
.consultTr:hover{
	background-color: gray;
}
.consultTr{
height: 30px;
}
</style>
</head>

<body>
<%if(list.size()==0){ %>	<!-- /* 리스트에 아무것도 안 들어있거나 현재진행 중인 강의가 없을때 */ -->
			 문의가  없습니다.
		<%}else{ %>
			<table id='table' style="width: 100%;border-collapse: collapse; margin:auto; text-align: center;font-size: 16px;">
				<tr style="background-color: #333; font-size: 17px; color:white; height: 30px;">
				
					<td>NO</td>
					<td>성명</td>
					<td>상담 내용</td>						
					<td>강의명</td>
					<td>상담신청일</td>
					<td>전화번호</td>				
					<td>상담상태</td>				
					

				</tr>
		
				<%for(int i=0;i<list.size();i++){ %>
					
					<tr id='consultTr<%=list.get(i).getIdx()%>' class='consultTr' style="cursor: pointer; border:1px solid black;" onclick='showDetail(<%=list.get(i).getIdx()%>)'>
						<td><%=i+1%></td>
						<td id='stName<%=list.get(i).getIdx()%>'><%=list.get(i).getStuname()%></td>
						<td id='comenttxt<%=list.get(i).getIdx()%>' style="text-overflow: ellipsis;overflow:hidden; white-space:nowrap; max-width: 200px; width: 200px;"><%=list.get(i).getComent() %></td>	
						<td id='className<%=list.get(i).getIdx()%>'><%=list.get(i).getClass_name()%></td>
						<td id='consultDate<%=list.get(i).getIdx()%>'><%=list.get(i).getDate()%></td>
						<td id='phonNum<%=list.get(i).getIdx()%>'><%=(list.get(i).getPhone()+"").replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3")%></td>
						<td id='consultState<%=list.get(i).getIdx()%>'><%=(list.get(i).getState()==0?"미완료":"상담완료") %></td>
	
						
					<tr>

				<%} %>
				
				</table>
		<%} %>
		
		<div id='consultModal' style=" width: 100%; height: 100%; position:absolute;background-color:rgb(0,0,0,0.5); top:0;left:0; display: none;" onclick="closeDetail()" >
			<div id="consultListcheck_div" style="background-color: white;position:absolute; transform:translate(-50%,-50%); top: 50%;left:50%;opacity: 1;font-size: 15px; " >		
			<div id="comentbox">
				<div class="coment"><h2>상담 내용</h2>
				<input id='classIdx' type="hidden" name='classIdx' value=''>
				<textarea id="comenttxt" name="coment"></textarea>
				</div></div>
			
			<div id="stu_info_div">
				<h2>상담 정보</h2>
				<div id="stu_info">
					<div style="width: 300px;margin: auto; text-align: left; font-size: 18px;">
					<br>
					성명 : <span id='stName'></span><br>
					강의명 : <span id='className'></span><br>
					상담신청일 : <span id='consultDate'></span><br>
					전화번호 : <span id='phonNum'></span><br>
					상담상태 : <span id='consultState'></span><br>
					<br>
					</div>
					
				</div>
			</div>
			
			<div class="checkListlist">
			<div class="btn_group">
				<input type="submit" id="btn_consultcheck" value="상담 완료" onclick="updateState()">
				<input type="submit" id="btn_close" value="닫기"  onclick="closeDetail()" >
			</div></div>
			
		</div>
</div>
<script type="text/javascript">
	var clickedConsult;
	function showDetail(idx){
		clickedConsult=idx;
		$('#comenttxt').text($('#comenttxt'+idx).text());
		$('#stName').text($('#stName'+idx).text());
		$('#className').text($('#className'+idx).text());
		$('#consultDate').text($('#consultDate'+idx).text());
		$('#phonNum').text($('#phonNum'+idx).text());
		$('#consultState').text($('#consultState'+idx).text());
		if($('#consultState'+idx).text()=='상담완료'){
			$('#btn_consultcheck').hide();
			}
		$('#consultModal').show();
		}
	function closeDetail(){
			$('#consultModal').hide();
		}

	function updateState(){
			ajaxDo('updateState?idx='+clickedConsult,'');
			$('#consultModal').hide();
			getConsultList();
		}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String academy_idx = request.getParameter("academyidx"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사/수강생 관리</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">

<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


<style type="text/css">
#rim_container{
/* border: 1px solid red; */
}
#rim_div{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
width: 800px;
padding : 30px;
text-align: center;
}
.search {
display: inline-block;
position: relative;
text-align: center;
width: 400px;
}
	
#search{
width: 100%;
border: 1px solid #bbb;
margin: 10px 0;
padding: 10px 12px;
}
.fa-search {
position: absolute;
left: 390px;
top: 20px;
margin: 0;
}
#searchbar{
text-align: center;
padding:5px;

}
#serach_categori{
display: inline-block;
}
#search_classoption{
display: inline-block;
}
#search_option{
margin: 10px 0px 0px 0px; 

}
#academy_member_container{
margin: 10px 0px 0px 0px; 

}
#academy_member_div{

}
#academy_teacher_div{

}
#blacklist_container{
margin: 10px 0px 0px 0px; 
border: 1px solid black;
}
#blacklist_div{
border: 1px solid black;
}
.btn_group{
display: inline-block;
}
#btn_teacher_quit, #btn_member_quit, #btn_block, #btn_blockcancel,
	#btn_teacher_insert, .teacher  {
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
}
</style>

<script type="text/javascript">
	function search_teacher_member() {
		
		var teacher_member= $('#select_teacher_member').val();
		var id_name = $('#select_id_name').val();
		var content = $('#search').val();
		
		if(teacher_member == "0"){
			ajaxDo('academy_teacher_list?academy_idx=<%=request.getParameter("academyidx")%>&teacher_member=' + teacher_member + '&id_name=' + id_name + '&content=' + content ,'#academy_teacher_div');
		}else if(teacher_member == "1"){
			ajaxDo('academy_member_list?academy_idx=<%=request.getParameter("academyidx")%>&teacher_member=' + teacher_member + '&id_name=' + id_name + '&content=' + content ,'#academy_member_div');
		}
		
		
	}
</script>

</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>
<div class="Biggroup">
<div class="Smallgroup">
	
<div id="adminDiv"></div><script type="text/javascript">ajaxDo('admin?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=rim','#adminDiv');</script>
	<div id="rim_container">
		<div id="rim_div">
		<span style="font-size:35px;">강사/수강생 관리</span><br><br>
			<div id="searchbar">
				<div id="serach_categori">
			     <select id="select_teacher_member" style="font-size: 19px; height: 40px;margin-top: 5px;">
						<option value="0">강사</option>
						<option value="1">수강생</option>
					</select>
								
					<select id="select_id_name" style="font-size: 19px; height: 40px;margin-top: 5px;">
						<option value="2">아이디</option>
						<option value="3">이름</option>
					</select>
			    </div>

						<script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>
						<div class="search">
							<i class="fas fa-search"></i> <input id="search" type="text" onkeyup="search_teacher_member()">
						</div>
		    </div>
			
			 <!-- <div id="teacher_insert_modal" style="display:none; padding: 150px, 300px;">
				  	<div style="width: 430px; height: 300px;">강사 아이디 검색하여 추가하는 기능asdasddasdasdaadasdads</div>
				  </div> -->
			
			<div id="search_option">
				<div style="margin-bottom:10px; margin-top:10px;"><h2>강사목록</h2></div>
				<div id="academy_teacher_div"></div><script type="text/javascript">ajaxDo('academy_teacher_list?academy_idx=<%=request.getParameter("academyidx")%>','#academy_teacher_div')</script>
				
			</div>
					<!-- <p style="display: inline;"><a href="#teacher_insert_modal" rel="modal:open"><button id="btbt" class="teacher">강사 추가</button></a></p> -->
					
					<div class="btn_group" style="margin-top:10px;margin-bottom: 30px;  ">
					<input type="button" id="btn_teacher_quit" value="강사 탈퇴" onclick="teacher_list_click()">
				</div>
					
				

		     <div id="academy_member_container">
			 	<div style="margin-bottom:10px; margin-top:10px;"><h2>회원 목록</h2></div>
					<div id="academy_member_div"></div><script type="text/javascript">ajaxDo('academy_member_list?academy_idx=<%=request.getParameter("academyidx")%>','#academy_member_div')</script>
					  </div>  
					<div class="btn_group" style="margin-top:10px; margin-bottom: 20px;">
						<input type="button" id="btn_member_quit" value="회원 탈퇴" onclick="member_list_click()">
					</div>
			 
		    
		    
		</div>
	</div>
</div>
</div>
<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>


<script type="text/javascript">
			// 강사
			function teacher_list_click()
			{
				
				var array = new Array();
				var checkbox_length = document.getElementsByName("checkbox_list").length; 
				
				for(var i=0; i<checkbox_length; i++) // ex) 20
				{
					if(document.getElementsByName("checkbox_list")[i].checked == true)
					{
						array.push(document.getElementsByName("checkbox_list_hidden")[i].value);
						
					}	
				}
				
				if( ajaxArray('academy_teacher_del?academy_idx=<%=academy_idx%>','#academy_teacher_div',array) == "true" )
				{
					//alert("정상 처리");
				}else{
					alert("삭제 실패");
				}
				ajaxDo('academy_teacher_list?academy_idx=<%=request.getParameter("academyidx")%>','#academy_teacher_div');
			}
			
			
			// 회원
			function member_list_click() {
				var array2 = new Array();
				var checkbox_length2 = document.getElementsByName("checkbox_list2").length; 
				
				for(var i=0; i<checkbox_length2; i++) // ex) 20
				{
					if(document.getElementsByName("checkbox_list2")[i].checked == true)
					{
						array2.push(document.getElementsByName("checkbox_list_hidden2")[i].value);
					}	
				}
				
				if( ajaxArray2('academy_member_del?academy_idx=<%=academy_idx%>','#academy_member_div',array2) == "true" )
				{
					//alert("정상 처리");
				}else{
					alert("삭제 실패");
				}
				ajaxDo('academy_member_list?academy_idx=<%=request.getParameter("academyidx")%>','#academy_member_div');
			}
			
			
			function check_bold() {
				var checkbox_length = document.getElementsByName("checkbox_list").length; // 10
				
				for(var i=0; i<checkbox_length; i++)
				{
					if(document.getElementsByName("checkbox_list")[i].checked == true)
					{
						// bold 처리
						$('#teacher_list_Tr'+i).css('background-color','#ffeb99');
						$('#teacher_list_Tr'+i).css('font-weight','bold');
					}
					else if(document.getElementsByName("checkbox_list")[i].checked != true){
						$('#teacher_list_Tr'+i).css('background-color','white');
						$('#teacher_list_Tr'+i).css('font-weight','normal');
					}
				}
			}
			
			function check_bold2() {
				var checkbox_length = document.getElementsByName("checkbox_list2").length; // 10
				
				for(var i=0; i<checkbox_length; i++)
				{
					if(document.getElementsByName("checkbox_list2")[i].checked == true)
					{
						// bold 처리
						$('#member_list_Tr'+i).css('background-color','#ffeb99');
						$('#member_list_Tr'+i).css('font-weight','bold');
					}
					else if(document.getElementsByName("checkbox_list2")[i].checked != true){
						$('#member_list_Tr'+i).css('background-color','white');
						$('#member_list_Tr'+i).css('font-weight','normal');
					}
				}
			}
			
			
		</script>


</body>
</html>
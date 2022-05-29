<%@page import="com.jj.vo.ClassVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
<% ArrayList<ClassVo> room_list = (ArrayList<ClassVo>)request.getAttribute("room_list"); %> 
<% ArrayList<ClassVo> teacher_list = (ArrayList<ClassVo>)request.getAttribute("teacher_list"); %>   
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 정보 관리</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<style type="text/css">
#classList_container{
/* border: 1px solid red; */
}
#classList_div{
/* border:1px solid black; */
width: 800px;
padding : 30px;
text-align: center;
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
}
#classListbox_container{
border: 1px solid black;
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
border: 1px solid black;
}
#serach_categori{
display: inline-block;
}
.btn_group{
display: inline-block;
margin-top:10px;
/* border:1px solid black; */
}
#btn_createclass, #btn_updateclass, #btn_deleteclass, #btn_eraser {
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
#classcreate_container{
/* border : 1px solid black; */
margin: 10px 0;
}
.classcreatediv{
display: inline-block;
width: 320px;
/*  border: 1px solid black; */
text-align: right;
}
.classcreateinput{
margin: 10px 0;
padding: 10px 12px;
}

.classTr:hover {
	background-color: gray;
	cursor: pointer;
}
.classcreate_text{
font-weight:bold;
font-size:16px;
display:inline-block;
/* float:left; */
text-align:center;
margin-top:20px;

}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function lineClicked(idx, name, time, s_date, e_date, price, limited, room, teacher, kategori) {
		
		$('#class_idx').val(idx);
		$('#class_name').val(name);
		$('#class_time_date').val(time);
		$('#class_date_s').val(s_date);
		$('#class_date_e').val(e_date);
		$('#class_price').val(price);
		$('#class_limit').val(limited);
		$('#class_categori').val(kategori);
		
		// bold 처리
		$('.classTr').css('background-color','white');
		$('.classTr').css('font-weight','normal');
		$('#classTr'+idx).css('background-color','#ffeb99');
		$('#classTr'+idx).css('font-weight','bold');
		
		//alert(teacher);
		$("#select_room").val(room).prop("selected", true); 
		$("#select_teacher").val(teacher).prop("selected",true);

		
	}
	
	function input_eraser() {
		$('#class_name').val('');
		$('#class_time_date').val('');
		$('#class_date_s').val('');
		$('#class_date_e').val('');
		$('#class_price').val('');
		$('#class_limit').val('');
		$('#class_categori').val('');
		
		$("#select_room").val('choice1').prop("selected", true); 
		$("#select_teacher").val('choice2').prop("selected",true);
	}
	
	
	function class_insert() {
		var name = $('#class_name').val();
		var time = $('#class_time_date').val();
		var s_date = $('#class_date_s').val();
		var e_date = $('#class_date_e').val();
		var price = $('#class_price').val();
		var limited = $('#class_limit').val();
		var kategori = $('#class_categori').val();
		
		var roomidx = $('#select_room').val();
		var teacheridx = $('#select_teacher').val();
		
		//alert("++ " + roomidx);
		//alert("+++ " + teacheridx);
		
		if( name == '' || time == '' || s_date == '' || e_date == '' || price == '' || limited == '' || kategori == ''){
			alert("빈칸을 채워주세요!");
		}else if(roomidx == "choice1" || teacheridx == "choice2"){
			alert("강의실 및 강사를 선택해주세요!");
		}else{
			//alert("완완");
			ajaxDo('admin_class_insert.do?academyidx=<%=request.getParameter("academyidx")%>&name=' + name + '&time=' + time + '&s_date=' + s_date + '&e_date=' + e_date + '&price=' + price + '&limited=' + limited + '&kategori=' + kategori + '&roomidx=' + roomidx + '&teacheridx=' + teacheridx,'');
			ajaxDo('admin_class_list.do?academyidx=<%=request.getParameter("academyidx") %>', '#admin_class_list');
			input_eraser();
		}
		
	} // class_insert()
	
	
	function class_delete() {
		var array = new Array();
		var checkbox_length = document.getElementsByName("checkbox_class_list").length;
		
		for(var i=0; i<checkbox_length; i++)
		{
			if(document.getElementsByName("checkbox_class_list")[i].checked == true)
			{
				array.push(document.getElementsByName("checkbox_class_list_hidden")[i].value);
			}
		}
		
		if(ajaxArray_class_delete('academy_admin_class_delete?academyidx=<%=request.getParameter("academyidx")%>','#admin_class_list',array) == "true")
		{
			alert("정상처리");
			input_eraser();
		}else{
			alert("삭제실패");
		}
		ajaxDo('admin_class_list.do?academyidx=<%=request.getParameter("academyidx") %>', '#admin_class_list');
		
	}
	
		
	function class_update() {
			
			var class_idx = $('#class_idx').val();
			var class_name = $('#class_name').val(); // 강의명
			var class_category = $('#class_categori').val(); // 강의 카테고리
			var class_date_s = $('#class_date_s').val(); // 시작일
			var class_date_e = $('#class_date_e').val(); // 종료일
			var class_time_date = $('#class_time_date').val(); // 요일 및 시간
			var class_price = $('#class_price').val(); // 가격
			var select_room = $('#select_room').val(); // 강의실
			var select_teacher = $('#select_teacher').val(); // 강사
			var class_limit = $('#class_limit').val(); // 인원수
			
			//alert(class_idx + " " + class_name+ " " + class_category+ " " + class_date_s+ " " + class_date_e+ " " + class_time_date+ " " + class_price+ " " + select_room+ " " + select_teacher+ " " + class_limit);
			
			if(ajaxDo('admin_class_update?classidx='+ class_idx +
					'&class_name=' +class_name +
					'&class_category='+class_category+
					'&class_date_s='+class_date_s+
					'&class_date_e='+class_date_e+
					'&class_time_date='+class_time_date+
					'&class_price='+class_price+
					'&select_room='+select_room+
					'&select_teacher='+select_teacher+
					'&class_limit='+class_limit,'') == 'true'){
				alert("수정 성공");
				ajaxDo('admin_class_list.do?academyidx=<%=request.getParameter("academyidx") %>', '#admin_class_list');
				input_eraser();
			}else{
				alert("수정 실패");
			}
			
		}
	
</script>

</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>
<div class="Biggroup">
<div class="Smallgroup">
	
<div id="adminDiv"></div><script type="text/javascript">ajaxDo('admin?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=classList','#adminDiv');</script>
	<div id="classList_container">
		<div id="classList_div">
			<span style="font-size:35px;">수강 정보 관리</span><br><br>
			<div id="searchbar">
				<div id="serach_categori">
				카테고리 목록 
					<select><option value="">옵션을 선택해주세요.</option></select>
				</div>

			<script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>
			    <div class="search">
			    	<i class="fas fa-search"></i>
			    	<input id="search" type="text">
			    </div>
			</div>
			
		    <br>
    		<div id="classListbox_container" style="border:1px solid black;">
	    		<div style="margin-top:10px; margin-bottom:10px;"><h2>강의 목록</h2></div>
	    		<div id="classListbox_div" style="border:1px solid black;">
	    			<div id="admin_class_list"></div><script type="text/javascript">ajaxDo('admin_class_list.do?academyidx=<%=request.getParameter("academyidx") %>', '#admin_class_list')</script>
	    		</div>
		    </div>
			
			<div id="classcreate_container" >
			<div id="classcreate" style="border: 1px solid black;">
					<input class="classcreateinput" id="class_idx" type="hidden" >
	    		<div class="classcreatediv" ><div class="classcreate_text">강의 이름</div>
	    			<input class="classcreateinput" id="class_name" type="text" >
	    		</div>
	    		<div class="classcreatediv" ><div class="classcreate_text">강의 카테고리</div>
	    			<input class="classcreateinput" id="class_categori" type="text">
	    		</div>
	    		
	    		 <div class="classcreatediv" ><div class="classcreate_text">수업 시작 날짜</div>
			    	<input class="classcreateinput" id="class_date_s" type="text">
			    </div>
			    <div class="classcreatediv" ><div class="classcreate_text">수업 종료 날짜</div>
			    	<input class="classcreateinput" id="class_date_e" type="text">
			    </div>
	    		
	    		<div class="classcreatediv" ><div class="classcreate_text">수업 시간 및 요일</div>
			    	<input class="classcreateinput" id="class_time_date" type="text">
			    </div>
			    
			    <div class="classcreatediv" ><div class="classcreate_text">강의 가격</div>
	    			<input class="classcreateinput" id="class_price" type="text">
	    		</div>
	    		
	    		<div>
			    <div class="classcreatediv" id="classroom_name"><div class="classcreate_text">강의실</div>
			    	<select id="select_room" style="margin-top:10px; margin-bottom:10px; width:175px; height:40px;">
			    		<option value="choice1">선택</option>
			    		<% for(int i=0; i<room_list.size(); i++){ %>
							<option value="<%=room_list.get(i).getIdx()%>"><%= room_list.get(i).getName() %></option>
						<%} %>
					</select>
			    </div>
			    <div class="classcreatediv" id="class_teacher">
					    <div class="classcreate_text">강사</div>
					<select id="select_teacher" style="margin-top:10px; margin-bottom:10px; width:175px; height:40px;">
			    		<option value="choice2">선택</option>
			    		<% for(int i=0; i<teacher_list.size(); i++){ %>
							<option value="<%=teacher_list.get(i).getIdx()%>"><%= teacher_list.get(i).getName() %></option>
						<%} %>
					</select>
				</div>
					
				<div class="classcreatediv"><div class="classcreate_text">인원 제한</div>
			    	<input class="classcreateinput" id="class_limit" type="text">
			    </div>
			    </div>
			    </div>
			    
			    <div class="btn_group">
			    	<input type="button" id="btn_createclass" value="수강 개설" onclick="class_insert()">
			    	<input type="button" id="btn_updateclass" value="수강 수정" onclick="class_update()">
			    	<input type="button" id="btn_deleteclass" value="수강 폐지" onclick="class_delete()">
			    	<input type="button" id="btn_eraser" value="지우기" onclick="input_eraser()">
		    	</div>
		    
			</div>
		</div>
	</div>
</div>
</div>
	<footer>
	<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
	</footer>
	
</body>
</html>
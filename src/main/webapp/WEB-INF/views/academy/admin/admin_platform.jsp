<%@page import="com.jj.util.FontUtil"%>
<%@page import="com.jj.vo.AcademyStyleVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
FontUtil fontUtil = new FontUtil();
AcademyStyleVo academyStyleVo = (AcademyStyleVo)request.getAttribute("banner_style");

String top_img="";
int top_img_size = 0;
String font_col="#000000";
String hover_col= "#32c2e6";
String back_col= "#ffffff";
int top_font_size = 70;
int font=0;
String main_img="defImg.PNG";
int main_size=40;

if(academyStyleVo!=null){
	top_img=academyStyleVo.getTop_img();
	top_img_size =academyStyleVo.getTop_img_size();
	font_col="#"+academyStyleVo.getFont_col();
	hover_col= "#"+academyStyleVo.getHover_col();
	back_col= "#"+academyStyleVo.getBack_col();
	top_font_size = academyStyleVo.getTop_font_size();
	font=academyStyleVo.getFont();
	if(font==0)
		font=0;
	main_img=academyStyleVo.getMain_img();
	if(main_img==null)
		main_img="defImg.PNG";
	main_size=academyStyleVo.getMain_size();
	if(main_size==0)
		main_size=40;
}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플랫폼 관리</title>
<link rel="stylesheet" href="resources/CSS/academy/main/academy_divset.css" type="text/css">
<link rel="stylesheet" href="resources/CSS/academy/main/footer.css" type="text/css">
<style type="text/css"><%=fontUtil.fontImport()%></style>
<style type="text/css">
#admin_platform_container{
}
#admin_platform_div{
border: 3px solid #d3d3d3;
border-radius:50px;
margin-top:20px;
margin-bottom:20px;
width: 800px;
padding : 30px;
text-align: center;

}
#academy_favi_div{
border:1px solid black;
}
#academy_favi{
border:1px solid black;
}
#academy_name_div{
border:1px solid black;
margin-top: 10px;
}
#academy_name{
border:1px solid black;
}
#academy_main_div{
border:1px solid black;
margin-top: 10px;
}
#academy_main{
border:1px solid black;
}
.completebutton{
display:inline-block;
vertical-align: top;
}
#academy_faviset,
#academy_nameset,
#academy_mainset,
#set_save {
display: inline-block;
cursor: pointer;
text-align: center;
padding: 8px 12px;
box-shadow: inset 0 1px 0 rgba(255,255,255,.2);
text-shadow: 0 -1px 0 rgba(0,0,0,.4);
border-radius: 6px;
font-size: 20px;
border-style: solid;
border-width: 1px;  
width :100px;
height:40px;
}
.academy_favi_route_div,
.academy_name_route_div,
.academy_main_route_div{

display: inline-block;
width: 600px;
}
#academy_main_route,
#academy_name_route,
#academy_favi_route{
border: 1px solid black;
margin:auto 0;
padding: 10px 12px;
width: 500px;
height:18px;
}
#save_div{
margin-top: 20px;
}
/* 시크바 */
.container{overflow:hidden;margin:20px 0px 0 0}
.seek-bar{margin:45px auto 20px;position:relative;width:calc(100% - 100px);height:10px;background:#222;border-radius:5px;}
.seek-bar>.circle1{cursor:grab;position:absolute;left:<%=top_img_size%>%;top:50%;width:30px;height:30px;transform:translate(-50%,-50%);touch-action: none;}
.seek-bar>.circle2{cursor:grab;position:absolute;left:<%=top_font_size%>%;top:50%;width:30px;height:30px;transform:translate(-50%,-50%);touch-action: none;}
.seek-bar>.circle3{cursor:grab;position:absolute;left:<%=main_size%>%;top:50%;width:30px;height:30px;transform:translate(-50%,-50%);touch-action: none;}
.seek-bar>.circle>svg{pointer-events:none;width:0;height:0;}
.seek-bar>.circle>div{height:100%;-webkit-filter:url("#svg_goo");filter:url("#svg_goo");}
.seek-bar>.circle>div>em{pointer-events:none;position:absolute;display:block;width:30px;height:30px;left:50%;top:50%;transform:translate(-50%,-50%);background:#2196f3;border-radius:100%;transition:all .5s;}
.seek-bar>.circle>span{pointer-events:none;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);filter:none;color:#fff;font-size:18px;transition:all .5s;white-space:nowrap;text-align:center;}
.seek-bar>.circle.s_on>span{margin-top:-50px;font-size:20px;}
.seek-bar>.circle.s_on>div>em:nth-child(2){margin-top:-50px;background:#65bbff;width:40px;height:40px;}

.save_btn{
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
	    margin: 10px 0 10px 0;
}
</style>

</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>
<div id="academyMain_topBarDiv"></div><script type="text/javascript">ajaxDo('academyMain_topBar?academyidx=<%=request.getParameter("academyidx") %>','#academyMain_topBarDiv');</script>
<div class="Biggroup">
<div class="Smallgroup">

<div id="adminDiv"></div><script type="text/javascript">ajaxDo('admin?academyidx=<%=request.getParameter("academyidx") %>&bgColorSet=admin_platform','#adminDiv');</script>

	<div id="admin_platform_container">
		<div id="admin_platform_div">
		<span style="font-size:35px;">플랫폼 관리</span><br><br>
		
		<div id="academy_favi_div"><h2>상단 베너 설정</h2>

			<div id='preDiv' style="width: 98%;height: 70px;border: 1px solid black; background-color: <%=back_col%>;margin:0px auto 25px;">
				<div style="float: left;height:100%; margin: 0px 10px 0px 8px;"> <!-- 탑바 학원 로고 -->
					<a onclick="return false;">
						<span style=" display: inline-block;height: 100%;vertical-align: middle; width: 0px; font-size: 0;"></span>
						<img id='img_sam' alt="" src='resources\IMG\academy_style\<%=top_img %>' style="height:<%=top_img_size%>%; max-height: 100%;display: inline-block;vertical-align: middle;">
					</a>
				</div>	
				<div id='academyNameDiv' style="height: 100%; float: left;"><!-- 탑바 학원 이름 -->			
					<a onclick="return false;">
						<span style=" display: inline-block;height: 100%;vertical-align: middle; width: 0px; font-size: 0;"></span>
						<span id='preFont' style=" font-size: <%=57*top_font_size/100%>px;display: inline-block;vertical-align: middle;margin-top:<%=fontUtil.getMarginTop(font) %>px;color:<%=font_col%>; font-family:<%=fontUtil.getFont(font)%>">
							<%=request.getAttribute("academyName") %>
						</span>
					</a>
				</div>
			</div>
			<div style="width: 100%;">
				<form id="fileForm1" method="post" enctype="multipart/form-data"> 	
				 		<div class="container">
				 			<span onclick=" document.getElementById('file1').click();" style="cursor: pointer;font-size: 22px; ">
				 			<img alt="" src="resources/IMG/academy_style/def/save_top_img.png" height="24px;">
				 			이미지 선택
				 			</span>			
				 			<input id="file1" type="file" name="file1"  style="display: none;" onchange="readURL1(this);"> 
				 			
							  <div class="seek-bar" style="width: 60%;">
								<span style="float:left; margin-top:-30px;">사진 크기</span>
							  <div id="circle1" class="circle circle1">  
							    <div>
							      <em></em>
							      <em></em>
							    </div>
							    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
							      <defs>
							        <filter id="svg_goo" filterUnits="objectBoundingBox">
							          <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur" />
							          <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 30 -11" result="svg_goo" />
							          <feBlend in="SourceGraphic" in2="svg_goo" />
							        </filter>
							      </defs>
							    </svg>
							    <span id='top_img_size'><%=top_img_size %></span>
							  	</div>
								</div>
				 			</div>
				
				 	
			
				
					<div style="width: 100%; text-align: center;margin: 20px 0 20px 0;font-size: 21px;">
						
						<table style="margin: auto;">
							<tr>
								<td style="text-align: left;padding:10px 10px 10px 0;">배경</td>
								<td style="text-align: left;"><input onchange="background_col(this)" id='back_input' type="color" value='<%=back_col%>' style="width: 95px;"></td>
								
							</tr>
							<tr>
								<td style="text-align: left;padding:10px 10px 10px 0;">학원명</td>
								<td style="text-align: left;"><input id='font_input' onchange="font_col(this)" type="color" value='<%=font_col%>' style="width: 95px;"></td>
							</tr>
							<tr>
								<td style="text-align: left;padding:10px 10px 10px 0;">커서 위치시</td>
								<td style="text-align: left;"><input id='hover_input' onchange="hover_col(this)" type="color" value='<%=hover_col%>' style="width: 95px;"></td>
							</tr>
							<tr>
								<td style="text-align: left;padding:10px 10px 10px 0;">폰트</td>
								<td style="text-align: left;">
									 <select name='font' id='fontSelect' style="font-size: 20px;font-family: <%=fontUtil.getFont(font) %>" onchange="fontChange()" >
									 	<%for(int i=0;i<fontUtil.getCount();i++){ %>
									 		<option id='fontOption<%=i%>' style="font-family:<%=fontUtil.getFont(i)%>;" value='<%=i%>'  <%=i==font?"selected":"" %>>가나다라</option>
									 	<%} %>
									 </select>
								 </td>
							</tr>
						</table>
					
						
						 
						 
					</div>
					<div style="width: 100%; text-align: center;margin: 20px 0;">
					
					  <div class="seek-bar" style="width: 60%;">
								<span style="float:left; margin-top:-30px;">글자 크기</span>
							  <div id="circle2" class="circle circle2">  
							    <div>
							      <em></em>
							      <em></em>
							    </div>
							    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
							      <defs>
							        <filter id="svg_goo" filterUnits="objectBoundingBox">
							          <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur" />
							          <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 30 -11" result="svg_goo" />
							          <feBlend in="SourceGraphic" in2="svg_goo" />
							        </filter>
							      </defs>
							    </svg>
							    <span id='top_font_size'><%=top_font_size %></span>
							  	</div>
								</div>
					</div>
					
					
					
					<div style="width: 100%; text-align: center;margin: 20px 0 10px 0;"><input class='save_btn' type="button" value="저장" style="" onclick="save_banner()"></div>
				 </form>
			</div>
			
				

		</div>
		
		
		<div id="academy_name_div"><h2>메인 설정</h2>
			<div style="width: 98%; border: 1px solid black; margin: 0 auto;">
				<div style="width: 100%;   margin: 0 auto;background-color: #2cb8d1; color: white;"> <h2>배너</h2> </div>
				<img id="main_img_sam"  src="resources/IMG/academy_style/<%=main_img %>" style='width:<%=main_size%>%;margin:20px 0px; '>
				<div style="width: 100%;   margin: -4px auto 0 auto;background-color: #2cb8d1; color: white;"> <h2>리뷰</h2> </div>
			</div>
			<span onclick=" document.getElementById('file2').click();" style="cursor: pointer;font-size: 22px; ">
				 <img  alt="" src="resources/IMG/academy_style/def/save_top_img.png" height="24px;">
				 	이미지 선택
			</span>
			<form id="fileForm2" method="post" enctype="multipart/form-data"> 			
			<input id="file2" type="file" name="file2"  style="display: none;" onchange="readURL2(this);"> 
						<div class="seek-bar" style="width: 60%;">
								<span style="float:left; margin-top:-30px;">사진크기</span>
							  <div id="circle3" class="circle circle3">  
							    <div>
							      <em></em>
							      <em></em>
							    </div>
							    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
							      <defs>
							        <filter id="svg_goo" filterUnits="objectBoundingBox">
							          <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur" />
							          <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 30 -11" result="svg_goo" />
							          <feBlend in="SourceGraphic" in2="svg_goo" />
							        </filter>
							      </defs>
							    </svg>
							    <span id='main_size'><%=main_size%></span>
							  	</div>
						</div>
			



						<div style="width: 100%; text-align: center;margin: 20px 0 10px 0;"><input class='save_btn' type="button" value="저장" style="" onclick="save_main()"></div>
				</form>
		</div>
		
		

	
			
			
		</div>
	</div>
</div>
</div>
<div id='loadingDiv' style="width: 100%; height: 100vh; position: fixed; left:0;top:0; background-color:rgba(0,0,0,0.7); text-align: center; display: none;">
<span style=" display: inline-block;height: 100%;vertical-align: middle; width: 0px; font-size: 0;"></span>
	<img alt="" src="resources/IMG/academy_style/def/loading.gif" width="70px;" style="">
</div>

<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>

<script type="text/javascript">
var fColor='<%=font_col%>';
var hColor='<%=hover_col%>';

	function save_banner(){
		var save_param ='';
		save_param='&font_col='+$('#font_input').val().replace('\#','')+'&hover_col='+$('#hover_input').val().replace('\#','')
		+'&back_col='+$('#back_input').val().replace('\#','')+'&top_font_size='+$('#top_font_size').text()+'&font='+$('#fontSelect').val();
		  var fileCheck = document.getElementById("file1").value;
		    if(!fileCheck){/* 이미지를 설정하지 않고 보낼때 */
		    	$.ajax({
					  type: "POST",
					   url: 'save_notImg_banner.do?academy=<%=request.getParameter("academyidx")%>&top_img_size='+$('#top_img_size').text()+save_param,
					    success: function (e) { 
					    	location.reload();
						    }, error: function (e) { }
				  });
		    }else{/* 이미지를 설정하고 보낼때 */
			    $('#loadingDiv').show();
		    	var formData = new FormData($('#fileForm1')[0]);		
				  $.ajax({
					  type: "POST",
					  enctype: 'multipart/form-data',// 필수
					   url: 'save_banner.do?academy=<%=request.getParameter("academyidx")%>&top_img_size='+$('#top_img_size').text()+save_param,
					   data: formData, // 필수 
					   processData: false, // 필수 
					   contentType: false, // 필수
					    cache: false,
					    success: function (e) { 
					    	location.reload();
						    }, error: function (e) { }
				  });
			  }
	}		  
	function save_main(){
		var save_param ='';
		save_param='&main_size='+$('#main_size').text();
			 var fileCheck = document.getElementById("file2").value;
				  if(!fileCheck){/* 이미지를 설정하지 않고 보낼때 */
				  	$.ajax({
					  type: "POST",
					   url: 'save_notImg_main.do?academy=<%=request.getParameter("academyidx")%>'+save_param,
					    success: function (e) { 
					    	location.href='academyMain?academyidx=<%=request.getParameter("academyidx")%>';
						    }, error: function (e) { }  });
				  }else{/* 이미지를 설정하고 보낼때 */
					  $('#loadingDiv').show();
			   	var formData = new FormData($('#fileForm2')[0]);		
				  $.ajax({						  
					  type: "POST",
					  enctype: 'multipart/form-data',// 필수
					   url: 'save_main.do?academy=<%=request.getParameter("academyidx")%>'+save_param,
					   data: formData, // 필수 
					   processData: false, // 필수 
					   contentType: false, // 필수
					    cache: false,
					    success: function (e) { 
					    	location.href='academyMain?academyidx=<%=request.getParameter("academyidx")%>';
						    }, error: function (e) { }
				  });
			  }		    
		
			  
			
			
	}	
	var elem = document.getElementById('preFont');
	elem.addEventListener('mouseover',function(){elem.style.color = hColor}); 
	elem.addEventListener('mouseout',function(){elem.style.color = fColor});


	function background_col(th){
		document.getElementById('preDiv').style.backgroundColor = th.value;
		}
	function font_col(th){
		document.getElementById('preFont').style.color = th.value;
		fColor=th.value;
		}
	function hover_col(th){
		hColor=th.value;
		}

dragElement(document.getElementById("circle1"));
dragElement(document.getElementById("circle2"));
dragElement(document.getElementById("circle3"));


function dragElement(elmnt) {
  let clientX_gab = 0, clientX = 0;
  elmnt.onmousedown = dragMouseDown;
  elmnt.addEventListener('touchstart',dragMouseDown)
  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    elmnt.classList.add('s_on');
    if (e.changedTouches) {
      e.clientX = e.changedTouches[0].clientX
    }
    clientX = e.clientX;
    document.onmouseup = closeDragElement;
    document.addEventListener('touchend',closeDragElement);
    document.onmousemove = elementDrag;
    document.addEventListener('touchmove',elementDrag);
  }

  function elementDrag(e) {
	$('#img_sam').css("height",$('#top_img_size').text()+"%");
	$('#preFont').css("font-size",(57*$('#top_font_size').text()/100)+"px");
	$('#main_img_sam').css("width",$('#main_size').text()+"%");

    e = e || window.event;
    e.preventDefault(); 
    if (e.changedTouches) {
      e.clientX = e.changedTouches[0].clientX
    }
    clientX_gab = e.clientX - clientX;
    clientX = e.clientX;
    let leftVal = 0;
    let parentElmnt = elmnt.parentNode;
    if (
      (elmnt.offsetLeft + clientX_gab) < 0 ||
      clientX < parentElmnt.offsetLeft) 
      {
      leftVal = 0;
    } else if(
      (elmnt.offsetLeft + clientX_gab) > parentElmnt.clientWidth ||
      clientX > (parentElmnt.offsetLeft+parentElmnt.clientWidth))
      {
      leftVal = parentElmnt.clientWidth;
    } else {
      leftVal = (elmnt.offsetLeft + clientX_gab);
    }
    elmnt.querySelector('span').innerText = Math.round((leftVal /parentElmnt.clientWidth)*100);
    
    elmnt.style.left = leftVal + "px";
  }

  function closeDragElement() {
    elmnt.classList.remove('s_on');
    document.onmouseup = null;
    document.removeEventListener('touchend', closeDragElement);
    document.onmousemove = null;
    document.removeEventListener('touchmove', elementDrag);
  }
}



	function readURL1(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
			$('#img_sam').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function readURL2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
			$('#main_img_sam').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	function fontChange(){
		var marginTop = [];
		<%for(int i=0;i<fontUtil.getCount();i++){%>
			marginTop[<%=i%>]=<%=fontUtil.getMarginTop(i)%>;
		<%}%>
		
		$('#fontSelect').css("font-family", $("#fontOption"+$('#fontSelect').val()).css("font-family")  ).css("font-size","20px");
		$('#preFont').css("font-family",$("#fontOption"+$('#fontSelect').val()).css("font-family")).css('margin-top',marginTop[$('#fontSelect').val()]+'px');
		
		
		}
	
</script>
</body>
</html>
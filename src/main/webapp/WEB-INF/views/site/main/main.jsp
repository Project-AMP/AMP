<%@page import="com.jj.vo.AcademyRankVo"%>
<%@page import="com.jj.vo.SearchRankVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!--   <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
 <%ArrayList<SearchRankVo> searchRank=(ArrayList<SearchRankVo>)request.getAttribute("searchRank"); %>
 <%ArrayList<AcademyRankVo> academyRank=(ArrayList<AcademyRankVo>)request.getAttribute("academyRank"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AMP</title>

<style>
* { margin:0; padding:0;}
header { background:#6CF; height:100px; }
#cont { background:#fcf; height:1000px; }

#main { height:560px; position:relative; overflow:hidden;}
#main .slide { position:relative; }
#main .slide a { float:left; height:560px; }
/* #main .slide .m01 { background:url(resources/CSS/main/main01.jpg) no-repeat center; }
#main .slide .m02 { background:url(resources/CSS/main/main02.jpg) no-repeat center; }
#main .slide .m03 { background:url(resources/CSS/main/main03.jpg) no-repeat center; }
#main .slide .m04 { background:url(resources/CSS/main/main04.jpg) no-repeat center; }
#main .slide .m05 { background:url(resources/CSS/main/main05.jpg) no-repeat center; } */
#main .slide .m01 { background:url(resources/CSS/main/REALMAIN1.jpg) no-repeat center; }
#main .slide .m02 { background:url(resources/CSS/main/REALMAIN2.jpg) no-repeat center; }
#main .slide .m03 { background:url(resources/CSS/main/REALMAIN3.jpg) no-repeat center; }
#main .slide .m04 { background:url(resources/CSS/main/REALMAIN4.jpg) no-repeat center; }
#main .slide .m05 { background:url(resources/CSS/main/REALMAIN5.jpg) no-repeat center; }
#main > a { position:absolute; width:50px; height:50px; border:2px solid #000; top:255px; border-left:none; border-bottom:none; }
#main #prev { left:50px; transform:rotate(-135deg); }
#main #next { right:50px; transform:rotate(45deg); }

#page { position:absolute; bottom:30px; left:50%; margin-left:-70px; }
#page li { width:20px; height:20px; background:#000; margin-right:20px; list-style:none; float:left; opacity:0.4; }
#page li:last-child { margin-right:0; }
#page .select { opacity:1; }


#main2{
	width: 100%;
	text-align: center;

}	

	#notice_div{

		width:100%;
		max-width: 1200px;
		min-width:500px;
		height: 700px;
		display:inline-block ;
		vertical-align:middle;
		margin:5px;
		padding-top: 70px;	
		padding: 30px 20px 0px 20px;
	}
		#hot_rank,#new_rank{
				
			background-color: #333;
			color:#fff;
			
	
		}
		
	@media all and (min-width: 1623px) { 
	 	#rank{

			display:inline-block;
			vertical-align:middle;
		
			
	
		}
			#hot_rank{

				height: 330px;
				width: 300px;
				margin:auto;
				margin: 22px;

				
	
			}
			#new_rank{

				height: 330px;
				width: 300px;
				margin:auto;
				margin: 22px;
	
			} 
		}
		@media all and (max-width: 1622px) { 
			#notice_div{
					margin:5px 0px;
					padding: 70px 0px 0px 0px;
			
				}
			#rank{
		
				width:100%;
				padding:50px;
				text-align:center;
				margin:auto;
				vertical-align:top;
				padding:0px 20px;
				max-width: 1160px;
				border-radius: 20px;
		
		
			}
				#hot_rank{

					height: 330px;
					margin: auto;
					width: 300px;
					vertical-align:middle;
					display: inline-block;
					margin: 20px;
				}
				#new_rank{

					height: 330px;
					margin: auto;
					width: 300px;
					vertical-align:middle;
					display: inline-block;
					margin: 20px;
				}  
		}
		
	#adpick{
		
				width:75%;
				margin:auto;
	}


	#rank a:link {text-decoration:none; color:#646464;}
	 #rank a:visited {text-decoration:none; color:#646464;}
	 #rank a:active {text-decoration:none; color:#646464;}
	 #rank a:hover {text-decoration:none; color:#646464;}
</style>
<!-- top_bar 기본형태 -->

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/JS/ajax/ajax.js"></script>

<!-- 토스트 관련 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>

<body>



<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<div id="topBarDiv"></div><script type="text/javascript">ajaxDo('topBar','#topBarDiv');</script>

<section id="main">
	<div class="slide">
    	<a href="#" class="m01"></a>
        <a href="#" class="m02"></a>
        <a href="#" class="m03"></a>
        <a href="#" class="m04"></a>
        <a href="#" class="m05"></a>
	</div>
    <ul id="page"></ul>
    <a href="#" id="prev"></a>
    <a href="#" id="next"></a>
</section>

<div id="main2" style="line-height:2em; margin:30px 0; font-family:"맑은 고딕"; " >

	<div id='notice_div'></div>
	<div id="rank">
		
		
		<div id="hot_rank"><span style="font-size:16px;font:bold">급상승 검색어</span>
			<div  style="background-color: #f5f6f7;height: 298px;">
				<%for(int i=0; i<searchRank.size();i++){ %>
					<a style="font-weight:bold;" href='tagSearch?keyword=<%=searchRank.get(i).getSearch() %>'><%=i+1%>.<%=searchRank.get(i).getSearch() %></a><br>
				<%} %>			
			</div>		
		</div>
	
		<div id="new_rank"><span style="font-size:16px;font:bold">인기 학원</span>
			<div  style="background-color: #f5f6f7;height: 298px;">
				<%for(int i=0; i<academyRank.size();i++){ %>
					<a style="font-weight:bold;" href='academyMain?academyidx=<%=academyRank.get(i).getAcademy() %>'><%=i+1%>.<%=academyRank.get(i).getName()%></a><br>
				<%} %>			
			</div>		
		</div>
		
		
	</div>
	<!-- <div id='adpick'>
		<iframe src="https://adpick.co.kr/nativeAD/ad.php?bannerType=type3&limit=1&affid=c2a9f2&frameId=AdpickAdFrame_2021518%40213029&popup=false" width="100%" frameborder="0" scrolling="no" data-adpick_nativeAD id="AdpickAdFrame_2021518@213029"></iframe><script src="https://adpick.co.kr/nativeAD/script.js" async="true"></script>
	</div> -->
</div>

<footer>
<%@ include file="/WEB-INF/views/site/main/footer.jsp" %>
</footer>

<script>
var n = $(".slide a").length;
$(".slide").append( $(".slide a:first-child").clone() );
$(".slide").css({"width":(n + 1) * 100 + "%"});
$(".slide a").css({"width":100 / (n + 1) + "%"});
var cnt = 0;

for ( var i = 1; i <= n; i++ ) {
	if ( i == 1 ) {
		$("#page").append("<li class='select'></li>");
	} else {
		$("#page").append("<li></li>");
	}
};

function auto() {
	cnt++;
	if ( cnt >= n ) { 
		$(".slide").animate({"left":-cnt * 100 + "%"},300,function(){
			$(this).css({"left":0});
		});
	cnt = 0; 
	} else {
		$(".slide").animate({"left":-cnt * 100 + "%"},300);
	}
	$("#page li").eq(cnt).addClass("select").siblings().removeClass();
};

var timer = setInterval("auto()",6000);

$("#next").click(function(){
	clearInterval(timer);
	auto();
	timer = setInterval("auto()",6000);
});

$("#prev").click(function(){
	clearInterval(timer);
	cnt--;
	if ( cnt <= -1 ) {
		cnt = n - 1;
		$(".slide").css({"left":-n * 100 + "%"}).animate({"left":-cnt * 100 + "%"},300);
	} else {
		$(".slide").animate({"left":-cnt * 100 + "%"},300);
	}
	$("#page li").eq(cnt).addClass("select").siblings().removeClass();
	timer = setInterval("auto()",6000);
});

$("#page li").click(function(){
	clearInterval(timer);
	cnt = $(this).index();
	$(".slide").animate({"left":-cnt * 100 + "%"},300);
	$(this).addClass("select").siblings().removeClass();
});

get_notice_div(1,'','');
function get_notice_div(page,condition,keyword){
	ajaxDo('notice_kit?academyidx=0&page='+page+'&condition='+condition+'&keyword='+keyword,'#notice_div');
    }


</script>

<!-- 토스트관련 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<script src="/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>


</body>
</html>
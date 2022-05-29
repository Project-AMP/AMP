<%@page import="com.jj.vo.NoticeVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <%
  	String academyidx = request.getParameter("academyidx");
 	int idx=100;
  	if(session.getAttribute("idx")!=null){
  		 idx= (int)session.getAttribute("idx");
  	}
  

  %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/CSS/academy/main/main_banner.css" type="text/css">
<link rel="stylesheet" href="resources/CSS/notice/notice.css" type="text/css">

<style type="text/css">
 
    ul, li{ 
    list-style:none;
    text-align:center;
    padding:0;
    margin:0;
	}

    #mainWrapper{
    width: 100%;
    margin: 0 auto; /*가운데 정렬*/
    line-height:2em;        
    font-family:"맑은 고딕";
    }

    #mainWrapper > ul > li:first-child {
    text-align: center;
    font-size:14pt;
    height:40px;
    vertical-align:middle;
    line-height:30px;
	}

    #ulTable {
    margin-top:10px;
    }
    

    #ulTable > li:first-child > ul > li {
    background-color:#c9c9c9;
    font-weight:bold;
    text-align:center;
	}

    #ulTable > li > ul {
    clear:both;
    padding:0px auto;
    position:relative;
    min-width:40px;
	}
    #ulTable > li > ul > li { 
    float:left;
    font-size:10pt;
    border-bottom:1px solid silver;
    vertical-align:baseline;
	}    

    #ulTable > li > ul > li:first-child               {width:10%;} /*No 열 크기*/
    #ulTable > li > ul > li:first-child +li           {width:45%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li        {width:20%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li{width:10%;} /*조회수 열 크기*/

    #divPaging {
    clear:both; 
    margin:0 auto; 
    width:220px; 
    height:50px;
	}

    #divPaging > div {
    float:left;
    width: 30px;
    margin:0 auto;
    text-align:center;
	}

    #liSearchOption {
    clear:both;
    }
    #liSearchOption > div {
    margin:0 auto; 
    margin-top: 30px; 
    width:auto; 
    height:100px;
    }

    .left {
    text-align : left;
    }
    
    #mainWrapper a:link {text-decoration:none; color:black;}
	 #mainWrapper a:visited {text-decoration:none; color:black;}
	 #mainWrapper a:active {text-decoration:none; color:black;}
	 #mainWrapper a:hover {text-decoration:none; color:black;}
    
</style>

<script type="text/javascript">
	function goWrite() {
		location.href="noticeWrite.do?academyidx="+ '<%= academyidx %>';
	}
</script>

</head>
<body id="touchMyBody">
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JS/ajax/ajax.js"></script>

		    <div id="mainWrapper">
		        <ul>
		            <!-- 게시판 제목 -->
		            <li style="font-size: 30px;font:bold; ">공지사항</li>
		            <!-- 게시판 목록  -->
		            <li>
		                <ul id ="ulTable">
		                    <li >
		                        <ul>
		                            <li style="background-color: #333; font-size: 16px;color:white;">No</li>
		                            <li style="background-color: #333; font-size: 16px;color:white;">제목</li>
		                            <li style="background-color: #333; font-size: 16px;color:white;">작성일</li>
		                            <li style="background-color: #333; font-size: 16px;color:white;">작성자</li>
		                            <li style="background-color: #333; font-size: 16px;color:white;">조회수</li>
		                        </ul>
		                        
		                        
		                    </li>
		                    
		                    <li>
		                    
		                     <!-- 게시물이 출력될 영역 -->  
		                    <c:forEach var="noticeVo" items="${noticelist}">
		                    	<ul>
		                    		
			                        <li style=" font-size: 15px;">${ noticeVo.num }</li>
				                    <li style=" font-size: 15px;" class="left"><a href="notice_detail.do?academyidx=<%= academyidx %>&idx=${ noticeVo.idx }">${ noticeVo.title }</a></li>
				                    <li style=" font-size: 15px;">${ noticeVo.date }</li>
				                    <li style=" font-size: 15px;">관리자</li>
				                    <li style=" font-size: 15px;">${ noticeVo.view }</li>
				                
		                        </ul>
		                    </c:forEach>
		                                                           
		                </ul>
		            </li>
		        </ul>
		        
		        <div id="noticeWrite" style="text-align: right";>
		        <c:set var = "idx"  value='<%=(-idx)+"" %>'/>
		        <c:set var = "academyIdx"  value="<%=academyidx %>"/>
		        
		        	<c:choose>
			        	<c:when test="${ idx eq academyIdx }">
			        		<input id="write_btn" class="btn btn-primary" type="button" value="글쓰기" onclick="goWrite();">
			        	</c:when>
		        	</c:choose>
		        </div>
		        
		        
		        <!-- 게시판 페이징 영역 -->
		        <div id=mainPaging>
					<ul>
						<li>
							<div id="divPaging1" >
								<nav aria-label="Page navigation example1">
									<ul class="pagination1">
										${ pageMenu }
									</ul>
								</nav>
							</div>
						</li>
					</ul>
				</div>
		        
	    	</div>

			

			<div id="mainSearch" style=" pdding-top: 5px;">
	    		<!-- 검색 폼 영역 -->
	    		<ul>
		            <li id="liSearchOption"  style="margin-top:-20px;">
		                <div>
		                    <select id='selSearchOption' style="border: 1.5px solid black; margin:0 -3px; font-size: 15px; padding: 2px 3px; border-right: 0; " >
		                    <%String c=request.getParameter("condition");%>
		                        <option value='0' <%=(c!=null&&c.equals("0")?"selected":"") %>>제목+내용</option>
		                        <option value='1'<%=(c!=null&&c.equals("1")?"selected":"") %>>제목</option>
		                        <option value='2'<%=(c!=null&&c.equals("2")?"selected":"") %>>내용</option>
		                    </select>
		                    <input id='txtKeyWord' value='<%=(request.getParameter("keyword").equals(null)?"":request.getParameter("keyword"))%>' style="border: 1.5px solid black; margin:0 -3px; font-size: 15px; padding: 3px 10px;border-right: 0;">
		                    <input type='button' value='검색' onclick="search_click(1)" style="border: 1.5px solid black; margin:0 -3px; font-size: 15px; padding: 3px 9px;cursor: pointer;">
		                </div>
		            </li>
	            </ul>
	    	</div>
	    	
<script type="text/javascript">
function search_click(page){
	get_notice_div(page,$('#selSearchOption').val(),$('#txtKeyWord').val());
}

</script>	    	


</body>

</html>

























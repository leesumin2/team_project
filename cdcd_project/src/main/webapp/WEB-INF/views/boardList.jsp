<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="loginOutlink" value="${sessionScope.id==null? '/login/login':'/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null? 'Login':'Logout'}"/>
<html>
<head>
	
	<meta charset="UTF-8">
    <title>greenart</title>
   
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<link link href="../resources/css/web.css" rel="stylesheet" />
	<style>
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
	
		* { 
		    margin : 0;
		    padding: 0;
		    
		}
		#header{
			background-color:red;
			position: relative;
		}
		.content{
			position: relative;
		}
		h1{
			padding: 20px;
			text-align: center;
		    font-family: 'SUIT-Regular';
		}
		a{
			color:#649b5f;
			text-decoration:none;
		}

		.nav{
			color:white;
		}
		.nav-item{
			line-height:20px;
		}
		#writeBtn{
			margin-bottom:10px;
			margin-top:10px;
			float:right;
			width: 80px;
            height: 30px;
            border: 0px;
            border-radius: 5px;
            font-size: 16px;
            background-color: #f0dbc8;
			
		}
		.nav{
			margin-top:5px;
		}
		.contatiner{
			width:1000px;
			margin-right:auto;
			margin-left:auto;
		    font-family: 'SUIT-Regular';
			
		}
		#pagination{
			position:fiexed;
		}
		.row, .regdate{
			width:100px;
			text-align:center;
		}
		.row_ask_title{
			text-align:center;
			width:400px;
		}
		.search-container{
			width:800px;
			margin:auto;
			display:flex;
			justify-content:center;
			align-items: center;
			margin-top:20px;
		    font-family: 'SUIT-Regular';
		}
		.ask_comentcnt{
			color: #050099
		}
		#searchbtn{
			width: 100px;
            height: 40px;
            border: 0px;
            border-radius: 5px;
            font-size: 16px;
            background-color: #f0dbc8;
		}
		.search-option{
			width:100px;
			height: 40px;
		}
		.search-input{
			width:400px;
			height: 40px;
		}
		.dropdown.dropdown{
			position:unset;
		}
		#sort {
			margin: auto;
			margin-top: 15px;
			margin-right: 15px;
			float:right;
		    font-family: 'SUIT-Regular';
		}
		#thb:hover{
			background-color: white;
		}
	</style>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
</head>
<body>
<%@ include file="header.jsp" %>
		
<script>
	//let msg ="${param.msg}";
	let msg = "${msg}"
	if(msg =="del" ) alert ("성공적으로 삭제되었습니다.");
	if(msg=="error") alert("삭제를 실패했습니다.");
	
	if(msg=="modify_ok") alert("성공적으로 수정되었습니다.");
	if(msg=="write_ok") alert("성공적으로 등록되었습니다.");
	
	
</script>
<div class="content">
  <div class="board-container">
  	<h1>게시판</h1>
    <div class="search-container">
      <form action="<c:url value="/board/list"/>" class="search-form" method="get">
		<select class="search-option" name="option">
          <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
          <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
          <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
        </select>
        <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
        <input type="submit" class="btn-default" id="searchbtn" value="검색">
        
        
      </form>
    </div>
    
    </div>
    
    
<div class="contatiner">
		

	<button class="btn-default" type="button" id="writeBtn" onclick="location.href='<c:url value="/board/write"/>'">글쓰기</button>
	<select name="sort" id="sort" >
			<option value="A" ${param.mode==0? 'selected="selected"': ''}>최신순</option>
			<option value="B" ${param.mode==1? 'selected="selected"': ''}>조회수순</option>
			<option value="C" ${param.mode==2? 'selected="selected"': ''}>댓글수순</option>
		</select>
    <br>
    <table class="table table-hover">
        <tr id="thb">
        	<th class="row">작성자</th>
            <th class="row">제목</th>
            <th class="row">등록일</th>
            <th class="row">조회수</th>
            <th class="row">댓글수</th>
        </tr>
        <c:forEach var="board" items="${list }">
	        <tr>
	        	<td class="row" style='${board.mem_id == "admin" ? "color:red;" : "color:black;" }'>
	        	<c:if test="${board.mem_id == 'admin'}">
	        	[공지]${board.mem_id}
	        	</c:if>
	        	<c:if test="${board.mem_id != 'admin'}">
	        	${board.mem_id}
	        	</c:if>
	        	</td>
	            <td class="row_ask_title"><a href="<c:url value='/board/read${ph.sc.queryString }&ask_id=${board.ask_id}'/>">${board.ask_title}<span class="ask_comentcnt"></span> </a></td>
	            
		         <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="ask_date" value="${board.ask_date}" pattern="yyyy-MM-dd"/>
		         <c:choose>	
		            <c:when test="${ today<=ask_date}">
		              <td class="regdate"><fmt:formatDate value="${board.ask_date}" pattern="HH:mm" type="time"/></td>
		            </c:when>
		            <c:otherwise>
		              <td class="regdate"><fmt:formatDate value="${board.ask_date}" pattern="yyyy-MM-dd" type="date"/></td>
		            </c:otherwise>
		          </c:choose>
	            
	            <td class="row">${board.ask_viewpoint}</td>
	            <td class="row">${board.ask_comentcnt}</td>
	        </tr>
	    </c:forEach> 
   		</table>
	        <br>
	        
	        <div class="text-center">
	        	<ul class="pagination" id="pagination">
	        	<c:if test="${ph.showPrev }">
	        			<li ><a href ="<c:url value='/board/list${ph.sc.getQueryString(ph.beginPage-1) }&mode=${param.mode}'/>">&laquo;</a></li>
	        	</c:if>
	        	<c:forEach var="i" begin="${ph.beginPage }"  end="${ph.endPage }">
	        		<li class='${ph.sc.page== i ? "active": ""}'>
	        		<a href ="<c:url value='/board/list${ph.sc.getQueryString(i) }&mode=${param.mode}'/>">${i }</a>
	        		</li> 
	        	</c:forEach>
	        	<c:if test="${ph.showNext }">
	        			<li><a href ="<c:url value='/board/list${ph.sc.getQueryString(ph.endPage+1) }&mode=${param.mode}'/>">&raquo;</a></li>
	        	</c:if>
	        	</ul>
	        </div>

</div>
</div>
	<script type="text/javascript">
		
		$(document).ready(function(){
			$("#sort").change(function() {
				if(window.location.search=="" || "${param.keyword}"==""){
					if(this.value=='A')
					{
						window.location="/cdcd/board/list?mode=0"; 
					}
					else if(this.value=='B')
					{
						window.location="/cdcd/board/list?mode=1"; 
					}
					else if(this.value=='C')
					{
						window.location="/cdcd/board/list?mode=2"; 
					}
				}
				
				else if("${param.keyword}"!=""){
					if(this.value=='A')
					{
						let str=window.location.href;
						if(window.location.href.includes('mode=0')){
							str=str.replace("mode=0","mode=0");
							window.location=str;
						}
						else if(window.location.href.includes('mode=1')){
							str=str.replace("mode=1","mode=0");
							window.location=str;
						}
						else if(window.location.href.includes('mode=2')){
							str=str.replace("mode=2","mode=0");
							window.location=str;
						}
						else if(window.location.href.includes('mode=')){
							str=str.replace("mode=","mode=0");
						}
						else{
							str=str+"&mode=0"
							window.location=str;
						}
						
					}
					if(this.value=='B')
					{
						let str=window.location.href;
						if(window.location.href.includes('mode=0')){
							str=str.replace("mode=0","mode=1");
							window.location=str;
						}
						else if(window.location.href.includes('mode=1')){
							str=str.replace("mode=1","mode=1");
							window.location=str;
						}
						else if(window.location.href.includes('mode=2')){
							str=str.replace("mode=2","mode=1");
							window.location=str;
						}
						else if(window.location.href.includes('mode=')){
							str=str.replace("mode=","mode=1");
						}
						else{
							str=str+"&mode=1"
							window.location=str;
						}
					}
					if(this.value=='C')
					{
						let str=window.location.href;
						if(window.location.href.includes('mode=0')){
							str=str.replace("mode=0","mode=2");
							window.location=str;
						}
						else if(window.location.href.includes('mode=1')){
							str=str.replace("mode=1","mode=2");
							window.location=str;
						}
						else if(window.location.href.includes('mode=2')){
							str=str.replace("mode=2","mode=2");
							window.location=str;
						}
						else if(window.location.href.includes('mode=')){
							str=str.replace("mode=","mode=2");
						}
						else{
							str=str+"&mode=2"
							window.location=str;
						}
					}
				}
				
				
				

	
			});
		});
	</script>
</body>
</html>


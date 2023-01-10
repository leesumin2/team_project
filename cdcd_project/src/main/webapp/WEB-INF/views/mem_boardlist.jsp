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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
	
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
		    font-family: 'SUIT-Regular';
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
		    font-family: 'SUIT-Regular';
			
		}
		.nav{
			margin-top:5px;
		}
		.contatiner{
			width:1050px;
			margin-right:auto;
			margin-left:auto;
		    font-family: 'SUIT-Regular';
			overflow-y : auto;
			height:700px;
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
		.sort_box {
			width: 1050px;
			margin: auto;
			padding-bottom: 10px;
			display: flex;
			justify-content: end;
		    font-family: 'SUIT-Regular';
            
		}

		.contatiner::-webkit-scrollbar {
			width: 10px;
		}
		.contatiner::-webkit-scrollbar-thumb {
			    	background-color: #CC723D;
			    	border-radius: 5px;
			    	background-clip: padding-box;
			    	border: 1.5px solid transparent;
		}
		.contatiner::-webkit-scrollbar-track {
			    	background-color:#f0dbc8;
			    	border-radius: 5px;
			    	box-shadow: inset 0px 0px 5px white;
		}
		#thb:hover{
			background-color: white;
		}
		#thb:hover{
			background-color: white;
		}
		#nolist{
		display:flex;
		justify-content:center;
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
  	<h1>작성 게시글 목록</h1>
  	<c:if test="${not empty list}">
	  	<div class="sort_box">
			<select name="sort" id="sort" >
				<option value="A" ${param.mode==0? 'selected="selected"': ''}>최신순</option>
				<option value="B" ${param.mode==1? 'selected="selected"': ''}>조회수순</option>
				<option value="C" ${param.mode==2? 'selected="selected"': ''}>댓글수순</option>
			</select>
		</div>
	    </div>
	    
	    
		<div class="contatiner">
		<div class="table-content">	
		
		    <table class="table table-hover">
		        <tr id="thb">
		        	<th class="row">작성자</th>
		            <th class="row">제목</th>
		            <th class="row">등록일</th>
		            <th class="row">조회수</th>
		            <th class="row">댓글수</th>
		            <th class="row">이동</th>
		        </tr>
		        <c:if test='${sessionScope.id=="admin"}' >
		        	<c:forEach var="board" items="${list }">
			        	<c:if test='${board.mem_id==mem_id}' >
			        		  <tr>
					        	<td class="row">${board.mem_id}</td>
					            <td class="row_ask_title">${board.ask_title}</td>
					            
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
					            <td class="row"><a href="<c:url value='/board/read${ph.sc.queryString }&ask_id=${board.ask_id}'/>"><button type="button" class="btn btn-default">이동</button><span class="ask_comentcnt"></span> </a></td>
				        	</tr>
			        		
			        	</c:if>
			    	</c:forEach> 
			    	
		        
		        </c:if>
		        <c:if test='${sessionScope.id!="admin"}' >
		        	<c:forEach var="board" items="${list }">
			        	<c:if test='${board.mem_id==sessionScope.id}' >
			        		  <tr>
					        	<td class="row">${board.mem_id}</td>
					            <td class="row_ask_title">${board.ask_title}</td>
					            
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
					            <td class="row"><a href="<c:url value='/board/read${ph.sc.queryString }&ask_id=${board.ask_id}'/>"><button type="button" class="btn btn-default">이동</button><span class="ask_comentcnt"></span> </a></td>
				        	</tr>
			        		
			        	</c:if>
			    	</c:forEach> 
		
		        </c:if>
	        
	   		</table>
   		</c:if>
   		<c:if test="${empty list}">
        			<br><span id="nolist">등록된 게시글이 없습니다.<i class="fa-regular fa-note-sticky"></i></span>
        </c:if>
   		</div>
	        
	        

</div>
</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#sort").change(function() {

				if ("${sessionScope.id}" != "admin") {
					if(this.value=='A')
					{
						window.location="/cdcd/board/memlist?mode=0"; 
					}
					else if(this.value=='B')
					{
						window.location="/cdcd/board/memlist?mode=1"; 
					}
					else if(this.value=='C')
					{
						window.location="/cdcd/board/memlist?mode=2"; 
					}
				}
				if ("${sessionScope.id}" == "admin") {
					if(this.value=='A')
					{
						window.location="/cdcd/board/memlist?mode=0&mem_id=${mem_id}"; 
					}
					else if(this.value=='B')
					{
						window.location="/cdcd/board/memlist?mode=1&mem_id=${mem_id}"; 
					}
					else if(this.value=='C')
					{
						window.location="/cdcd/board/memlist?mode=2&mem_id=${mem_id}"; 
					}
				}
				

	
			});
		});
		
	</script>
	<script >
		
	</script>
</body>
</html>


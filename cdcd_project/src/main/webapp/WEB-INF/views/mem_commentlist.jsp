<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="loginOutlink"
	value="${sessionScope.id==null? '/login/login':'/login/logout'}" />
<c:set var="loginOut" value="${sessionScope.id==null? 'Login':'Logout'}" />
<html>
<head>

<meta charset="UTF-8">
<title>greenart</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
<link link href="resources/css/web.css" rel="stylesheet" />
<style>
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
	;

* {
	margin: 0;
	padding: 0;
}

.content {
	position: relative;
}

h1 {
	padding: 20px;
	text-align: center;
		    font-family: 'SUIT-Regular';
}

a {
	color: #649b5f;
	text-decoration: none;
}

.nav {
	color: white;
}

.nav-item {
	line-height: 20px;
}

#writeBtn {
	margin-bottom: 10px;
	margin-top: 10px;
	float: right;
	width: 80px;
	height: 30px;
	border: 0px;
	border-radius: 5px;
	font-size: 16px;
	background-color: #f0dbc8;
}

.nav {
	margin-top: 5px;
}

.contatiner {
	width: 1000px;
	height: 700px;
	margin-right: auto;
	margin-left: auto;
		    font-family: 'SUIT-Regular';
	overflow-y: auto;
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
	background-color: #f0dbc8;
	border-radius: 5px;
	box-shadow: inset 0px 0px 5px white;
}

#pagination {
	position: fiexed;
}

.row, .regdate {
	width: 100px;
	text-align: center;
}

.row_ask_title {
	text-align: center;
	width: 400px;
}

.ask_comentcnt {
	color: #050099
}

#searchbtn {
	width: 100px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	font-size: 16px;
	background-color: #f0dbc8;
}

.dropdown.dropdown {
	position: unset;
}
#thb:hover{
	background-color: white;
}
#nolist{
		display:flex;
		justify-content:center;
		
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

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
			<h1>작성 댓글 목록</h1>

		</div>
		<c:if test="${not empty clist}">

			<div class="contatiner">
	
				<table class="table table-hover">
					<tr id="thb">
						<th class="row">작성자</th>
						<th class="row">내용</th>
						<th class="row">작성날짜</th>
						<th class="row">수정날짜</th>
						<th class="row">이동</th>
	
					</tr>
					<c:if test="${clist==null}">
	        			등록된 댓글이 없습니다.<i class="fa-regular fa-note-sticky"></i>
	        		</c:if>
					<c:forEach var="cmt" items="${clist}">
						<tr>
							<td class="row">${cmt.mem_id}</td>
							<td class="row_ask_title">${cmt.a_coment_content}</td>
	
							<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
							<fmt:formatDate var="ask_date" value="${cmt.a_coment_date}"
								pattern="yyyy-MM-dd" />
							<c:choose>
								<c:when test="${ today<=ask_date}">
									<td class="regdate"><fmt:formatDate
											value="${cmt.a_coment_date}" pattern="HH:mm" type="time" /></td>
								</c:when>
								<c:otherwise>
									<td class="regdate"><fmt:formatDate
											value="${cmt.a_coment_date}" pattern="yyyy-MM-dd" type="date" /></td>
								</c:otherwise>
							</c:choose>
							<fmt:formatDate var="ask_update" value="${cmt.a_comment_update}"
								pattern="yyyy-MM-dd" />
							<c:choose>
								<c:when test="${ today<=ask_update}">
									<td class="regdate"><fmt:formatDate
											value="${cmt.a_comment_update}" pattern="HH:mm" type="time" /></td>
								</c:when>
								<c:otherwise>
									<td class="regdate"><fmt:formatDate
											value="${cmt.a_comment_update}" pattern="yyyy-MM-dd"
											type="date" /></td>
								</c:otherwise>
							</c:choose>
							<td class="row"><a
								href="<c:url value='/board/read?ask_id=${cmt.ask_id}'/>"><button
										type="button" class="btn btn-default">이동</button>
									<span class="ask_comentcnt"></span> </a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${empty clist}">
        			<br><span id="nolist">등록된 게시글이 없습니다.<i class="fa-regular fa-note-sticky"></i></span>
        	</c:if>
			<br>

		</div>
	</div>
</body>
</html>


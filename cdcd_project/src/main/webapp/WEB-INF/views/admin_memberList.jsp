<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../resources/css/web.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<title>회원목록 페이지</title>
<style>
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}

#container h1 {
	margin-top: 20px;
		    font-family: 'SUIT-Regular';
	text-align: center;
}

#container #content {
	width: 800px;
	margin: 50px auto 0 auto;
	display: grid;
	grid-template-columns: 250px 250px 1fr;
	grid-template-rows: 1fr 1fr 1fr;
	grid-gap: 20px 30px;
}

.items img {
	width: 250px;
	height: 200px;
}

.items {
	width: 250px;
	text-align: center;
}

.items:first-of-type {
	margin-bottom: 50px;
}


.table-content{
	width:900px;
	height:700px;
	margin:0 auto;
	overflow: auto;
	padding-right: 10px;
}
.table-content::-webkit-scrollbar {
	width: 10px;
}
.table-content::-webkit-scrollbar-thumb {
	    	background-color: #CC723D;
	    	border-radius: 5px;
	    	background-clip: padding-box;
	    	border: 1.5px solid transparent;
}
.table-content::-webkit-scrollbar-track {
	    	background-color:#f0dbc8;
	    	border-radius: 5px;
	    	box-shadow: inset 0px 0px 5px white;
}
table {
  border-collapse: collapse;
  width: 100%;
		    font-family: 'SUIT-Regular';
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
th {
	text-align: center;
}

table th,
table td{
	border-left:none;
	border-right:none;
}

.list:hover{
background-color:#F6F6F6;
}
td:nth-last-child(-n+5){
	text-align:center;

}
.btn{
	padding: 2px 5px;
		    font-family: 'SUIT-Regular';
}
.dropdown.dropdown{
position:unset;
}
</style>

</head>

<body>
	<div id="container">
<%@ include file="header.jsp" %>
		<h1>회원 목록</h1>

		<div id="content">
			<div class="table-content">
				<table class="table">
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이메일</th>
						<th>휴대전화</th>
						<th>작성글</th>
						<th>리뷰</th>
						<th>댓글</th>
						<th>삭제</th>
					</tr>
					<c:forEach var="member" items="${memList }">
						<tr class="list">
							<td>${member.mem_id}</td>
							<td>${member.mem_pwd}</td>
							<td>${member.mem_email}</td>
							<td>${member.mem_phone}</td>
							<td><input type="button" id="" class="btn btn-default boardBtn" data-mno="${member.mem_id}" value="보기"></td>
							<td><input type="button" id="" class="btn btn-default reviewBtn" data-mno="${member.mem_id}" value="보기" ></td>
							<td><input type="button" id="" class="btn btn-default commentBtn"data-mno="${member.mem_id}" value="보기" ></td>
							<td><input type="button" id="" class="btn btn-default removeBtn" data-mno="${member.mem_id}" value="삭제"></td>

						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
<script>
	let msg = "${msg}";
	if(msg=='memDel'){
	    alert("삭제가 완료되었습니다.")
	    window.location.reload(); 
	}else if(msg=='error'){
	    alert("삭제를 실패하였습니다.");
	    window.location.reload();
	}
	
	//추가
	<!-- 게시글 보기 -->
	$(".boardBtn").click(function(){
		   var mem_id = $(this).attr('data-mno');
		   if(!confirm("해당 회원 게시글을 보겠습니까??")) return;
		   window.location="<c:url value='/board/memlist'/>?mem_id="+mem_id;
	});
	<!-- 댓글 보기 -->
	$(".commentBtn").click(function(){
		   var mem_id = $(this).attr('data-mno');
		   if(!confirm("해당 회원 댓글을 보겠습니까??")) return;
		   window.location="<c:url value='/readlist'/>?mem_id="+mem_id;
	});
	//추가 끝
	
	<!-- 리뷰 보기 -->
	$(".reviewBtn").click(function(){
	   var mem_id = $(this).attr('data-mno');
	   if(!confirm("해당 회원 리뷰를 확인하시겠습니까?")) return;
	   window.location="<c:url value='/reviewList'/>?mem_id="+mem_id;
	});

	<!-- 회원 삭제 -->
	$(".removeBtn").click(function(){
	   var mem_id = $(this).attr('data-mno');
	   if(!confirm("삭제하시겠습니까?")) return;
	   window.location="<c:url value='/admin/remove'/>?mem_id="+mem_id;
	});

</script>
</html>
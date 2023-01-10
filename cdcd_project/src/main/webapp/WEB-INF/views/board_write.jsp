
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="loginOutlink" value="${sessionScope.id==null? '/login/login':'/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null? 'Login':'Logout'}"/>
<html>
<head>
	<meta charset="UTF-8">
    <title>greenart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>  
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link link href="../resources/css/web.css" rel="stylesheet" />
	<style>
		* { 
	    box-sizing: border-box; 
	    margin : 0;
	    padding: 0;
	}
	
	a { text-decoration: none;  }
	
	ul {
	    list-style-type: none;
	    height: 48px;
	    width: 100%;
	    background-color: #93CC8D;
	    display: flex;
	}
	
	ul > li {
	    color: lightgray;
	    height : 100%;
	    width:90px;
	    display:flex;
	    align-items: center;
	}
	
	ul > li > a {
	    color:white;
	    margin:auto;
	    padding: 10px;
	    font-size:20px;
	    align-items: center;
	}
	
	ul > li > a:hover {
	    color :lightgray;
	    border-bottom: 3px solid rgb(209, 209, 209);
	    text-decoration:none;
	}
	
	button{
		text-decoration:none;
	}
	#logo {
		color:white;
	    font-size: 18px;
	    padding-left:40px; 
	    margin-right:auto;
	    display: flex;
	}
	table {
		margin : 20px;
		width:800px;
		border: 1px solid #444444;
		border-collapse: collapse;
	    margin-left:auto; 
	    margin-right:auto;
	}
	
	th, td {
		border: 1px solid #444444;
	}

	#ask_content, #ask_title{
		width:800px;
		margin:auto;
	}

	.btn_m{
		display:flex;
		justify-content: center;
	}
	.btn{
		margin:10px;
	}
	.form-control[disabled], .form-control[readonly]{
		cursor:auto;
		background-color:white;
		border:1px solid lightgray;
	}
	textarea{
		resize:none;
	}
	
	#header2{
		display:flex;
		justify-content:space-between;
		flex-direction:row;
		border-bottom:solid 1px gray;
		width:800px;
		margin-right:auto;
		margin-left:auto;
		margin-bottom:20px;
	}
	#con{
		width:800px;
		display:flex;
		flex-direction:column;
		margin-right:auto;
		margin-left:auto;
	}
	.txt{
		margin-bottom:20px;
		margin-top:20px;
	}
	

	</style>
</head>
<body>
<%@ include file="header.jsp" %>

<script>
	let msg = "${msg}"
	if(msg=="write_error"){
		alert("게시글 작성에 실패했습니다. 다시 작성해주세요");
	}
	if(msg=="modify_error") alert("수정에 실패했습니다.");
	
</script>
	<div id="header2">
		<h2 id="mode"><div>게시판<div> ${mode=="new"? "글쓰기": "글읽기"}</h2>
	     <button class="btn btn-default" type="button" id="writeBtn" class="btn" >등록</button>
	</div>
	
	<div id="con">
	<form action=""  id="form" >
        <input type="hidden" name="ask_id"  value="${boardDto.ask_id }">
        <label for="ask_title" class="txt" >제목</label>
        <input class="form-control" type="text" name="ask_title" id="ask_title" value="${boardDto.ask_title }" ${mode=="new"? '': 'readonly="readonly"'}>
        <div class="mb-3">
        <label for="ask_content " class="txt">내용</label>
       	 <textarea class="form-control" name="ask_content" id="ask_content" cols="30" rows="10" ${mode=="new"? '': 'readonly="readonly"'}>${boardDto.ask_content } </textarea>
         </div>
    </form>
	</div>
    
    
	<script>
		
		if("${m}"=="renew"){
			modi();
		}	
		document.getElementById('writeBtn').addEventListener('click',e=>{
			
			 var form = document.getElementById('form');
			 form.action="<c:url value='/board/write'/>"; // 가장 최근에 작성한 글이므로 1페이지에 보이게 되므로 따로 페이지값 지정 x
			 form.method="post";
			 form.submit();
			 
	    });		
		function modi(){
			 // 1. 읽기 상태이면 수정 상태로 변경
		     let form = document.getElementById('form'); // 폼
			 let ask_title = document.getElementById('ask_title'); // 글 제목
			 let ask_content = document.getElementById('ask_content'); // 내용
			 let mode = document.getElementById('mode'); // 게시판 제목
			 let isReadOnly = ask_title.readOnly;
			 console.log(isReadOnly)
			 if(isReadOnly){
				 ask_title.readOnly= false; // 제목
				 ask_content.readOnly= false; // 내용
				 document.getElementById('modifyBtn').innerText="등록";
				 mode.innerText = "글 수정";
				 // 전송되지 않도록 
				 return;
			 }
			 // 2. 수정 상태이면 수정된 내용을 서버로 전송
			 form.action="<c:url value='/board/modify'/>?page=${page}&pageSize=${pageSize}"; 
			 form.method="post";
			 form.submit();
				 
		   
		}
		
		
	</script>

</body>

</html>


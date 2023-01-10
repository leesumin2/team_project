<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<link link href="../resources/css/web.css" rel="stylesheet"/> 	
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  	<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
    <style>

		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
        form {
            width: 400px;
            height: 500px;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: absolute;
            top: 450px;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 1px solid #eee;
            border-radius: 10px;
            box-shadow: 2px 3px 3px #eee;
        }
        form #login_logo {
            width:200px;
        }
        form div a{
            text-decoration: none;
            color:black;
		    font-family: 'SUIT-Regular';
        }
        .findSignUp {
        	display: flex;
        	justify-content: space-between;
        	width: 280px;
            margin: 30px 0 0;
        }
        input[type='text'],
        input[type='password'] {
            width: 300px;
            height: 40px;
            border: 1px solid #ccc;
            border-radius: 3px;
            padding: 0 10px;
            margin-bottom: 10px;
		    font-family: 'SUIT-Regular';
        }

        button {
            background-color: rgb(240, 219, 200);
            width: 322px;
            height: 50px;
            font-size: 17px;
            border: none;
            border-radius: 5px;
            margin: 20px 0 30px 0;
		    font-family: 'SUIT-Regular';
        }

        #title {
		    font-family: 'SUIT-Regular';
            text-align: center;
            color: #666;
            margin: 50px 0 20px;
            letter-spacing: 5px;
        }

        #msg {
            height: 30px;
            text-align: center;
            font-size: 16px;
            color: red;
            margin-bottom: 20px;
		    font-family: 'SUIT-Regular';
        }

    </style>
</head>

<body>
    <!-- true : 전송 -->
    <div id="container">
    
    
	<%@ include file="header.jsp" %>
    
        <div id="content">
        <form action="<c:url value='/Home/login'/>" method="post" onsubmit="return formCheck(this);">
            <h1 id="title">로그인</h1>
            <div id="msg">
			<c:if test="${not empty param.msg}">
				<i class="fa fa-exclamation-circle">${URLDecoder.decode(param.msg)}</i>
			</c:if>
		</div>
            <input type="text" name="id" placeholder="아이디 입력" autofocus required ><!-- value="${cookie.id.value}" -->
            <br>
            <input type="password" name="pwd" placeholder="비밀번호" required>
            <input type="hidden" name="toURL" value="${param.toURL }">
            <button>로그인</button>
            <div class="findSignUp">
                <a href="<c:url value='/Home/find'/>" class="logout">아이디 | 비밀번호 찾기</a>
                <a href="<c:url value='/signUp'/>">회원가입</a>
            </div>
        </form>
    	</div>
    </div>
    <script>	
		function formCheck(frm){
			let msg='';
			if(frm.id.value.length==0){
				setMessage('id를 입력해주세요.',frm.id);
				return false;
			}
			if(frm.pwd.value.length==0){
				setMessage('password를 입력해주세요.',frm.pwd);
				return false;
			}
			return true;
		}
		function setMessage(msg, element){
			document.getElementById("msg").innerHTML=`${'${msg}'}`;  
			if(element){
				element.select(); 
			}
		}

		
	</script>
	
</body>

</html>
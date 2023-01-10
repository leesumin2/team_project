<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<link link href="../resources/css/web.css" rel="stylesheet"/> 	
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <title>아이디, 비밀번호 찾기</title>
    <style>
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
    
        * {
            box-sizing: border-box;
        }
        body,html{min-width:1500px;}

        #container {
            width: 100%;
            display: block;
        }
		.sessionBox {
            display: flex;
			justify-content: space-between;
			width: 900px;
			margin: auto;
            
		}
        #container #content .section {
            width: 400px;
            height: 500px;
            align-items: center;
            border: 1px solid #eee;
            border-radius: 10px;
            box-shadow: 2px 3px 3px #eee;
            padding: 20px;
            
        }
        h1{
		    font-family: 'SUIT-Regular';
            text-align: center;
            color: #666;
            margin: 20px 0 20px;
            letter-spacing: 5px;
        }
        #section2 h1{
            margin-bottom: 20px;
        }
        label{
		    font-family: 'SUIT-Regular';
            display: block;
            width: 300px;
            float: left;
            margin: 0 40px ;
        }
        input {
            width: 300px;
            height: 40px;
            border: 1px solid #ccc;
            border-radius: 3px;
            padding: 0 10px;
            margin-bottom: 10px;
		    font-family: 'SUIT-Regular';
            margin: 0 30px 20px ;
        }
        select {
            width: 50px;
            height: 40px;
            border: 1px solid #ccc;
            border-radius: 3px;
		    font-family: 'SUIT-Regular';
            text-align: center;
            margin-left: 30px; 
        }
        .pho{
            width: 250px;
            margin: 0;
        }
        button{
            background-color: rgb(240, 219, 200);
            width: 300px;
            height: 50px;
            font-size: 17px;
            border: none;
            border-radius: 5px;
		    font-family: 'SUIT-Regular';
            margin-left: 30px; 
        }
        #msg{
        	color: red;
    		margin: 50px auto;
        	font-size: 20px;
        	width: 900px;
        	height: 30px;
		    font-family: 'SUIT-Regular';
		    text-align: center;
        }
       
    </style>

</head>

<body>
    <div id="container">
<%@ include file="header.jsp" %>

        <div id="content">
	        <div id="msg">
				<c:if test="${not empty param.msg}">
					<i class="fa fa-exclamation-circle">${URLDecoder.decode(param.msg)}</i>
				</c:if> 
			</div>
			<div class="sessionBox">
				<form action="<c:url value='/Home/find'/>" method="post" onsubmit="return idCheck(this);" id="section1" class="section">
	                <h1>아이디 찾기</h1><br><br>
	                <label for="email1">이메일</label>
	                <input type="email" name="email1" id="email1" size= 32><br><br>
			        <label for="frontnum1">휴대전화</label>
	                <select id="frontnum1" name="frontnum1">
	                <option value="010" selected>010</option>
	                <option value="011">011</option>
	                <option value="016">016</option>
	                <option value="017">017</option>
	                </select>
	                <input class="pho" type=text name="phone1" id="phone1" placeholder="' - ' 없이 기입" size= 24><br><br><br><br><br>
	                <button type="submit" >아이디 찾기</button>
	            </form>
				<form action="<c:url value='/Home/find'/>" method="post" onsubmit="return pwCheck(this);" id="section2" name="section2" class="section">
	                <h1>비밀번호 찾기</h1><br>
	                <label for="id2">아이디</label>
	                <input type="text" name="id2" id="id2" size= 32>

	                <label for="email2">이메일</label>
	                <input type="email" name="email2" id="email2" size= 32>
			        <label for="phone2">휴대전화</label>
	                <select id="frontnum2" name="frontnum2">
	                <option value="010" selected>010</option>
	                <option value="011">011</option>
	                <option value="016">016</option>
	                <option value="017">017</option>
	                </select>
	                <input class="pho" type=text name="phone2" id="phone2" placeholder="-없이 기입" size= 24><br><br><br>
	                <button type="submit" >비밀번호 찾기</button>
	            </form>
	        </div>
		</div>
    </div>
    <script>	
		function idCheck(frm){
			let msg='';
			if(frm.email1.value.length==0){
				setMessage('email 정보를 입력하세요.',frm.email1);
				return false;
			}
			if(frm.phone1.value.length==0){
				setMessage('전화번호 정보를 입력하세요.',frm.phone1);
				return false;
			}
			return true;
		}
		function setMessage(msg, element){
			alert(msg);
			//document.getElementById("msg").innerHTML=`${'${msg}'}`;  
			if(element){
				element.select(); 
			}
		} 
		
		
		function pwCheck(frm){
			let msg='';
			if(frm.id2.value.length==0){
				setMessage('아이디 정보를 입력하세요.',frm.email1);
				return false;
			}
			if(frm.email2.value.length==0){
				setMessage('email 정보를 입력하세요.',frm.email1);
				return false;
			}
			if(frm.phone2.value.length==0){
				setMessage('전화번호 정보를 입력하세요.',frm.phone1);
				return false;
			}
			return true;
		}
		
		
	</script>
</body>
</html>
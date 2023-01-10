<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link href="resources/css/web.css" rel="stylesheet" />
<head>
<meta charset="EUC-KR">
<title>회원가입 성공</title>
	<style>
	   
       @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');

	    #welcome h1 {
	    	text-align: center;
            font-family: 'Gowun Dodum', sans-serif;	   
            margin: 50px; 	
	    }
	    
        #welcome {
            text-align: center;
            margin: 20px;
            color: #a38c77
        }
        button[type="button"]  {
            width: 200px;
            height: 40px;
            background-color: #f0dbc8;
            border: 0px;
            border-radius: 5px;
            font-size: 16px;
            font-family: 'Gowun Dodum', sans-serif;
        }
        a {
            text-decoration: none;
            color: black;
        }
</style>    
        
</head>
<body>
	<div id="container">
<%@ include file="header.jsp" %>
        <div id="welcome">
			<h1>회원가입이 완료되었습니다.<br> 환영합니다!</h1>
			<button type="button" id="btn"><a href="<c:url value='/Home/login'/>">로그인</a></button>
		</div>
	</div>
</body>
</html>
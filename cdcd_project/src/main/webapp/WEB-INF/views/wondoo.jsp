<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="${pageContext.request.contextPath}/resources/css/web.css" rel="stylesheet"/> 	
    <meta charset="UTF-8">
    <title>원두 소개</title>
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
		    font-family: 'SUIT-Regular';
		    position: relative;
        }

        
        #container #content {
            padding: 30px;
            width:70%;
            background: rgba(255, 255, 255, 0.8);
		    position: relative;
		    top: 50%;
		    width: 100%;
		    transform: translate(0, -50%);  
        }
        
        .title {
        	margin: 20px;
        }
        #main {
        	height: 900px;
        }
		.mainImg {
            width: 100%;
            position: absolute;
		}
		.mainImg>img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        #coffee_beans_img img{
            width: 120px;
            height: 150px;
            margin-left: 44%;
        }
        #coffee_beans_img{
            border-bottom:3px solid rgb(240, 219, 200);
            
        }
        #coffee_beans_name{
            text-align: center;
        }

        #coffee_beans_info{
            padding: 50px;
            line-height: 2em;
    		font-size: 20px;
        }
        h1, h2{
            text-align: center;
            padding: 10px;
        }

    </style>
</head>

<body>
    <div id="container">
		<%@ include file="header.jsp" %>


        <div id="main">
       		<div class="mainImg">
        		<img src="../resources/img/coffeebean/coffee-g42023582f_1920.jpg">
        	</div>
            <div id="content">	
				<div class="title">
			        <h2>이달의 원두</h2>
			        <h1>" ${wd.coffeebean_name} "</h1>
			    </div>
		        
	            <div id="coffee_beans_info">
	                <b><p>
	                    ${wd.coffeebean_info}
	                </p>
	                <br>
	                <p>
	                주요 생산국 <br>
					브라질, 콜롬비아, 멕시코, 과테말라 케냐, 에티오피아, 탄자니아, 하와이, 코스타리카
	                </p></b>
	          </div>
	      </div>
      </div>

    </div>
</body>

</html>
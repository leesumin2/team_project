<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link link href="resources/css/web.css" rel="stylesheet" />
    <title>즐겨찾기 페이지</title>
    
    <style>
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
    

        #container h1{
            margin-top:20px;
		    font-family: 'SUIT-Regular';
        }
        #container #content{
            width: 800px;
            margin: 100px auto 0 auto;
            display: grid;
            grid-template-columns: 250px 250px 1fr;
            grid-template-rows: 1fr 1fr 1fr;
            grid-gap: 20px 30px;

        }
        .items img{
            width: 250px;
            height: 200px;
        }
        .items{
            width: 250px;
            text-align: center;
        }
        .items:first-of-type{
            margin-bottom: 50px;
        }


        h1{
            text-align: center;
        }
        
    </style>

</head>

<body>
    <div id="container">
        <div id="header">
			<ul>
				<li><a href="<c:url value='/'/>"><img src="resources/img/mainImage.png"></a></li>
				<li></li>
				<li class="menu"><a href="<c:url value='/Home/wondoo'/>">원두 소개</a></li>
				<li class="menu"><a href="<c:url value='/Home/dessert'/>">추천 디저트</a></li>
				<li class="menu"><a href="#">게시판</a></li>
				<li></li>
				<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">마이페이지</a>
					<div id="dropdown-stateLogin" class="dropdown-content">
						<a href="<c:url value='/Home/logout'/>" class="stateLogin">로그아웃</a>
						<a href="<c:url value='/Home/update'/>" class="stateLogin">정보수정</a> 
						<a href="<c:url value='/bookmark'/>" class="stateLogin">즐겨찾기</a>
						<a href="#" class="stateLogin">작성글보기</a>
						<a href="#" class="stateLogin">문의</a>
					</div>
					<div id="dropdown-stateLogout" class="dropdown-content">
						<a href="<c:url value='/Home/login'/>" class="stateLogout">로그인</a>
						<a href="<c:url value='/signUp'/>" class="stateLogout">회원가입</a>
					</div>
				</li>
			</ul>
		</div>
        <h1>회원 목록</h1>
        
		<div id="content">
        
    	</div>
</body>
<script>

	let stateLogin = document.getElementById("dropdown-stateLogin");
	let stateLogout = document.getElementById("dropdown-stateLogout");
	console.log(stateLogin);
	console.log(stateLogout);
	var margin_value = 0;
	if ("${sessionScope.id}" != "") {
		console.log("****************************");
		stateLogin.style.display = "display";
		stateLogout.style.display = "none";
	} else {
		console.log("2");
		stateLogin.style.display = "none";
		stateLogout.style.display = "display";
	}
</script>
</html>
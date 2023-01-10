<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.nav {
	    list-style-type: none;
	    height: 48px;
	    width: 100%;
	    background-color: black;
	    display: flex;
	}
	
	.nav > li {
	    color: lightgray;
	    height : 100%;
	    width:90px;
	    display:flex;
	    align-items: center;
	}
	
	.nav > li > a {
	    color:white;
	    margin:auto;
	    padding: 10px;
	    font-size:20px;
	    align-items: center;
	}
	
	.nav > li > a:hover {
	    color :lightgray;
	    border-bottom: 3px solid rgb(209, 209, 209);
	    text-decoration:none;
	}
	
	
	#logo {
		color:white;
	    font-size: 18px;
	    padding-left:40px; 
	    margin-right:auto;
	    display: flex;
	}
	.dropdown.dropdown {
       position: unset;
   }
</style>
</head>
<body>
		<div id="header">
			<ul>
				<li><a href="<c:url value='/'/>"><img src="${pageContext.request.contextPath}/img/mainImage.png"></a></li>
				<li></li>
				<li class="menu"><a href="<c:url value='/Home/wondoo'/>">원두 소개</a></li>
            	<li class="menu"><a href="<c:url value='/Home/dessert'/>">추천 디저트</a></li>
				<li class="menu"><a href="<c:url value='/board/list'/>">게시판</a></li>
				<li></li>
				<li class="dropdown">
					<a href="javascript:void(0)" class="dropbtn">마이페이지</a>
					
					<div id="dropdown-stateLogin" class="dropdown-content" style="margin-top:400px" >
						<a href="<c:url value='/Home/logout'/>" class="stateLogin">로그아웃</a>
						<a href="<c:url value='/Home/update'/>" class="stateLogin">정보수정</a>
						<a href="<c:url value='/bookmark'/>"	class="stateLogin">즐겨찾기</a>
						<a href="<c:url value='/board/memlist'/>" class="stateLogin">나의 게시글</a>
						<a href="<c:url value='/reviewList'/>" class="stateLogin">나의 리뷰</a>
						<a href="<c:url value='/readlist'/>" class="stateLogin">나의 댓글</a>
					</div>
					
					<div id="dropdown-stateLogout" class="dropdown-content" style="margin-top:180px">
						<a href="<c:url value='/Home/login'/>" class="stateLogout">로그인</a>
						<a href="<c:url value='/signUp'/>" class="stateLogout">회원가입</a>
					</div>
					
					<div id="dropdown-stateAdmin" class="dropdown-content" style="margin-top:240px">
						<a href="<c:url value='/Home/logout'/>" class="stateAdmin">로그아웃</a>
						<a href="<c:url value='/admin/cafeMgmt'/>" class="stateAdmin">카페관리</a>
						<a href="<c:url value='/admin/memList'/>" class="stateAdmin">회원관리</a>
					</div>
					
				</li>
			</ul>
		</div>
		<script>
		let stateLogin = document.getElementById("dropdown-stateLogin");
		let stateLogout = document.getElementById("dropdown-stateLogout");
        let stateAdmin =  document.getElementById("dropdown-stateAdmin");
		console.log(stateLogin);
		console.log(stateLogout);
		var margin_value = 0;
		if ("${sessionScope.id}" != "") {
			if ("${sessionScope.id}" == "admin") {
				stateAdmin.style.display = "display";
				stateLogin.style.display = "none";
				stateLogout.style.display = "none";
			}
			else{
				stateAdmin.style.display = "none";
				stateLogin.style.display = "display";
				stateLogout.style.display = "none";
			}

		} else {
			stateAdmin.style.display = "none";
			stateLogin.style.display = "none";
			stateLogout.style.display = "display";
		}
		</script>
</body>
</html>
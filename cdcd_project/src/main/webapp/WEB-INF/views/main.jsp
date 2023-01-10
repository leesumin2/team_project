<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="loginOutlink"
	value="${sessionScope.id==null? '/Home/login':'/Home/logout'}" />
<%-- <c:set var="loginOut" value="${sessionScope.id==null?  :  }"/> --%>
<link href="resources/css/web.css" rel="stylesheet" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카득카득</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>

		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}

#content {
		    font-family: 'SUIT-Regular';
	display: block;
	width: 100%;
	height: 80%;
	text-align: center;
}

#container #content {
	display: block;
	width: 100%;
	height: 80%;
	text-align: center;
}

#content .logo {
	margin-top: 20px;
	width: 400px;
	height: 200px;
	margin: auto;
	clear: both;
}

#content #main-logo {
	width: 400px;
	margin-left: -10px;
}

#content .search {
	height: 40px;
	margin-bottom: 50px;
	font-family: 'SUIT-Regular';
}

#content #search-input {
	width: 500px;
	height: 50px;
	border: 1px solid rgb(240, 219, 200);
	border-radius: 5px;
	font-size: 20px;
		    font-family: 'SUIT-Regular';
}

#content #search-btn {
	width: 100px;
	height: 50px;
	background-color: rgb(240, 219, 200);
	border: none;
	border-radius: 5px;
	font-size: 20px;
}

#footer {
	width: 100%;
	height: 50px;
	background-color: rgb(240, 219, 200);
}

h1 {
	font-family: 'Nanum Pen Script', cursive;
}

.slides>li {
	list-style-type: none;
	display: inline-block;
	margin-right: 20px;
}

.slides>li>label {
	font-size: 20px;
}

.slide_wrapper button {
	position: absolute;
	height: 50px;
	top: 125px;
	border: none;
	background-color: transparent;
	color: black;
	font-weight: 1000px;
	font-size: 24px;
	opacity: 0.5;
	text-align: center;
	margin-top: 0px;
	background: rgba(255, 255, 255, 0.336);
	font-weight: 800px;
	padding: 10px;
	margin: 16px 17px 16px 11px;
	border-radius: 10px;
}

.slide_wrapper {
	position: relative;
	width: 960px;
	margin: 0 auto;
	height: 400px;
	overflow: hidden;
}


.slides {
	width: 1955px;
	position: absolute;
	/*움직일 수 있도록*/
	left: 0;
	top: 0;
	transition: left .5s ease-out;
	padding-left: 0;
	margin-left: 0;
	margin-bottom: 0;
}




.image-box {
    width: 300px;
    height: 300px;
    text-align: center;
}
.image-box>a {
	padding: 0px;
	width: 300px;
	height: 300px;
}
.image-box>a>img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#prev {
	left: -10px;
}

#next {
	right: -10px;
}

.slide_wrapper button:hover {
	background-color: white;
	color: brown;
	opacity: 0.6;
}
.slides .cafe-grade strong {
	color: red;
}


</style>
</head>

<body>
	<div id="container">
<%@ include file="header.jsp" %>
		<div id="content">
			<div class="logo">
				<img id="main-logo" src="${pageContext.request.contextPath}/img/mainImage.png" alt="logo">
			</div>
			<form id="search" action="/cdcd/searchResult" onsubmit="return search_keyword()">
				<input class="search_keyword" id="search-input" name="keyword" type="text" placeholder="동네, 식당 또는 음식을 검색해주세요." >
				<button class="search" id="search-btn">검색</button>
			</form>
			<div class="slide_wrapper">
				<ul class="slides">
				<c:forEach var="reviewAvg" items="${reviewAvg}" varStatus="status" begin="0" end="5">
				 <li>
					<div class="image-box">
						<a href="<c:url value='/cafeInfo?cafe_id=${reviewAvg.cafe_id }'/>"> <img src="${pageContext.request.contextPath}/img/cafeImg/${reviewAvg.img}" alt=""> </a>
					</div> 
					<label class="cafe-name"><a href="<c:url value='/cafeInfo?cafe_id=${reviewAvg.cafe_id }'/>">${reviewAvg.name}</a></label> 
					<label class="cafe-grade"><i class="fa-solid fa-star" style="color: gold;"></i> <strong> ${reviewAvg.avg_}</strong> </label>
				</li>
				</c:forEach>
				</ul>
				<button id="prev">&lang;</button>
				<button id="next">&rang;</button>
			</div>
			
			
		</div>
	</div>
	<script type="text/javascript">
	
	
		let msg = "${msg}";
		if(msg=='not_manage'){
			alert("관리자만 열람 가능합니다.");
		}
		
	
		var slides = document.querySelector('.slides'), slide = document
				.querySelectorAll('.slides li'), currentIdx = 0, slideCount = slide.length, slideWidth = 300, slideHeight = 450, slideMargin = 30;
		let prevBtn = document.getElementById('prev'), nextBtn = document
				.getElementById('next');

		// slides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + "px";

		function moveSlide(num) {
			slides.style.left = -num * 330 + 'px';
			currentIdx = num;
		}
		prevBtn.onclick = function() {
			if (currentIdx > 0) {
				moveSlide(currentIdx - 1);
			} else {
				moveSlide(slideCount - 3);
			}
		};
		nextBtn.onclick = function() {
			if (currentIdx < slideCount - 3) {
				moveSlide(currentIdx + 1);
			} else {
				moveSlide(0);
			}
		};
		
		<!-- 검색결과창 이동 -->
		function search_keyword() {
			var keyword = document.getElementById("search-input");
			if(keyword.value != "") {
				return true;	
			}
			alert("검색어를 입력해주세요.");
			return false;
		}
		

	</script>
</body>

</html>
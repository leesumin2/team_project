<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="resources/css/web.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	<!-- 추가 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
	
    <title> ${cafeDto.cafe_name } </title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}

        #cafe_contents {
		    font-family: 'SUIT-Regular';
            margin: auto;
            width: 1000px;
        }
        
        #cafe_title {
            display: flex;
            align-items: center;
            margin-top: 0;
        }
        #bookmark button {
            background-color: rgba(255, 255, 255, 100);
            border: 0px;
            cursor: pointer;
        }
        #cafe_title a {
            text-decoration: none;
            color: black;
        }
        #bookmark i {
            padding-right: 15px;
        }
        #cafe_title #cafe_name {
            margin-right: auto;
        }
		#mgmtBtn {
            text-align: right;
            margin: 10px auto;
		}
		#mgmtBtn button{
            background-color: rgb(240, 219, 200);
            border: 1px solid rgb(240, 219, 200);
            color: black;
		    font-family: 'SUIT-Regular';
		}
        #cafe_detail {
            margin-top: 20px;
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
        }
        #cafe_grade_box {
            display: flex;
            justify-content: center;
            margin-right: auto;
        }
        
        .grade {
        	padding-left: 10px;
            margin-left: 10px;
            margin-right: 10px;
            width: 100px;
            border-left: 1px solid #eee;
        }
        .grade span {
        	padding-left: 5px;
            font-weight: bold;
            font-size: 15px;
        }
		#cafe_img_box {
            display: flex;
            overflow: hidden;
            position: relative;
            height: 300px;
        }
        #img_detail_box {
            position: fixed;
            width: 1260px;
            height: 800px;
            background-color: rgba(0, 0, 0, 0.7);
            display: none;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-top: 30px solid rgba(0, 0, 0, 0);
            border-left: 30px solid rgba(0, 0, 0, 0);
            border-bottom: 30px solid rgba(0, 0, 0, 0);
            border-right: 10px solid rgba(0, 0, 0, 0);
            z-index: 1;
            overflow: auto;
        }
        #img_detail_list_box {
            display: flex;
            overflow: hidden;
            position: relative;
            width: 1200px;
            height: 400px;
            margin: 30px 0;
        }
        #detail_closeBtn {
            color: #eee;
            width: 1200px;
            text-align: right;
            cursor: pointer;
        }
        #slideLBtn, #slideRBtn {
            width: 30px;
            height: 300px;
            position: absolute;
            text-align: center;
            line-height: 300px;
            font-size: 30px;
            background-color: #fff;
        }
        #slideLBtn_detail, #slideRBtn_detail {
            width: 30px;
            height: 400px;
            position: absolute;
            text-align: center;
            line-height: 400px;
            font-size: 30px;
            color: #eee;
        }
        #slideLBtn:hover, #slideRBtn:hover {
            cursor: pointer;
            font-size: 50px;
        }
        #slideLBtn_detail:hover, #slideRBtn_detail:hover {
            cursor: pointer;
            font-size: 50px;
        }
        #slideRBtn, #slideRBtn_detail {
            right: 0;
        }
        #cafe_img_list {
            display: flex;
            position: absolute;
            justify-content: space-between;
            padding: 0 30px;
        }
        #img_detail_list {
            display: flex;
            position: absolute;
            justify-content: space-between;
            left: 400px;
        }
        #cafe_img_item, .review_img_item {
            width: 300px;
            height: 300px;
            margin: 0 20px 0 0;
            text-align: center;
        }
        .img_detail_item {
            width: 400px;
            height: 400px;
            margin: 0 20px 0 0;
            text-align: center;
        }
        #cafe_img_item>img, .review_img_item>img, .img_detail_item>img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            cursor: pointer;
        }
        #img_detail_contents_list_box {
		    position: relative;
		    width: 1200px;
		    min-height: 250px;
        }
        .img_detail_contents {
            position: absolute;
            background-color: #fff;
            width: 100%;
            min-height: 100%;
            display: none;
            padding: 30px;
        }
        .img_detail_contents > P {
            font-size: 25px;
        }
        .img_detail_contents_review {
            display: flex;
    		padding-top: 20px;
        }
        .img_detail_contents_info {
            display: flex;
            justify-content: space-between;
        }
        .img_detail_contents_user {
            display: flex;
        }
        .img_detail_contents_user_ID {
            padding-right: 20px;
        }
        #img_detail_contents_review_scores {
            display: flex;
    		flex-direction: column;
            width: 170px;
        }
        .img_detail_contents_review_scores_coffee, .img_detail_contents_review_scores_dessert, .img_detail_contents_review_scores_mood {
            display: flex;
    		padding: 0 0 10px 0;
        }
        .img_detail_contents_review_scores_coffee>span, .img_detail_contents_review_scores_dessert>span, .img_detail_contents_review_scores_mood>span {
    		width: 40px;
    		margin-right: 5px;
        }
        .img_detail_contents_review_writing {
            width: 910px;
        }
        #hashTag {
            padding: 20px 20px 20px 0;
        }
        .hashTagBtn {
            background-color: #f0dbc8;
            border: 1px solid #f0dbc8;
            border-radius: 5px;
            font-size: 16px;
		    font-family: 'SUIT-Regular';
        }
        input[type="checkbox"] {
        	display: none;
        }
        input:checkd + label {
        	background-color: #ccc;
        }
        .cafe_info {
            text-align: left;
            padding-left: 20px;
        }
        .cafe_info th {
            width: 100px;
            padding: 0 20px 20px 0;
            vertical-align: top;
        }
        .cafe_info td {
            padding-bottom: 20px;
        }
        #cafe_sns i {
            text-decoration: none;
            color: #a38c77;
            padding-right: 20px;
        }
        .menu_item {
        	padding-bottom: 10px;
        	display: flex;
    		justify-content: space-between;
        }
        .menu_signature {
        	padding-right: 20px;
        }

        #cafe_review1 {
            margin: 30px;
            text-align: center;
        }
        
        .user_review_box {
			display: flex;
			align-items: center;
			justify-content: space-between;
			height: 150px;
			border: 2px solid #f0dbc8;
			margin-bottom: 10px;
			clear: both; /* 추가 */
			border-radius:5px;
        }
		.user {
			display: inline-block;
			width: 100%;
			padding: 20px 20px 10px 0;
		}
		
/*          .review_contents_box {
            display: flex;
            justify-content: space-between;
            padding: 10px 10px 20px 20px;
        }  */
        #scores {
            display: flex;
            padding-bottom: 10px;
            text-align: center;
        }
        .coffee, .dessert, .mood {
            display: flex;
            padding-right: 30px;
            text-align: center;
        }
/*         .review_img_box {
            align-self: center;
            padding-right: 10px;
        } 
                .review_img_box > div{
            width: 200px;
            height: 160px;
        }
        .review_img_box > div > img {
            width: 100%;
            height: 100%;
    		object-fit: cover;
        }
        */
        .coffee_score, .dessert_score, .mood_score {
        	padding-left: 5px;
        }

        
		.rDropdown{
			width:20px;
			position:relateive;
			display:inline-block;
		}
		
		.rDropdown-content{
			display : none;
		  	position : absolute;
		  	z-index : 1; /*다른 요소들보다 앞에 배치*/
		  	background-color: #f9f9f9;
		  	min-width : 90px;
		  	box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
		  	border-radius : 5px; 
		}
		.rDropdown-content a{
		  display : block;
		  text-decoration : none;
		  color : rgb(37, 37, 37);
		  font-size: 12px;
		  padding : 12px 20px;
		}
		
		.rDropdown-content a:hover{background-color : #ececec}
		.rDropdown:hover .rDropdown-content{display:block;}
        /* 수정 및 추가 */
        #orderBtn_box {
			width: 205px;
			margin: 15px 0 10px;
			float: right;
		}

		.oBtn {
			border: 0px solid #CC723D;
			border-radius: 5px;
			font-size: 15px;
			width: 65px;
			padding: 5px;
			background-color: white;
		}

		.oBtn:hover {
			background-color: #f0dbc8;
			transition: all 0.4s ease 0s;
		}
		
		#cafe_review2 div {
			opacity: 1;
			transition: all 0.4s ease 0s;
		}

		#cafe_review2 div.is-hidden {
			opacity: 0;
			height: 0;
			margin: 0;
			z-index: 0;
			pointer-events: none;
		}
		.review_box1 {
			display: flex;
			display: flex;
			flex-direction: column;
			padding-left: 20px;
			position: relative;
		}
		
		.review_box2 {
			align-self: center;
			padding-right: 10px;
		}
		.review_box2>div {
			width: 100px;
			height: 100px;
			display: inline-block;
		}

		.review_box2>div>img {
			width: 100%;
			height: 100%;
			object-fit: cover;
		}

		.review_box2>div>a>img {
			width: 100px;
			height: 100px;
			background-size: contain;
			background-size: cover;
		}

		.dropdown.dropdown {
			position: unset;
		}

		.review_contents {
			width: 650px;
			height: 50px;
			overflow-y: auto;
		}

		.review_contents::-webkit-scrollbar {
			width: 8px;
		}

		.review_contents::-webkit-scrollbar-thumb {
			background-color: #CC723D;
			border-radius: 5px;
			background-clip: padding-box;
			border: 1.5px solid transparent;
		}

		.review_contents::-webkit-scrollbar-track {
			background-color: #f0dbc8;
			border-radius: 5px;
			box-shadow: inset 0px 0px 5px white;
		}

		#order {
			width: 80px;
			display: block;
			float: right;
			margin: 10px 0 5px;
		}

		.more {
			
		}

		.more button {
			border: 1px solid #f0dbc8;
			border-radius: 5px;
			background-color: white;
			width: 1000px;
			font-size: 30px;
			z-index: 1;
		}

		.more button:hover {
			border: 1px solid black;
			border-radius: 5px;
			transition: all 0.4s ease 0s;
		}

		/* 끝 */

    </style>
</head>
<body>
    <div id="container">
<%@ include file="header.jsp" %>
        <div id="cafe_contents">
        
            <div id="mgmtBtn" style='${mem_id == "admin" ? "visibility:visibility;" : "visibility:hidden;" }'>
				<button type="button" id='${option == "insert" ? "insertBtn" : "updateBtn" }' class="btn btn-default" onclick="location.href='/cdcd/admin/cafeMgmt/update?cafe_id=${cafeDto.cafe_id}'">${option == "insert" ? "등록" : "수정" }</button>
			    <button type="button" id="deleteBtn" style='${option == "insert" ? "display:none;" : "display:display;"}' class="btn btn-info">삭제</button>
			</div>
			
            <div id="cafe_title" class="page-header">
                <div id="bookmark">
                	<button id="bookmarkbtn" type="button"><i class="fa-regular fa-heart fa-2x" style="color: #ccc;"></i></button>
                </div>
                <h4 id="cafe_name">${cafeDto.cafe_name }</h4>
                
                <!-- 카페 별점 -->
	            <div id="cafe_grade_box">
	            	
	            	<!-- 22-11-26 수정 -->
	                <div class="grade">
	                    <span>커피</span>
	       				<span style="color: red;">${empty cafeDto.coffee_avg ? "0.0" : ""}${cafeDto.coffee_avg }점</span>
	                </div>
	                <div class="grade">
	                    <span>디저트</span>
	       				<span style="color: red;">${empty cafeDto.coffee_avg ? "0.0" : ""}${cafeDto.dessert_avg }점</span>
	                </div>
	                <div class="grade">
	                    <span>분위기</span>
	       				<span style="color: red;">${empty cafeDto.coffee_avg ? "0.0" : ""}${cafeDto.mood_avg }점</span>
	                </div>
	                <!-- 끝 -->
	                
	            </div>
	            
	            
                <h4><a href="" onclick="review_write()"><i class="fa-solid fa-pen" style="color: #ccc;"></i> 리뷰작성</a></h4>
            </div>
            <div id="cafe_img_box">
                <div id="cafe_img_list">
                    <div id="cafe_img_item" class="img_item" onclick="detail_open(this)">
                        <img src="${pageContext.request.contextPath}/img/cafeImg/${cafeDto.cafe_img }">
                    </div>
                    <c:forEach var="review" items="${reviewDto }">
                    
                        <c:if test="${not empty review.review_img1 }">
                        <div class="img_item review_img_item" onclick="detail_open(this)">
                            <img src="${pageContext.request.contextPath}/img/reviewImg/${review.review_img1 }">
                        </div>
                        </c:if>
                        
                        <c:if test="${not empty review.review_img2 }">
                        <div class="img_item review_img_item" onclick="detail_open(this)">
                            <img src="${pageContext.request.contextPath}/img/reviewImg/${review.review_img2 }">
                        </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div id="slideLBtn" onclick="slide_left()">&lt;</div>
                <div id="slideRBtn" onclick="slide_right()">&gt;</div>
            </div>
            <div id="img_detail_box">
                <div id="detail_closeBtn" onclick="detail_close()"><i class="fa-solid fa-xmark fa-2x"></i></div>
                <div id="img_detail_list_box">
                    <div id="img_detail_list">
                        <div class="img_detail_item" class="img_item">
                            <img src="${pageContext.request.contextPath}/img/cafeImg/${cafeDto.cafe_img }">
                        </div>
                        <c:forEach var="review" items="${reviewDto }">
                            <c:if test="${not empty review.review_img1 }">
                                <div class="img_detail_item">
                                    <img src="${pageContext.request.contextPath}/img/reviewImg/${review.review_img1 }" data-name="${review.review_img1 }">
                                </div>
                            </c:if>
                            <c:if test="${not empty review.review_img2 }">
                                <div class="img_detail_item">
                                    <img src="${pageContext.request.contextPath}/img/reviewImg/${review.review_img2 }" data-name="${review.review_img2 }">
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div id="slideLBtn_detail" onclick="slide_left_detail()">&lt;</div>
                    <div id="slideRBtn_detail" onclick="slide_right_detail()">&gt;</div>
                </div>
                <div id="img_detail_contents_list_box">
                    <div class="img_detail_contents">
                        <p>[ ${cafeDto.cafe_name } ] 대표사진</p>
                    </div>
                    <c:forEach var="review" items="${reviewDto }">
                        <c:if test="${!empty review.review_img1 }">
                            <div class="img_detail_contents">
                                <div class="img_detail_contents_info">
                                	<div class="img_detail_contents_user">
	                                	<div class="img_detail_contents_user_ID">
	                                    	<span><b>${review.mem_id }</b></span>
	                                    </div>
	                                	<div class="img_detail_contents_user_r_reg_date">
		                                    <fmt:formatDate var = "today" value="${now}" pattern="yyyy-MM-dd"/>
		                                    <fmt:formatDate var = "r_reg_date" value="${review.r_reg_date}" pattern="yyyy-MM-dd"/>
		                                    <c:choose>
		                                        <c:when test="${ today<=r_reg_date}">
		                                            <td class="r_reg_date">
		                                                <fmt:formatDate value="${review.r_reg_date}" pattern="HH:mm" type="time"/>
		                                            </td>
		                                        </c:when>
		                                        <c:otherwise>
		                                            <td class="r_reg_date">
		                                                <fmt:formatDate value="${review.r_reg_date}" pattern="yyyy-MM-dd" type="date"/>
		                                            </td>
		                                        </c:otherwise>
		                                    </c:choose>
		                            	</div>
                                	</div>
                                <div class="img_detail_contents_user_access">
	                                <c:if test="${sessionScope.id=='admin'}" >
	                                	<a class="removeBtn" data-cno="${review.review_id}" return false;><i class="fa-solid fa-trash"></i> 삭제</a>
	                                </c:if>
	                                <c:if test="${review.mem_id == sessionScope.id}" >
										<a class="review_modify" data-cno="${review.review_id}" return false;><i class="fa-solid fa-pen"></i> 수정</a>
	                                    <a class="removeBtn" data-cno="${review.review_id}" return false;><i class="fa-solid fa-trash"></i> 삭제</a>
	                                </c:if>
                                </div>
                             </div>    
                                                            
                                <div class="img_detail_contents_review">
									<div id="img_detail_contents_review_scores">
									    <div class="img_detail_contents_review_scores_coffee">
									        <span>커피</span>
									        <div class="coffee_score">
									            <c:if test="${empty review.coffee_score }"> [참여안함]</c:if>
												<c:forEach var="coffee_score" begin="1" end="${review.coffee_score }">
												    <i class="fa-solid fa-star" style="color: gold;"></i>
												</c:forEach>        
											</div>
										</div>
										<div class="img_detail_contents_review_scores_dessert">
											<span>디저트</span>
											<div class="dessert_score">
												<c:if test="${empty review.dessert_score }"> [참여안함] </c:if>
												<c:forEach var="dessert_score" begin="1" end="${review.dessert_score }">
												    <i class="fa-solid fa-star" style="color: gold;"></i>
												</c:forEach>                   
											</div>
										</div>
										<div class="img_detail_contents_review_scores_mood">
											<span>분위기</span>
											<div class="mood_score">
												<c:if test="${empty review.mood_score }"> [참여안함] </c:if>
												<c:forEach var="mood_score" begin="1" end="${review.mood_score }">
												    <i class="fa-solid fa-star" style="color: gold;"></i>
												</c:forEach>               
									        </div>
										</div>
									</div>
									<div class="img_detail_contents_review_writing">${review.review_content }</div>
                                </div> 
                                
                            </div>
                        </c:if>
                        <c:if test="${!empty review.review_img2 }">
                            <div class="img_detail_contents">
                            	<div class="img_detail_contents_info">
                                	<div class="img_detail_contents_user">
	                                	<div class="img_detail_contents_user_ID">
	                                    	<span><b>${review.mem_id }</b></span>
	                                    </div>
	                                	<div class="img_detail_contents_user_r_reg_date">
		                                    <fmt:formatDate var = "today" value="${now}" pattern="yyyy-MM-dd"/>
		                                    <fmt:formatDate var = "r_reg_date" value="${review.r_reg_date}" pattern="yyyy-MM-dd"/>
		                                    <c:choose>
		                                        <c:when test="${ today<=r_reg_date}">
		                                            <td class="r_reg_date">
		                                                <fmt:formatDate value="${review.r_reg_date}" pattern="HH:mm" type="time"/>
		                                            </td>
		                                        </c:when>
		                                        <c:otherwise>
		                                            <td class="r_reg_date">
		                                                <fmt:formatDate value="${review.r_reg_date}" pattern="yyyy-MM-dd" type="date"/>
		                                            </td>
		                                        </c:otherwise>
		                                    </c:choose>
		                            	</div>
                                	</div>
                                <div class="img_detail_contents_user_access">
	                                <c:if test="${sessionScope.id=='admin'}" >
	                                	<a class="removeBtn" data-cno="${review.review_id}" return false;><i class="fa-solid fa-trash"></i> 삭제</a>
	                                </c:if>
	                                <c:if test="${review.mem_id == sessionScope.id}" >
										<a class="review_modify" data-cno="${review.review_id}" return false;><i class="fa-solid fa-pen"></i> 수정</a>
	                                    <a class="removeBtn" data-cno="${review.review_id}" return false;><i class="fa-solid fa-trash"></i> 삭제</a>
	                                </c:if>
                                </div>
                             </div>       
                                                            
                                <div class="img_detail_contents_review">
	                                <div id="img_detail_contents_review_scores">
	                                    <div class="img_detail_contents_review_scores_coffee">
	                                        <span>커피</span>
	                                        <div class="coffee_score">
	                                            <c:if test="${empty review.coffee_score }"> [참여안함]</c:if>
	                                            <c:forEach var="coffee_score" begin="1" end="${review.coffee_score }">
	                                                <i class="fa-solid fa-star" style="color: gold;"></i>
	                                            </c:forEach>        
	                                        </div>
	                                    </div>
	                                    <div class="img_detail_contents_review_scores_dessert">
	                                        <span>디저트</span>
	                                        <div class="dessert_score">
	                                            <c:if test="${empty review.dessert_score }"> [참여안함] </c:if>
	                                            <c:forEach var="dessert_score" begin="1" end="${review.dessert_score }">
	                                                <i class="fa-solid fa-star" style="color: gold;"></i>
	                                            </c:forEach>                   
	                                        </div>
	                                    </div>
	                                    <div class="img_detail_contents_review_scores_mood">
	                                        <span>분위기</span>
	                                        <div class="mood_score">
	                                            <c:if test="${empty review.mood_score }"> [참여안함] </c:if>
	                                            <c:forEach var="mood_score" begin="1" end="${review.mood_score }">
	                                                <i class="fa-solid fa-star" style="color: gold;"></i>
	                                            </c:forEach>               
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="img_detail_contents_review_writing">${review.review_content }</div>
                                </div>
                                    
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div id="cafe_detail">
                <form id="hashTag" action="/cdcd/searchResult">
	                <c:forEach var="hashtag" items="${hashtagDto }">
	                
	                	<label class="btn btn-default" for="${hashtag.hashtag_content }" onclick="styleChange(this)">
               				<input type="checkbox" value="${hashtag.hashtag_id }"  id= "${hashtag.hashtag_content }" name="hashtag">
	                		#${hashtag.hashtag_content }
	                	</label>
	                	
	                </c:forEach>
                </form>
                <table class="cafe_info">
                    <tr>
                        <th>주소</th>
                        <td>
                        	${cafeDto.cafe_addr1 } ${cafeDto.cafe_addr2 } ${cafeDto.cafe_addr3 }<br>
                        	(지번) ${cafeDto.cafe_addr4 }                        	
                        </td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>${cafeDto.cafe_num }</td>
                    </tr>
                    <tr>
                        <th>영업시간</th>
    					<td>
    						<fmt:formatDate value="${cafeDto.cafe_open }" pattern="HH:mm" type="time"/>
    						~
    						<fmt:formatDate value="${cafeDto.cafe_close }" pattern="HH:mm" type="time"/>
    						
    					</td>
                    </tr>
                    <tr>
                        <th>SNS</th>
                        <td> <a id="cafe_sns" href="http://${cafeDto.cafe_info }" target="blank"><i class="fa-brands fa-instagram fa-2x"></i></a></td>
                    </tr>
                    
                </table>
                <table class="cafe_info">
                	<tr>
                        <th>메뉴</th>
                        	<td>
                        		<c:forEach var="menu" items="${menuDto }">
                        			<div class="menu_item">
	                        			<div class="menu_signature">
	                        				${menu.menu_signature }
	                        			</div>
	                        			<div class="menu_price">
	                        				 <fmt:formatNumber value="${menu.menu_price }" pattern="#,###"/>원
	                        			</div>
	                        		</div>
                        		</c:forEach>
                        	</td>
                    </tr>
                </table>
            </div>
            
            <div id="orderBtn_box">
				<button class="oBtn" id="newOrder">최신순</button>
				<button class="oBtn" id="oldOrder">오래된순</button>
				<button class="oBtn" id="likeOrder">좋아요순</button>
			</div>
            <!-- 작성된 카페리뷰 보여주기			 -->
			<div id="cafe_review1">등록된 리뷰가 없습니다.</div>
			<div id="cafe_review2">
				<c:forEach var="review" items="${reviewDto }" varStatus="status">
					<div class="user_review_box">
						<div class="review_box1">
							<div class="user">
								<span><b>${review.mem_id }</b></span>
								<c:if test='${idlike[status.index] == 0}'> &nbsp;
									<span id="thumbsdown${status.index}" data-cno="${status.index}"
										data-rcno="${review.review_id}">
										<i class="fa-regular fa-thumbs-up"></i>
									</span>
								</c:if>
								<c:if test='${idlike[status.index] != 0}'> &nbsp;
									<span id="thumbsup${status.index}" data-cno="${status.index}"
										data-rcno="${review.review_id}">
										<i class="fa-solid fa-thumbs-up"></i>
									</span>
								</c:if>
								<span id="like"><b>${rvlike[status.index]}&nbsp;</b></span>

								<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
								<fmt:formatDate var="r_reg_date" value="${review.r_reg_date}" pattern="yyyy-MM-dd" />
								<c:choose>
									<c:when test="${ today<=r_reg_date}">
										<td class="r_reg_date">
											<fmt:formatDate value="${review.r_reg_date}" pattern="HH:mm" type="time" />
											&nbsp;
										</td>
									</c:when>
									<c:otherwise>
										<td class="r_reg_date">
											<fmt:formatDate value="${review.r_reg_date}" pattern="yyyy-MM-dd"
												type="date" /> &nbsp;
										</td>
									</c:otherwise>
								</c:choose>
								<c:if test="${sessionScope.id=='admin'}">
									<div class="rDropdown fa-solid fa-ellipsis-vertical">
										<div class="rDropdown-content">
											<a class="removeBtn" data-cno="${review.review_id}" returnfalse;><i
													class="fa-solid fa-trash"></i> 삭제</a>
										</div>
									</div>
								</c:if>
								<c:if test="${review.mem_id == sessionScope.id}">
									<div class="rDropdown fa-solid fa-ellipsis-vertical">
										<div class="rDropdown-content">
											<a class="review_modify" data-cno="${review.review_id}" returnfalse;> <i
													class="fa-solid fa-pen"></i> 수정</a>
											<a class="removeBtn" data-cno="${review.review_id}" returnfalse;> <i
													class="fa-solid fa-trash"></i> 삭제</a>
										</div>
									</div>
								</c:if>

							</div>
							<div class="review_contents_box">
								<div id="scores">
									<div class="coffee">
										<span>커피</span>
										<div class="coffee_score">
											<c:if test="${empty review.coffee_score }"> [참여안함]</c:if>
											<c:forEach var="coffee_score" begin="1" end="${review.coffee_score }">
												<i class="fa-solid fa-star" style="color: gold;"></i>
											</c:forEach>
										</div>
									</div>
									<div class="dessert">
										<span>디저트</span>
										<div class="dessert_score">
											<!-- 수정 empty 뒤에 review 오타 수정 -->
											<c:if test="${empty review.dessert_score }"> [참여안함] </c:if>
											<c:forEach var="dessert_score" begin="1" end="${review.dessert_score }">
												<i class="fa-solid fa-star" style="color: gold;"></i>
											</c:forEach>
										</div>
									</div>
									<div class="mood">
										<span>분위기</span>
										<div class="mood_score">
											<c:if test="${empty review.mood_score }"> [참여안함] </c:if>
											<c:forEach var="mood_score" begin="1" end="${review.mood_score }">
												<i class="fa-solid fa-star" style="color: gold;"></i>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="review_contents">${review.review_content }</div>
							</div>
						</div>
						<div class="review_box2">
							<c:set var="review_img1" value="${review.review_img1 }" />
							<c:if test="${!empty review_img1 }">
								<div>
									<a href="${pageContext.request.contextPath}/img/reviewImg/${review.review_img1 }" data-title="image1"
										data-lightbox="image-set"> <img id="review_img1"
											src="${pageContext.request.contextPath}/img/reviewImg/${review.review_img1 }">
									</a>
								</div>
							</c:if>

							<c:set var="review_img2" value="${review.review_img2 }" />
							<c:if test="${!empty review_img2 }">
								<div>
									<a href="${pageContext.request.contextPath}/img/reviewImg/${review.review_img2 }" data-title="image2"
										data-lightbox="image-set"> <img id="review_img2"
											src="${pageContext.request.contextPath}/img/reviewImg/${review.review_img2 }">
									</a>
								</div>
							</c:if>
						</div>
					</div>
				</c:forEach>
				<div class="more"><button>more <i class="fa-solid fa-caret-down"></i></button></div>
			</div>

        </div>
    </div>    
</body>
<script>

<!--더보기 버튼 클릭-->
var moreNum = 2;
$("#cafe_review2 > div:nth-child(n + " + (moreNum + 1) + "):not(.more)").addClass("is-hidden");
if ($("#cafe_review2 > div.is-hidden").length == 0) {
	$(".more").hide();
}
$(".more").on("click", function () {
	$("#cafe_review2 > div.is-hidden").slice(0, moreNum).removeClass("is-hidden");
	if ($("#cafe_review2 > div.is-hidden").length == 0) {
		$(".more").fadeOut();
	}
});


<!--최신순 버튼 클릭-->
	$('#newOrder').on('click', function () {
		window.location = "/cdcd/cafeInfo?cafe_id=" + ${ param.cafe_id } +"&mode=" + 0;
	});
<!--오래된순 버튼 클릭-->
	$('#oldOrder').on('click', function () {
		window.location = "/cdcd/cafeInfo?cafe_id=" + ${ param.cafe_id } +"&mode=" + 1;
	});
<!--좋아요순 버튼 클릭-->
	$('#likeOrder').on('click', function () {
		window.location = "/cdcd/cafeInfo?cafe_id=" + ${ param.cafe_id } + "&mode=" + 2;
	});
<!-- 리뷰 좋아요 -->
	for (var i = 0; i < ${ reviewDto.size() }; i++) {
		$("#thumbsup" + i).click(function () {
			let review_id = $(this).attr('data-rcno');
			$.ajax({
				type: 'GET', // 요청 메서드 
				url: '/cdcd/liked?review_id=' +review_id, // 요청 URI 
				success : function(result){ // 요청이 성공일 때 실행되는 이벤트 
				alert("좋아요가 취소되었습니다.");//************************** 
				window.location.reload(); 
			}, error: function() { 
					alert("좋아요 실패"); 
				}
			});
		}); 
		$("#thumbsdown" + i).click(function () {
			let review_id = $(this).attr('data-rcno');
			$.ajax({
				type: 'GET', // 요청 메서드 
				url: '/cdcd/likeg?review_id=' +review_id, // 요청 URI 
				success : function(result){ //요청이 성공일 때 실행되는 이벤트 
				alert("좋아요 하였습니다."); 
				window.location.reload();
			}, error: function () {
				alert("좋아요 기능은 회원만	가능합니다.");
				} 
			}); 
			}); 
		}
	<!-- 카페 이미지 display -->
	if ("${cafeDto.cafe_img}" == "") {document.getElementById("cafe_img").style.visibility = "hidden";
				}
	
    <!-- 이미지 슬라이드(기본) -->
    var img_index = 0;
    
    function slide_left() {
        let img_list = document.querySelector("#cafe_img_list");
        let slideNum = img_list.childElementCount;

        if(slideNum > 3) {    
	        if(img_index == 0) {
	            img_list.style.transform = 'translate(-' + 320*(slideNum-3) + 'px, 0px)';
	            img_index = slideNum-3; 
	        }
	        else {
	            img_list.style.transition = '0.5s';
	            img_list.style.transform = "translate(-" + 320*(img_index-1) + "px, 0px)";
	            img_index--;
	        }
        }
    }
    
    function slide_right() {
        let img_list = document.querySelector("#cafe_img_list");
        let slideNum = img_list.childElementCount;

        if(slideNum > 3) {
	        if(slideNum-img_index == 3) {
	            img_list.style.transform = 'translate(0px, 0px)';
	            img_index = 0;
	        }
	        else {
	            img_list.style.transition = '0.5s';
	            img_list.style.transform = "translate(-" + (320*(img_index+1)) + "px, 0px)";
	            img_index++;
	        }
        }
    }
 
    <!-- 이미지 슬라이드(상세) -->
    var img_index_detail = 0;
    
    function slide_left_detail() {
        let img_list = document.querySelector("#img_detail_list");
        let contens_list = document.querySelector("#img_detail_contents_list_box");
        let slideNum = img_list.childElementCount;

        if(slideNum > 1) {
	        if(img_index_detail == 0) {
	            img_list.style.transform = 'translate(-' + 420*(slideNum) + 'px, 0px)';
	            img_index_detail = slideNum-1; 
	        }
	        else {
	            img_list.style.transition = '0.5s';
	            img_list.style.transform = "translate(-" + 420*(img_index_detail-1) + "px, 0px)";
	            img_index_detail--;
	        }
	        for(let i=0; i<slideNum; i++) {
	            if(i == img_index_detail) {
	                img_list.children.item(img_index_detail).style.border = "5px solid #eee";
	                contens_list.children.item(img_index_detail).style.display = "block";
	            }
	            else {
	                img_list.children.item(i).style.border = "";
	                contens_list.children.item(i).style.display = "none";
	            }
	        }
        }
    }
    function slide_right_detail() {
        let img_list = document.querySelector("#img_detail_list");
        let contents_list = document.querySelector("#img_detail_contents_list_box");
        let slideNum = img_list.childElementCount;
        
        if(slideNum > 1) {
	        if(img_index_detail == slideNum-1) {
	            img_list.style.transform = 'translate(0px, 0px)';
	            img_index_detail = 0;
	        }
	        else {
	            img_list.style.transition = '0.5s';
	            img_list.style.transform = "translate(-" + (420*(img_index_detail+1)) + "px, 0px)";
	            img_index_detail++;
	        }
	        for(let i=0; i<slideNum; i++) {
	            if(i == img_index_detail) {
	                img_list.children.item(img_index_detail).style.border = "5px solid #eee";
	                contents_list.children.item(img_index_detail).style.display = "block";
	            }
	            else {
	                img_list.children.item(i).style.border = "";
	                contents_list.children.item(i).style.display = "none";
	            }
	        }
        
        }
        
    }
    <!-- 이미지 상세보기 -->
    function detail_open(ckImg) {
    	img_index_detail = 0;
        console.log(ckImg);
        document.getElementById("img_detail_box").style.display = "block";
        let img_list = document.querySelector("#img_detail_list");
        let contents_list = document.querySelector("#img_detail_contents_list_box");
        let slideNum = img_list.childElementCount;
        img_list.children.item(img_index_detail).style.border = "5px solid #eee";
        contents_list.children.item(img_index_detail).style.display = "block";
/*      
        for(let i=0; i<slideNum; i++) {
            console.log("1= "+ img_list.children.item(i).children.item(0).getAttribute("src"));
            console.log("2= "+ ckImg.children.item(0).getAttribute("src"));
            if(img_list.children.item(i).children.item(0).getAttribute("src") == ckImg.children.item(0).getAttribute("src")) {
                console.log("같은 내용찾음.");
                console.log("i=" + i);
                img_list.children.item(img_index_detail).style.border = "5px solid #eee";
                contents_list.children.item(img_index_detail).style.display = "block";
                break;
            }
            
            img_list.style.transition = '0.5s';
            img_list.style.transform = "translate(-" + (420*(img_index_detail+1)) + "px, 0px)";
            img_index_detail++;
            
        }
         */
    }
 
    function detail_close() {
        let img_detail = document.getElementById("img_detail_box");
        img_detail.style.display = "none";
    }
	
	<!-- 로그인한 경우, 해당 회원이 즐겨찾기한 카페면 꽉 찬 하트로 표시 -->
	if("${bookmarkDto}" != "") {
		document.getElementById("bookmarkbtn").innerHTML = '<i class="fa-solid fa-heart fa-2x" style="color: #f0dbc8;"></i>';
	}
	
	<!-- 즐겨찾기 저장, 삭제	-->
   $("#bookmarkbtn").click(function() {
		var cafe_id = ${cafeDto.cafe_id};
		var requestURL = "${pageContext.request.requestURL}";
		var requestURI = "${pageContext.request.requestURI}";
		var requestPath = requestURL.substr(0, requestURL.length-requestURI.length);
		$.ajax({
			url: "/cdcd/bookmarkSave?cafe_id="+cafe_id,
			type: "GET" ,
			success: function(result) {
				if(result == -1) {
					alert("로그인이 필요한 서비스 입니다.");
					window.location = "<c:url value='/Home/login'/>?toURL=" + requestPath +"/cdcd/cafeInfo?cafe_id=" + cafe_id;
				} else if(result == 0) {
					$("#bookmarkbtn").html('<i class="fa-regular fa-heart fa-2x" style="color: #ccc;"></i>');
					location.reload();
				} else {
					$("#bookmarkbtn").html('<i class="fa-solid fa-heart fa-2x" style="color: #f0dbc8;"></i>');
					location.reload();
				}
			},
			error: function() {
				alert("다시 시도해주십시오.");
			}
		});
	});

   
   
	<!-- 해시태그 검색 -->
	function styleChange(clickLabel) {
		clickLabel.parentElement.submit();
	}
   
	
	<!-- 리뷰 작성 팝업 띄우기 -->
	function review_write() {
		window.open("<c:url value='/review_write'/>?cafe_id="+${param.cafe_id}, "new", "scrollbars=no, resizable=no, width=600, height=700, left=600,top=100");
	}
	
	
	<!-- 카페 이미지 display -->
	if("${cafeDto.cafe_img}" == "") {
		document.getElementById("cafe_img").style.visibility = "hidden";
	}
	

	<!-- sns 여부에 따른 아이콘 display -->
	var sns = document.getElementById("cafe_sns");
	if("${cafeDto.cafe_info}" == "") {
		sns.style.display = "none";
	}
	
	
	<!-- 작성된 리뷰 display	 -->
	var review_box1 = document.getElementById("cafe_review1");
	var review_box2 = document.getElementById("cafe_review2");

    var reviewDto = `${reviewDto}`;
    console.log(reviewDto);	
	
	if(`${reviewDto}` == "[]") {
		console.log("reviewbox1");
		review_box1.style.display = "display";
		review_box2.style.display = "none";
	} else {
		console.log("reviewbox2");
		review_box1.style.display = "none";
		review_box2.style.display = "display";
	}
	
	
    <!-- 리뷰 삭제 메시지 -->
    let msg = "${msg}";
    if(msg=='del'){
        alert("삭제가 완료되었습니다.")
        window.location.reload(); 
    }else if(msg=='error'){
        alert("삭제가 완료되었습니다.");
        window.location.reload();
    }
    
    <!-- 리뷰 삭제 -->
     $(".removeBtn").click(function(){
        var cafe_id = ${param.cafe_id};
        var review_id = $(this).attr('data-cno');
        console.log(review_id);
        if(!confirm("삭제하시겠습니까?")) return;
        window.location="<c:url value='/remove'/>?review_id="+review_id+"&cafe_id="+cafe_id;
    });

     
     <!-- 리뷰 수정 팝업 띄우기 -->
      $(".review_modify").click(function(){
         var review_id = $(this).attr('data-cno');
         console.log(review_id);
         window.open("<c:url value='/read'/>?review_id="+review_id, "new", "scrollbars=no, resizable=no, width=600, height=700, left=600,top=100");
     });
      
  	
  	<!-- 삭제 데이터 전송	-->
  	$("#deleteBtn").click(function() {
  		if (confirm("해당 카페 정보를 삭제하시겠습니까?") == true) {    //확인
  			let cafe_id = $("#cafe_id").val();
  			$.ajax({
  				url			: "/cdcd/admin/cafeMgmt/delete?cafe_id=" + cafe_id,
  				type		: "GET",					
  				success: function(result) {
  					alert("카페정보가 삭제되었습니다.");
  					window.location = result + "${ph.so.getQueryString(ph.so.getPage()) }";
  				},
  				error: function() {
  					alert("다시 시도해주십시오.")
  				}
  			});	
  		} else {   //취소
  		     return false;
  		}
  	});

  	
     
     
     
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
    
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

		h1,h3 {
		    font-family: 'SUIT-Regular';
			text-align: center;
			margin-bottom:30px;
		}

        #cafe_contents {
		    font-family: 'SUIT-Regular';
            margin-top: 50px;
            margin-left: 300px;
            margin-right: 300px;
        }
        #cafe_title {
            display: flex;
            align-items: center;
        }
        #bookmark button {
            background-color: rgba(255, 255, 255, 100);
            border: 0px;
        }
        #cafe_title a {
            text-decoration: none;
            color: black;
        }
        #cafe_title h4 {
            line-height: 100%;
        }
        #bookmark i {
            padding-right: 15px;
            line-height: 100%;
        }
        #cafe_title #cafe_name {
            margin-right: auto;
        }
        #cafe_detail {
            margin-top: 20px;
            border-top: 1px solid #eee;
        }
        #cafe_grade_box {
            display: flex;
            justify-content: center;
            margin-right: auto;
        }
        .grade {
            margin-left: 10px;
            margin-right: 10px;
            width: 100px;
            text-align: center;
            border-left: 1px solid #eee;
        }
        .grade span {
            font-weight: bold;
            font-size: 15px;
        }
        #cafe_img_item {
            width: 300px;
            height: 300px;
            text-align: center;
        }
        #cafe_img_item>img {
            width: 100%;
            height: 100%;
    		object-fit: cover;
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
        #cafe_info {
            text-align: left;
            padding-left: 20px;
        }
        #cafe_info th {
            width: 100px;
            padding: 0 20px 20px 0;
        }
        #cafe_info td {
            padding-bottom: 20px;
        }
        #cafe_sns i {
            text-decoration: none;
            color: #a38c77;
            padding-right: 20px;
        }
        #review_box{
        	width:1000px;
        	height:650px;
        	margin:auto;
        	overflow:auto;
        }
        #review_box::-webkit-scrollbar {
	    width: 10px;
	  	}
	  	#review_box::-webkit-scrollbar-thumb {
	    	background-color: #CC723D;
	    	border-radius: 5px;
	    	background-clip: padding-box;
	    	border: 1.5px solid transparent;
	  	}
	  	#review_box::-webkit-scrollbar-track {
	    	background-color:#f0dbc8;
	    	border-radius: 5px;
	    	box-shadow: inset 0px 0px 5px white;
	  	}
        #cafe_review1 {
        	margin: 30px;
        	text-align: center;
        }
        .user_review_box {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 170px;
            border: 2px solid #f0dbc8;
            margin:0 10px 10px 0;
            border-radius:5px;
        }

        .review_box1 {
            display: flex;
            display: flex;
            flex-direction: column;
            padding-left: 20px;
        }
        #scores {
            display: flex;
            padding: 10px;
            padding-left: 0px;
            text-align: center;
        }
        .coffee, .dessert, .mood {
            display: flex;
            padding-right: 30px;
            text-align: center;
        }
        .review_box2 {
            align-self: center;
            padding-right: 10px;
        }
        .coffee_score, .dessert_score, .mood_score {
        	padding-left: 5px;
        }
        /* 수정 및 추가 */
        .review_box2 > div{
            width: 100px;
            height: 100px;
            display:inline-block;
        }
        .review_box2 > div > img {
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
		.dropdown.dropdown{
			position:unset;
		}
				
		.review_contents{
		width:650px;
		height:70px;
		overflow-y:auto;
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
	    	background-color:#f0dbc8;
	    	border-radius: 5px;
	    	box-shadow: inset 0px 0px 5px white;
	  	}
		.user {
			padding-top:20px;
			display: inline-block;
			width: 100%;
		}
		
		.rDropdown{
			width:20px;
			position:relative;
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
		.cafe-name{
			padding-bottom: 10px;
		}
		.cafe-name a{
		color:black;

		}
		.cafe-name a:hover{
			text-decoration-line:none;
		}

    </style>
</head>
<body>
    <div id="container">
		<%@ include file="header.jsp" %>
        <div id="cafe_contents">
          <h1>작성 리뷰 목록</h1>
         	<c:if test="${sessionScope.id=='admin'}" >
          		<h3>회원 아이디 : ${param.mem_id }</h3>
          	</c:if>
            <!-- 작성된 카페리뷰 보여주기			 -->
            <div id="review_box">
			<div id="cafe_review1">등록된 리뷰가 없습니다.<i class="fa-regular fa-note-sticky"></i></div>
			<div id="cafe_review2">
            	<c:forEach var="review" items="${reviewList }"  varStatus="status">
					<div class="user_review_box">
	                    <div class="review_box1">
	                        
	                        <div class="user">
	                        <div  class="cafe-name">
	                        	<a href="<c:url value='/cafeInfo?cafe_id=${review.cafe_id }'/>">
									<span><b>카페 명 : ${review.name }</b></span>
								</a>
							</div>
								<c:if test='${idlike[status.index] == 0}'>		
									<span id="thumbsdown${status.index}" data-like='${idlike[status.index]}' data-cno="${status.index}" data-rcno="${review.review_id}">
										<i class="fa-regular fa-thumbs-up"></i>
									</span>
								</c:if>
								<c:if test='${idlike[status.index] != 0}'>
									<span id="thumbsup${status.index}"   data-like='${idlike[status.index]}'   data-cno="${status.index}" data-rcno="${review.review_id}">
										<i class="fa-solid fa-thumbs-up"></i>
									</span>
								</c:if>
								<span id="like"><b>${rvlike[status.index]}&nbsp;</b></span>
								
								<fmt:formatDate var = "today" value="${now}" pattern="yyyy-MM-dd"/>
								<fmt:formatDate var = "r_reg_date" value="${review.r_reg_date}" pattern="yyyy-MM-dd"/>
								<c:choose>
									<c:when test="${ today<=r_reg_date}">
										<td class="r_reg_date">
											<fmt:formatDate value="${review.r_reg_date}" pattern="HH:mm" type="time"/>
											&nbsp;
										</td>
									</c:when>
									<c:otherwise>
										<td class="r_reg_date">
											<fmt:formatDate value="${review.r_reg_date}" pattern="yyyy-MM-dd" type="date"/>
											&nbsp;
										</td>
									</c:otherwise>
								</c:choose>

                                <c:if test="${sessionScope.id=='admin'}" >
                                <div class="rDropdown fa-solid fa-ellipsis-vertical">
                                    <div class="rDropdown-content">
                                        <a class="removeBtn" data-cno="${review.review_id}" data-cafe="${review.cafe_id}"><i class="fa-solid fa-trash"></i> 삭제</a>
                                    </div>
                                </div>
                                </c:if>
                                <c:if test="${review.mem_id == sessionScope.id}" >
                                <div class="rDropdown fa-solid fa-ellipsis-vertical">
                                    <div class="rDropdown-content">
                                        <a class="review_modify" data-cno="${review.review_id}"  data-cafe="${review.cafe_id}"><i class="fa-solid fa-pen"></i> 수정</a>
                                        <a class="removeBtn" data-cno="${review.review_id}" data-cafe="${review.cafe_id}"><i class="fa-solid fa-trash"></i> 삭제</a>
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
	                    	<c:set var="review_img1" value="${review.review_img1 }"/>
	                    	<c:if test="${!empty review_img1 }">
	                    		<div>
                					<a href="${pageContext.request.contextPath}/img/reviewImg/${review.review_img1 }" data-title="image1" data-lightbox="image-set"> 
                                    	<img id="review_img1" src="${pageContext.request.contextPath}/img/reviewImg/${review.review_img1 }">
                                	</a>
                				</div>
                			</c:if>
                			
	                    	<c:set var="review_img2" value="${review.review_img2 }"/>
	                    	<c:if test="${!empty review_img2 }">
	                    		<div>
									<a href="${pageContext.request.contextPath}/img/reviewImg/${review.review_img2 }" data-title="image2" data-lightbox="image-set"> 
										<img id="review_img2" src="${pageContext.request.contextPath}/img/reviewImg/${review.review_img2 }">
									</a>
                				</div>
                			</c:if>
	                    </div>
					</div>
				</c:forEach>
			</div>
			</div>
        </div>
    </div>    
</body>
<script>
	<!-- 리뷰 좋아요 -->
	for(var i=0;i<${reviewList.size()};i++){
		$("#thumbsup"+i).click(function(){
			let review_id=$(this).attr('data-rcno');
			$.ajax({
	            type:'GET',       // 요청 메서드
	            url: '/cdcd/liked?review_id='+review_id,  // 요청 URI
	            success : function(result){ // 요청이 성공일 때 실행되는 이벤트
	            	alert("좋아요가 취소되었습니다.");//**************************
	            	window.location.reload();
	            },
	            error: function(){ alert("좋아요 실패");} 
	        });
		});
		
		
		$("#thumbsdown"+i).click(function(){
			let review_id=$(this).attr('data-rcno');
			$.ajax({
	            type:'GET',       // 요청 메서드
	            url: '/cdcd/likeg?review_id='+review_id,  // 요청 URI
	            success : function(result){ // 요청이 성공일 때 실행되는 이벤트
	            	alert("좋아요 하였습니다.");
	            	window.location.reload();
	            },
	            error: function(){ alert("좋아요 실패");} 
	        });
		});	
	}

	<!-- 작성된 리뷰 display	 -->
	var review_box1 = document.getElementById("cafe_review1");
	var review_box2 = document.getElementById("cafe_review2");

    var reviewDto = `${reviewList}`;
    console.log(reviewDto);	
	
	if(`${reviewList}` == "[]") {
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
        var cafe_id = $(this).attr('data-cafe');
        var review_id = $(this).attr('data-cno');
        console.log(review_id);
        if(!confirm("삭제하시겠습니까?")) return;
        window.location="<c:url value='/reviewList/remove'/>?review_id="+review_id+"&cafe_id="+cafe_id;
    });

     
     <!-- 리뷰 수정 팝업 띄우기 -->
      $(".review_modify").click(function(){
         var review_id = $(this).attr('data-cno');
         console.log(review_id);
         window.open("<c:url value='/read'/>?review_id="+review_id, "new", "scrollbars=no, resizable=no, width=600, height=700, left=600,top=100");
     });
      
</script>
</html>
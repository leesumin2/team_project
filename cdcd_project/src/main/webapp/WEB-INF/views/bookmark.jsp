<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="resources/css/web.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
    <title>즐겨찾기</title>
    
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
        #container #showList {
            width: 800px;
            margin: 20px auto 0 auto;
            display: grid;
            grid-template-columns: 250px 250px 1fr;
            grid-template-rows: 1fr 1fr 1fr;
            grid-gap: 20px 25px;

        }
        .cafe img{
            width: 250px;
            height: 200px;
        }
        .cafe{
            width: 250px;
            text-align: center;
            position: relative;
        }
        .cafe div {
        	position: absolute;
        }
        .cafe:first-of-type{
            margin-bottom: 10px;
        }


        h1{
            text-align: center;
        }
        
        #bookmarkInfo {
        	margin: 30px auto 0px auto;
        	width: 800px;
		    font-family: 'SUIT-Regular';
        }
            
        #deleteAll button {
            background-color: rgba(255, 255, 255, 100);
            border: 0px;
		    font-family: 'SUIT-Regular';
            cursor: pointer;
        }
            
        #bookmarkInfo #deleteAll {
        	text-align: right;
		    font-family: 'SUIT-Regular';
            margin-bottom: 30px;
        }
		#bookmarkInfo #deleteAll a {
        	text-decoration: none;
        	color: black;
        }
        
        #bookmarkList1, #showList {
        	margin: 50px;
        	text-align: center;
		    font-family: 'SUIT-Regular';
            
        }
		.sort_box {
			width: 800px;
			margin: auto;
			padding-bottom: 10px;
			display: flex;
			justify-content: end;
		    font-family: 'SUIT-Regular';
            border-bottom: 1px solid #ccc;
		}
        .delete button {
        	background-color: transparent;
        	border: 0px;
            cursor: pointer;
        }
        .cafe a {
        	text-decoration: none;
        	color: black;
        }
        
    </style>

</head>

<body>
    <div id="container">
<%@ include file="header.jsp" %>
        <h1>즐겨찾기</h1>

        
        <div id="bookmarkList1">등록된 즐겨찾기가 없습니다.</div>
        
		<div id="bookmarkList2">
			<div id="bookmarkInfo">
       			<div id="deleteAll"><button type="button" id="deleteAllbtn">전체 삭제</button></div>
       			<div id="listSize">총 ${cafeList.size() }개의 즐겨찾기</div>
     			<div class="sort_box">

		        </div>
       		</div>
       		<div id="showList">
	        	<c:forEach var="cafeDto" items="${cafeList }">
		            <div class="cafe">
		                <a href="<c:url value='/cafeInfo?cafe_id=${cafeDto.cafe_id }'/>"> <img src="${pageContext.request.contextPath}/img/cafeImg/${cafeDto.cafe_img}"> </a>
		                
		                <div class="delete" data-cafe_id=${cafeDto.cafe_id }>
		                	<button type="button" class="deletebtn" id="${cafeDto.cafe_id }"><i class="fa-solid fa-heart fa-2x" style="color: #a38c77;"></i></button>
		                </div>
		                <a href="<c:url value='/cafeInfo?cafe_id=${cafeDto.cafe_id }'/>"> <label>${cafeDto.cafe_name }</label> </a>
		            </div>
				</c:forEach>
			</div>
        </div>

    </div>
</body>
<script>

	<!-- 즐겨찾기 여부에 따른 display 설정 -->
	var bookmarkList1 = document.getElementById("bookmarkList1");
	var bookmarkList2 = document.getElementById("bookmarkList2");
	if("${cafeList}" == "[]") {
		bookmarkList1.style.display = "display";
		bookmarkList2.style.display = "none";
	} else {
		bookmarkList1.style.display = "none";
		bookmarkList2.style.display = "display";
	}
	
	<!-- 즐겨찾기 전체 삭제	-->
	var requestURL = "${pageContext.request.requestURL}";
	var requestURI = "${pageContext.request.requestURI}";
	var requestPath = requestURL.substr(0, requestURL.length-requestURI.length);
	
	$("#deleteAllbtn").click(function() {
		if (confirm("등록된 즐겨찾기를 모두 삭제하시겠습니까?") == true) {    //확인
			$.ajax({
				url: "/cdcd/bookmarkDeleteAll",
				type: "GET" ,
				success: function(result) {
					if(result == -1) {
						alert("로그인이 필요한 서비스 입니다.");
						window.location = "<c:url value='/Home/login'/>?toURL=" + requestPath + "/cdcd/bookmark";
					} else {
						window.location = "<c:url value='/bookmark'/>";
					}
				},
				error: function() {
					alert("다시 시도해주십시오.")
				}
			});	
		} else {   //취소

		     return false;

		 }
		
	});
	

	
	<!-- 즐겨찾기 개별 삭제	-->
	$(".deletebtn").click(function() {
		var cafe_id = $(this).parent().attr('data-cafe_id');
		$.ajax({
			url: "/cdcd/bookmarkSave?cafe_id="+cafe_id,
			type: "GET" ,
			success: function(result) {
				if(result == -1) {
					alert("로그인이 필요한 서비스 입니다.");
					window.location = "<c:url value='/Home/login'/>?toURL=" + requestPath + "/cdcd/bookmark";
				} else if(result == 0) {
					$("#"+cafe_id).html('<i class="fa-regular fa-heart fa-2x" style="color: #a38c77;"></i>');
				} else {
					$("#"+cafe_id).html('<i class="fa-solid fa-heart fa-2x" style="color: #a38c77;"></i>');
				}
			},
			error: function() {
				alert("다시 시도해주십시오.")
			}
		});
	});
	

</script>
<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
</html>
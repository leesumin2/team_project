<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="resources/css/web.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
    <title>${searchOption.keyword } : 검색 결과</title>
    <style>
    
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
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

        #container #content {
            margin: auto;
        }

		#searchbar {
			margin: auto;
			width: 600px;
			text-align: center;
		}

        #container #content #search-input {
		    font-family: 'SUIT-Regular';
            margin: 40px auto 20px auto;
            height: 50px;
            font-size: 20px;
            border: 1px solid rgb(240, 219, 200);
        }

        #container #content #search-btn {
		    font-family: 'SUIT-Regular';
            margin: 40px auto 20px auto;
            height: 50px;
            width: 100px;
            font-size: 20px;
            background-color: rgb(240, 219, 200);
            border: 1px solid rgb(240, 219, 200);
        }
        .hashtagBtn {
        	margin: auto auto 30px;
			width: 600px;
			display: flex;
			justify-content: space-between;
            text-align: center;
		    font-family: 'SUIT-Regular';
        }
        .hashtagBtn > .btn-primary {
            background-color: rgb(240, 219, 200);
            border: 1px solid rgb(240, 219, 200);
            color: black;
        }
		.sort_box {
			width: 1000px;
			margin: auto;
			padding-bottom: 10px;
			display: flex;
			justify-content: end;
		    font-family: 'SUIT-Regular';
            border-bottom: 1px solid #ccc;
		}
		ntag1, #btntag2, #btntag3, #btntag4, #btntag5, #btntag6, #btntag7, #btntag8 {
            font-size: 15px;
		    font-family: 'SUIT-Regular';
        }
        
        #searchResult1 {
        	text-align: center;
		    font-family: 'SUIT-Regular';
            margin: 100px;
        }
        
        #searchResult2 .searchMSG {
        	text-align: center;
		    font-family: 'SUIT-Regular';
            margin: 50px auto 30px;
        }
        .cfgrid{
            display: grid;
            margin: auto;
            padding: 20px;
            grid-row-gap: 10px;
            grid-column-gap: 20px;
            grid-template-columns: 200px 750px;
            border-bottom: 1px solid #ccc;
            width: 1000px;
		    font-family: 'SUIT-Regular';
        }
        .cfinfo {
        	height: 30px;
        }
        .cfimg{
            width: 200px;
            height: 200px;
        	padding: 0 0 5px;
        }
        
        .cfimg img{
            width: 100%;
            height: 100%;
    		object-fit: cover;
        }
        .cfgrid a {
        	text-decoration: none;
        	color: black;
        }
        #cfname {
        	font-size: 18px;
        	padding-right: 10px;
        }
        input[type="checkbox"] {
        	display: none;
        }
        
        /* style 수정 */
        .cfreview {
        	margin-top: 5px;
        }
        /* 끝 */
        
        .cfreview-list {
        	margin: 5px 0 5px 0;
        	overflow: hidden;
    		white-space: nowrap;
    		text-overflow: ellipsis;
        }
        #cfscore {
        	font-size: 18px;
        	padding: 5px 10px 0 10;
        	color: red;
        }
        #pageNavi {
        	text-align: center;
        }
        pageNavi>pagination>li>a {
        	border: 0px;
        	color: black;
        }
    </style>
</head>

<body>
    <div id="container">
<%@ include file="header.jsp" %>
        <div id="content">
           	<form action="" id="searchbar_content" onsubmit="return optionCheck()">
           		<div id="searchbar" class="input-group">
	                <input class="form-control" id="search-input" name="keyword" type="search" placeholder="동네, 식당 또는 음식을 검색해주세요." value="${searchOption.keyword }">
    				<span class="input-group-btn">
	                	<button class="btn btn-default" id="search-btn">검색</button>
	                </span>
                </div>
                
           	    <input type="checkbox" name="hashtag" id="hashtag1" value="1">
               	<input type="checkbox" name="hashtag" id="hashtag2" value="2">
               	<input type="checkbox" name="hashtag" id="hashtag3" value="3">
               	<input type="checkbox" name="hashtag" id="hashtag4" value="4">
               	<input type="checkbox" name="hashtag" id="hashtag5" value="5">
               	<input type="checkbox" name="hashtag" id="hashtag6" value="6">
               	<input type="checkbox" name="hashtag" id="hashtag7" value="7">
               	<input type="checkbox" name="hashtag" id="hashtag8" value="8">
               	
                <div class="hashtagBtn">             
	               	<input type="button" class="tag1 btn btn-default" value="#예쁜" onclick="optionChange(this)">
	               	<input type="button" class="tag2 btn btn-default" value="#분위기" onclick="optionChange(this)">
	               	<input type="button" class="tag3 btn btn-default" value="#데이트" onclick="optionChange(this)">
	               	<input type="button" class="tag4 btn btn-default" value="#디저트" onclick="optionChange(this)">
	               	<input type="button" class="tag5 btn btn-default" value="#조용한" onclick="optionChange(this)">
	               	<input type="button" class="tag6 btn btn-default" value="#브런치" onclick="optionChange(this)">
	               	<input type="button" class="tag7 btn btn-default" value="#뷰맛집" onclick="optionChange(this)">
	               	<input type="button" class="tag8 btn btn-default" value="#힐링" onclick="optionChange(this)">
                </div>
     
			<div class="sort_box">
				<select name="sort" id="sort" onchange="this.form.submit()">
					<option value="G" ${searchOption.sort == "G" ? "selected='selected'" : "" }>평점순</option>
					<option value="R" ${searchOption.sort == "R" ? "selected='selected'" : "" }>리뷰많은순</option>
					<option value="B" ${searchOption.sort == "B" ? "selected='selected'" : "" }>즐겨찾기순</option>
				</select>
			</div>
		        
			</form>
            
            
            <div id="searchResult1">
            	<h3 class="searchMSG">검색 결과가 없습니다.</h3>
            </div>
            
            <div id="searchResult2">

	            <c:forEach var="searchResultDto" items="${searchResultList }">
	            
		            <div class="cfgrid">
		            
		            	<div class="grid-left">
		            	
			                <div class="cfimg">
			                	<a href="<c:url value='/cafeInfo?cafe_id=${searchResultDto.cafeDto.cafe_id }'/>">
			                		<img src="${pageContext.request.contextPath}/img/cafeImg/${searchResultDto.cafeDto.cafe_img}" alt="">
			                	</a>
			                </div>
			                
			                <div class="cfinfo">
			                	<a href="<c:url value='/cafeInfo?cafe_id=${searchResultDto.cafeDto.cafe_id }'/>">
			                		<span id="cfname">${searchResultDto.cafeDto.cafe_name }</span>
			                	</a>
			                	<i class="fa-solid fa-heart" style="color: #ccc;"></i>
			                	<span>${searchResultDto.bookmarkCnt }</span>
			                </div>
			                
			                <div class="cfaddr">${searchResultDto.cafeDto.cafe_addr1 } ${searchResultDto.cafeDto.cafe_addr2 } ${searchResultDto.cafeDto.cafe_addr3 }</div>
			            
			            </div>
			            
			            
			            <div class="grid-right">
			            
			                <div class="cfhashtag" style=${empty searchResultDto.hashtagList ?  "visibility:hidden;" : "visibility:visible;"}>
			                
				                <c:forEach var="hashtagDto" items="${searchResultDto.hashtagList }">
                   					<input type="button" class="tag${hashtagDto.hashtag_id } btn btn-default" value="#${hashtagDto.hashtag_content }" onclick="onlyHashtag(this)">
		                 		</c:forEach>
		                 		
			                </div>
			                <div class="cfreview">
			                	<div class="cfreview-score">
			                		<i class="fa-solid fa-star" style="color: gold;"></i>
			                		<span id="cfscore">${searchResultDto.cafeDto.total_avg }</span>
			                		<span>(${fn:length(searchResultDto.reviewList) })</span>
			                	</div>
			               		<div class="cfreview-list">
			               			<!-- 수정 -->
					                <c:forEach var="reviewDto" items="${searchResultDto.reviewList }" end="4">
					                <!-- 끝 -->
						                
						                <div class="cfreview-content">
						                	<p>${reviewDto.review_content }</p>
						                </div>
						                
						            </c:forEach>
				            	</div>
				            </div>
			            </div>
			            
		            </div>
				</c:forEach>

            </div>
             
            <div id="pageNavi">
		  		<ul class="pagination">
			   		<c:if test="${ph.showPrev }">
			   			<li><a href = "<c:url value='/searchResult${ph.so.getQueryString(ph.beginPage-1) }'/>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			   		</c:if>
			   		<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
			    		<li><a href = "<c:url value='/searchResult${ph.so.getQueryString(i) }'/>">${i }</a></li>
			   		</c:forEach>
			   		<c:if test="${ph.showNext }">
			   			<li><a href = "<c:url value='/searchResult${ph.so.getQueryString(ph.endPage+1) }'/>">&raquo;</a></li>
			   		</c:if>
			   	</ul>
   			</div>
             
        </div>

        
    </div>
</body>
<script type="text/javascript">


	<!-- 결과창 셋팅 -->
	window.onload = function() {
		
		<!-- 클릭한 해시태그 값 읽기 -->	
		let tag = ${searchOption.hashtag}
		
		if(tag.length != 0){

			for(let i=0; i<tag.length; i++) {
				document.getElementById("hashtag"+tag[i]).checked = true;
				document.querySelector(".hashtagBtn").children.item(tag[i]-1).classList.replace("btn-default", "btn-primary");
			}
			
		}
		
		<!-- 검색 결과 유무에 따른 결과창 화면 -->		
		var searchResult1 = document.getElementById("searchResult1");
		var searchResult2 = document.getElementById("searchResult2");
		
		/* 수정 */
		if(`${searchResultList}` == "[]") {
		/* 끝 */
			searchResult1.style.display = "display";
			searchResult2.style.display = "none";
		} else {
			searchResult1.style.display = "none";
			searchResult2.style.display = "display";
		}
		
	}


	
	<!-- form 전송 전 입력된 데이터 체크 -->
	function optionCheck() {
		
		let input_text = document.getElementById("search-input");
		let checkbox = document.querySelectorAll('input[type="checkbox"]');
		let check_true = 0;

		if(!input_text.value) {
			
			for(let i=0; i<checkbox.length; i++) {
				if(checkbox[i].checked == true) {
					check_true += 1;
				}
			}
			
			if(check_true > 0) {
				return true;
			}
			else {
				alert("동네, 식당 또는 음식을 검색해주세요. 키워드가 생각나지 않는다면 제공된 해시태그를 검색해보세요.");
				return false;
			}
		}
		else {
			return true;
		}
	}

	<!-- 카페 리스트에서 해시태그 선택 -->
	function optionChange(clickLabel) {
		console.log(clickLabel);
		let tag = document.getElementById("hash"+clickLabel.classList.item(0));
		let input_text = document.getElementById("search-input");
		
		if(tag.checked == false) {
			tag.checked = true;
			document.getElementById("searchbar_content").submit(optionCheck());
		}
		else {
			tag.checked = false;
			
			if(!optionCheck()) {
				tag.checked = true;
			}
			else {
				document.getElementById("searchbar_content").submit();
			}
		}
				
	}
	
	/* 해시태그만 검색 */
	function onlyHashtag(clickLabel) {
		document.getElementById("search-input").value = "";
		optionChange(clickLabel);
	}


</script>
</html>

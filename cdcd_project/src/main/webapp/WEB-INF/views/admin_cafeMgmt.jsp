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
	<link href="../resources/css/web.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
    <title> 카페 정보 관리 </title>
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
            margin-top: 50px;
            margin-left: 300px;
            margin-right: 300px;
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
        	margin: 10px auto 30px;
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
		#btntag1, #btntag2, #btntag3, #btntag4, #btntag5, #btntag6, #btntag7, #btntag8 {
            font-size: 15px;
		    font-family: 'SUIT-Regular';
        }
        input[type="checkbox"] {
        	display: none;
        }
        
        #cafe_contents h2 {
		    text-align: center;
        }
        .btn_group {
        	margin-bottom: 10px;
        	display: flex;
        	justify-content: space-between;
        }
           
        #searchFail {
        	text-align: center;
		    font-family: 'SUIT-Regular';
            margin: 100px;
        }
        
        #list-group .searchMSG {
        	text-align: center;
		    font-family: 'SUIT-Regular';
            margin: 50px auto 30px;
        }     
        #cafe-list th {
        	background-color: #ccc;
        	text-align: center;
        }
        #cafe-list td {
        	vertical-align: middle;
        }
        #cafe-list #col1 {
        	text-align: center;
        	width: 50px;
        }
        #cafe-list .colgroup {
        	text-align: center;
        }
        #pageNavi {
        	text-align: center;
        }
        #pageNavi>.pagination>li>a {
        	color: black;
        }
        #searchbar button {
        	background-color: #fff;
        	border: 1px solid #ccc;
        	color: black;
        }
        i {
        	color: #ccc;
        }
    </style>
</head>
<body>

	<%@ include file="header.jsp" %>
	
    <div id="container">

        <div id="cafe_contents">
        
			<form action="" method="POST" id="searchbar_content">
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
		        
			</form>
            <h2>카득카득 카페 관리</h2>
            <div class="btn_group">
				<button id="listAllBtn" class="btn btn-default" onclick="location.href='/cdcd/admin/cafeMgmt'" style=${ph.so.keyword == "" && empty ph.so.hashtag ? "visibility:hidden;" : "visibility:visible;"}>전체리스트 보기</button>
	            <button type="button" class="btn btn-default" onclick="location.href='/cdcd/admin/cafeMgmt/insert'">등록</button>
            </div>
            
            <div id="searchFail">
            	<h3 class="searchMSG">검색 결과가 없습니다.</h3>
            </div>
            
        
            <div id="list-group">
            	<table id="cafe-list" class="table table-hover">
            		<tr>
			    		<th>번호</th>
			    		<th>카페 이름</th>
			    		<th>카페 주소</th>
			    		<th>전화번호</th>
			    		<th>SNS</th>
			    		<th>수정 / 삭제</th>
            		</tr>
            		
		            	<c:forEach var="cafeDto" items="${cafeList }">
		            		<tr >
			            		<td class="colgroup">${cafeDto.cafe_id }</td>
			            		<td class="colgroup">${cafeDto.cafe_name }</td>
			            		<td class="colgroup">${cafeDto.cafe_addr1 } ${cafeDto.cafe_addr2 } ${cafeDto.cafe_addr3 }</td>
			            		<td class="colgroup">${cafeDto.cafe_num }</td>
			            		<td class="colgroup">
			            			<c:if test="${!empty cafeDto.cafe_info}">
			            				<a id="cafe_sns" href="http://${cafeDto.cafe_info }" target="blank"><i class="fa-brands fa-instagram fa-2x"></i></a>
			            			</c:if>
			            		</td>
			            		<td class="colgroup" data-cafeId="${cafeDto.cafe_id }">
			            			<button type="button" class="btn btn-default" onclick="location.href='/cdcd/admin/cafeMgmt/update?cafe_id=${cafeDto.cafe_id}'">수정</button>
			    					<button type="button" class="deleteBtn btn btn-default">삭제</button>
			            		</td>
			            	</tr>	
		            	</c:forEach>
				</table>
				<div id="pageNavi">
			  		<ul class="pagination">
				   		<c:if test="${ph.showPrev }">
				   			<li><a href = "<c:url value='/admin/cafeMgmt${ph.so.getQueryString(ph.beginPage-1) }'/>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
				   		</c:if>
				   		<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
				    		<li><a href = "<c:url value='/admin/cafeMgmt${ph.so.getQueryString(i) }'/>">${i }</a></li>
				   		</c:forEach>
				   		<c:if test="${ph.showNext }">
				   			<li><a href = "<c:url value='/admin/cafeMgmt${ph.so.getQueryString(ph.endPage+1) }'/>">&raquo;</a></li>
				   		</c:if>
				   	</ul>
   				</div>		
			</div>
			
            
           
        </div>
    </div>    
</body>

<script>

	<!-- 결과창 셋팅 -->
	window.onload = function() {
		var requestURL = "${pageContext.request.requestURL}";
		var requestURI = "${pageContext.request.requestURI}";
		var requestPath = requestURL.substr(0, requestURL.length-requestURI.length);
		if("${notAdmin}" == "notAdmin") {
			alert("관리자만 접근 가능한 페이지입니다.");
			window.location = "<c:url value='/Home/login'/>?toURL=" + requestPath +"/cdcd/admin/cafeMgmt";
		}
		
		<!-- 클릭한 해시태그 값 읽기 -->	
		let tag = ${searchOption.hashtag}
		
		if(tag.length != 0){
	
			for(let i=0; i<tag.length; i++) {
				document.getElementById("hashtag"+tag[i]).checked = true;
				document.querySelector(".hashtagBtn").children.item(tag[i]-1).classList.replace("btn-default", "btn-primary");
			}
			
		}
		
		<!-- 검색 결과 유무에 따른 결과창 화면 -->		
		var searchResult1 = document.getElementById("searchFail");
		var searchResult2 = document.getElementById("list-group");
		
		if(`${cafeList}` == '[]') {
			searchResult1.style.display = "display";
			searchResult2.style.display = "none";
		} else {
			searchResult1.style.display = "none";
			searchResult2.style.display = "display";
		}
		
	}


	<!-- 삭제 데이터 전송	-->
	$(".deleteBtn").click(function() {
		if (confirm("해당 카페 정보를 삭제하시겠습니까?") == true) {    //확인
			let cafe_id = $(this).parent().attr('data-cafeId');
			let page = ${ph.so.getPage()};
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



	<!-- 카페 리스트에서 해시태그 선택 -->
	function optionChange(clickLabel) {
		console.log(clickLabel);
		let tag = document.getElementById("hash"+clickLabel.classList.item(0));
		let input_text = document.getElementById("search-input");
		
		if(tag.checked == false) {
			tag.checked = true;
			document.getElementById("searchbar_content").submit();
		}
		else {
			tag.checked = false;
			document.getElementById("searchbar_content").submit();
		}
	}
	
	/* 해시태그만 검색 */
	function onlyHashtag(clickLabel) {
		document.getElementById("search-input").value = "";
		optionChange(clickLabel);
	}

	
</script>
</html>
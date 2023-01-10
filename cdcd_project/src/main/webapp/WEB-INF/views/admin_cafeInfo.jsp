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
	<link href="../../resources/css/web.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
    <title> 카득카득 : ${option == "insert" ? "카페" : {cafeDto.cafe_name} } 정보 ${option == "insert" ? "등록" : "수정/삭제" } </title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}


        #cafeInfo_contents {
		    font-family: 'SUIT-Regular';
            margin: 10px auto auto;
            width: ${option == "insert" ? "590px" : "1000px" };
        }
        #cafe_title {
            display: flex;
            align-items: center;
    		margin: 50px 0 20px;
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
        	padding: 0 5px;
			height: 30px;
        }
		#mgmtBtn {
            text-align: right;
		}
		#mgmtBtn button{
            background-color: rgb(240, 219, 200);
            border: 1px solid rgb(240, 219, 200);
            color: black;
		    font-family: 'SUIT-Regular';
		}
        #cafeInfo_detail {
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
        #cafe_img {
            text-align: ${option == "insert" ? "center" : "left" };
        }
        #cafe_img_item {
            width: 200px;
            height: 200px;
            text-align: center;
        }
        #cafe_img_item>img {
            width: 100%;
            height: 100%;
    		object-fit: cover;
		}
        #cafe_img_item>div {
            width: 200px;
            height: 200px;
            text-align: center;
            vertical-align: middle;
		}
        input[type="file"] {
        	padding: 5px 0 0;
        	width: 200px;
            margin: ${option == "insert" ? "auto" : "0" };
        }
        input[type="file"]::file-selector-button {
		    font-family: 'SUIT-Regular';
        }
        #hashTag {
            padding: 20px 0;
        }
        .hashTagBtn {
            background-color: #f0dbc8;
            border: 1px solid #f0dbc8;
            border-radius: 5px;
            font-size: 16px;
		    font-family: 'SUIT-Regular';
        }
        #hashTag > .btn-primary {
            background-color: rgb(240, 219, 200);
            border: 1px solid rgb(240, 219, 200);
            color: black;
        }
        input[type="checkbox"] {
        	display: none;
        }
        input:checkd + label {
        	background-color: #ccc;
        }
        #cafeInfo_detail_contents {
            text-align: left;
            padding-left: 20px;
        }
        #cafeInfo_detail_contents th {
            width: 100px;
            padding: 0 20px 20px 0;
            line-height: 30px;
            vertical-align: baseline
        }
        #cafeInfo_detail_contents td {
            padding-bottom: 20px;
        }
        #cafeInfo_detail_contents input {
        	height: 30px;
        	padding: 0 5px;
        }
        #cafe_addr1, #cafe_addr2 {
        	width: 120px;
        }
        #cafe_addr4 {
        	margin-top: 5px;
        	width: 245px;
        }
        #cafe_num {
        	width: 245px;
        }
        #cafe_sns {
        	width: 390px;
        }
        #cafe_open, #cafe_close {
        	height: 24px;
        	width: 115px;
        }
        #cafe_sns i {
            text-decoration: none;
            color: #a38c77;
            padding-right: 20px;
        }
        #menu-price {
        	width: 100px;
        }
        .menu_item {
        	padding: 0 0 5px;
        }
        .menu_signature {
        	width: 170px;
        }
        .menu_price {
        	width: 70px;
        	text-align: right;
        }
        #menu_list span {
        	padding: 0 5px 0 5px;
        }
        #menu_add_btn {
        	padding: 0 0 5px;
        }
    </style>
</head>
<body>

	<%@ include file="header.jsp" %>

    <div id="container">
		
		
        <form id="cafeInfo_contents" action="" enctype="multipart/form-data" method="POST">
            <input type="hidden" name="cafe_id" id="cafe_id" value="${cafeDto.cafe_id }">
            <div id="cafe_title" class="page-header">
                <div id="bookmark">
                	<i class="fa-solid fa-heart fa-2x" style="color: #ccc;"></i>
                </div>
                <input type="text" id="cafe_name" name="cafe_name" id="cafe_name" value="${cafeDto.cafe_name }" required placeholder="카페명">
                
                <!-- 카페 별점 -->
	            <div id="cafe_grade_box" style='${option == "insert" ? "display:none;" : "display:display;"}'>
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
	            </div>
	            <div id="mgmtBtn">
					<button type="button" id='${option == "insert" ? "insertBtn" : "updateBtn" }' class="btn btn-default">${option == "insert" ? "등록" : "수정" }</button>
				    <button type="button" id="deleteBtn" style='${option == "insert" ? "display:none;" : "display:display;"}' class="btn btn-info">삭제</button>
				</div>
            </div>
            <div id="cafe_img">
	            <label for="file_upload" id="cafe_img_item">
	                <img id="cafe_img_file" src="${pageContext.request.contextPath}/img/cafeImg/${cafeDto.cafe_img }">
	            </label>
                <input type="file" name="file_upload" id="file_upload" accept="image/png, image/jpeg, image/jpg" onchange="handleFiles(this)">
                <input type="hidden" name="cafe_img" value="${cafeDto.cafe_img }">
	        </div>
            <div id="cafeInfo_detail">
                <div id="hashTag">
               		<c:forEach var="tag" items="${hashtagAll.hashtagList }" varStatus="i">
	           	    
		           	    <input type="checkbox" name="hashtagList[${i.index }].hashtag_id" id="hashtag${tag.hashtag_id }" value="${tag.hashtag_id }">
		           	    <input type="checkbox" name="hashtagList[${i.index }].cafe_hashtag_id" id="cafe_hashtag${tag.hashtag_id }" value="">
		           	    <input type="hidden" name="hashtagList[${i.index }].cafe_id" value="${cafeDto.cafe_id }">
		               	<input type="button" id="tag${tag.hashtag_id }" class="btn btn-default" value="#${tag.hashtag_content }" onclick="optionChange(this)">
		            
     				</c:forEach>   	
                </div>
                <table id="cafeInfo_detail_contents">
                    <tr>
                        <th>주소</th>
                        <td>
                        	<div>
	                        	<input type="text" name="cafe_addr1" id="cafe_addr1" value="${cafeDto.cafe_addr1 }" required placeholder="충북 청주시">
	                        	<input type="text" name="cafe_addr2" id="cafe_addr2" value="${cafeDto.cafe_addr2 }" required placeholder="흥덕구">
	                        	<input type="text" name="cafe_addr3" id="cafe_addr3" value="${cafeDto.cafe_addr3 }" required placeholder="주봉로15번길 11">
	                        </div>
	                        <div>
                        		<input type="text" name="cafe_addr4" id="cafe_addr4" value="${cafeDto.cafe_addr4 }" placeholder="(지번 주소)">
                        	</div>
                        </td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" name="cafe_num" id="cafe_num" value="${cafeDto.cafe_num }" required placeholder="'-' 제외"></td>
                    </tr>
                    <tr>
                        <th>영업시간</th>
    					<td>
    						<input type="time" name="cafe_open" id="cafe_open" value="<fmt:formatDate value="${cafeDto.cafe_open }" pattern="HH:mm" type="time"/>"> ~ 
    						<input type="time" name="cafe_close" id="cafe_close" value="<fmt:formatDate value="${cafeDto.cafe_close }" pattern="HH:mm" type="time"/>">
    					</td>
                    </tr>
                    <tr>
                        <th>SNS</th>
                        <td>http://<input id="cafe_sns" name="cafe_info" type="text" value="${cafeDto.cafe_info }" placeholder="카페 SNS 주소"></td>
                    </tr>
                    <tr>
                        <th>메뉴</th>
                       	<td>
                       		<div id="menu_list">
                        		<c:forEach var="menu" items="${menuDto }" varStatus="i">
                        		<div class="menu_item">
                        			<input type="hidden" name="menuList[${i.index}].menu_id" class="menu_id" value="${menu.menu_id }">
                        			<input type="hidden" name="menuList[${i.index}].cafe_id" class="cafe_id" value="${menu.cafe_id }">
                        			<input type="text" name="menuList[${i.index}].menu_signature" class="menu_signature" value="${menu.menu_signature }">
                        			<input type="text" name="menuList[${i.index}].menu_price" class="menu_price" value="${menu.menu_price }"><span>원</span>
                        			<i class="fa-solid fa-square-minus" onclick="menu_delete(this)"></i>
                        		</div>
                        		</c:forEach>
                       		</div>
                       		<div id="menu_add_btn">
                        		<i class="fa-solid fa-square-plus" onclick="menu_add()"></i>
                        	</div>
                       	</td>
                    </tr>
                </table>
            </div>
           
        </form>
    </div>    
</body>

<script>	
	<!-- 해당 페이지 호출 시 셋팅 값 -->
	window.onload = function() {

		var requestURL = "${pageContext.request.requestURL}";
		var requestURI = "${pageContext.request.requestURI}";
		var requestPath = requestURL.substr(0, requestURL.length-requestURI.length);
		if("${notAdmin}" == "notAdmin") {
			alert("관리자만 접근 가능한 페이지입니다.");
			window.location = "<c:url value='/Home/login'/>?toURL=" + requestPath +"/cdcd/admin/cafeInfo";
		}
		
		<!-- db에 등록된 해시태그 값 읽기 -->

		 <c:forEach var="tag" items="${hashtagDto}">
			document.getElementById("hashtag"+${tag.hashtag_id}).checked = true;
			document.getElementById("cafe_hashtag"+${tag.hashtag_id}).checked = true;
			document.getElementById("cafe_hashtag"+${tag.hashtag_id}).defaultValue = ${tag.cafe_hashtag_id};
			document.getElementById("tag"+${tag.hashtag_id}).classList.replace("btn-default", "btn-primary");
		 </c:forEach>
		 
		<!-- 등록된 메뉴 없는 경우 메뉴 입력란 기본 1줄 보이도록 -->
		if(document.getElementById("menu_list").children.length == 0) {
			menu_add();
		}
	}

	<!-- 리뷰 작성 팝업 띄우기 -->
	function review_write() {
		window.open("<c:url value='/review_write'/>", "new", "scrollbars=no, resizable=no, width=600, height=700, left=600,top=100");
	}


	<!-- 등록할 해시태그 선택 -->
	function optionChange(clickLabel) {
		console.log(clickLabel);
		let tag = document.getElementById("hash"+clickLabel.id);
		let cafe_tag = document.getElementById("cafe_hash"+clickLabel.id);
		
		if(tag.checked == false) {
			tag.checked = true;
			tag.value = tag.defaultValue;
			
			cafe_tag.checked = true;
			cafe_tag.value = cafe_tag.defaultValue;
			
			clickLabel.classList.replace("btn-default", "btn-primary");
		}
		else {
			tag.checked = false;
			tag.value = "";
			
			cafe_tag.checked = false;
			cafe_tag.value = "";
			clickLabel.classList.replace("btn-primary", "btn-default");
		}
				
	}
	
	
	<!-- 등록 데이터 전송	-->
	$("#insertBtn").click(function() {

	
		if (confirm("입력된 정보로 등록하시겠습니까?") == true) {    //확인

			let frm = $("#cafeInfo_contents")[0];
			let frmData = new FormData(frm);
			$.ajax({
				url			: "/cdcd/admin/cafeMgmt/insert",
				type		: "POST",
				cache		: false,
				contentType : false,
				processData : false,
                data		: frmData,						
				success: function(result) {
					alert("카페정보가 등록되었습니다.");
					window.location = result + "${ph.so.getQueryString(ph.so.getPage()) }";
				},
				error: function() {
					alert("다시 시도해주십시오.");
				}
			});	
		} else {   //취소
		     return false;
		}
	});

	
	<!-- 수정 데이터 전송	-->
	$("#updateBtn").click(function() {
		if (confirm("변경된 정보로 저장하시겠습니까?") == true) {    //확인

			let frm = $("#cafeInfo_contents")[0];
			let frmData = new FormData(frm);
			let cafe_id = $("#cafe_id").val();
			$.ajax({
				url			: "/cdcd/admin/cafeMgmt/update",
				type		: "POST",
				cache		: false,
				contentType : false,
				processData : false,
                data		: frmData,						
				success: function(result) {
					alert("카페정보가 수정되었습니다.");
					window.location = result;
				},
				error: function() {
					alert("다시 시도해주십시오.");
				}
			});	
		} else {   //취소
		     return false;
		}
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

	
	<!-- 이미지 파일 선택 후 미리보기 -->
	function handleFiles(input) {
		let selectFile = input.files;
		let fileReader = new FileReader();
		
		fileReader.readAsDataURL(selectFile[0]);
		
		fileReader.onload = function() {
			document.getElementById("cafe_img_file").src = fileReader.result;
		}
	}
		
	<!-- 메뉴 추가 -->
	function menu_add() {
		let menu_item = document.createElement("div");
		menu_item.setAttribute("class", "menu_item");
		let size = document.getElementsByClassName("menu_item").length;
		
		let menu_id = document.createElement("input");
		menu_id.setAttribute("type", "hidden");		
		menu_id.setAttribute("name", "menuList["+(size)+"].menu_id");
		menu_id.setAttribute("class", "menu_id");
		
		let cafe_id = document.createElement("input");
		cafe_id.setAttribute("type", "hidden");
		cafe_id.setAttribute("name", "menuList["+(size)+"].cafe_id");
		cafe_id.setAttribute("value", "${cafeDto.cafe_id}");
		cafe_id.setAttribute("class", "cafe_id");

		let menu_signature = document.createElement("input");
		menu_signature.setAttribute("type", "text");		
		menu_signature.setAttribute("name", "menuList["+(size)+"].menu_signature");
		menu_signature.setAttribute("class", "menu_signature");
		menu_signature.setAttribute("placeholder", "메뉴");
		
		let menu_price = document.createElement("input");
		menu_price.setAttribute("type", "text");
		menu_price.setAttribute("name", "menuList["+(size)+"].menu_price");
		menu_price.setAttribute("class", "menu_price");
		menu_price.setAttribute("placeholder", "가격");
		
		let won = document.createElement("span");
		won.appendChild(document.createTextNode("원"));
		
		let del = document.createElement("i");
		del.setAttribute("class", "fa-solid fa-square-minus");
		del.setAttribute("onclick", "menu_delete(this)");

		menu_item.appendChild(menu_id);
		menu_item.appendChild(cafe_id);
		menu_item.appendChild(menu_signature);
		menu_item.appendChild(menu_price);
		menu_item.appendChild(won);
		menu_item.appendChild(del);
		document.getElementById("menu_list").appendChild(menu_item);
	}

	<!-- 메뉴 삭제 버튼 display -->
	function menu_delete(item) {
		item.parentElement.remove();
		
		if(document.getElementById("menu_list").children.length == 0) {
			menu_add();
		}
	}
	


</script>
</html>
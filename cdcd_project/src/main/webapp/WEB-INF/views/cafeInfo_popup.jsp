<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
	
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
		    font-family: 'SUIT-Regular';
}

#cafe_title {
	text-align: center;
	color: #a38c77;
	/* padding-top: 10px; */
	padding-bottom: 5px;
}

#review {
	width: 500px;
	margin: auto;
	padding: 20px;
	display: flex;
	flex-direction: column;
}

#review textarea {
	resize: none;
	padding: 15px;
	font-size: 15px;
}

.star {
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.0rem;
	margin: 0 10px;
	justify-content: space-around;
	width: 5em;
	padding-bottom: 20px;
}

.star input {
	display: none;
}

.star .c:disabled {
	font-size: 0.9em; /* 이모지 크기 */
	color: transparent; /* 기존 이모지 컬러 제거 */
	text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

.star label {
	font-size: 0.9em; /* 이모지 크기 */
	color: transparent; /* 기존 이모지 컬러 제거 */
	text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
	cursor: pointer;
}

.star label:hover {
	text-shadow: 0 0 0 yellow; /* 마우스 호버 */
}

.star label:hover ~ label {
	text-shadow: 0 0 0 yellow; /* 마우스 호버 뒤에오는 이모지들 */
}

.star input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 yellow; /* 마우스 클릭 체크 */
}

.star input:disabled {
	font-size: 0.9em; /* 이모지 크기 */
	color: transparent; /* 기존 이모지 컬러 제거 */
	text-shadow: 0 0 0 #f0f0f0;
}

.c
#review_contents {
	height: 300px;
	overflow-x: auto;
	overflow-y: scroll;
	border: 1px solid #a38c77;
}

#review_img {
	padding-top: 20px;
	padding-bottom: 10px;
	font-size: 15px;
}

#review_img input[type="file"] {
	font-size: 15px;
	border: 1px solid #a38c77;
	border-left: 0px;
	border-radius: 5px;
	width: 100%;
	margin-bottom: 5px;
}

#review_img input[type="file"]::-webkit-file-upload-button {
	border: 1px solid #a38c77;
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
	background-color: #a38c77;
		    font-family: 'SUIT-Regular';
	color: #fff;
	font-size: 15px;
}

#review_img #uploadFile2 {
	margin-top: 10px;
}

#coffee, #dessert, #mood {
	display: flex;
	justify-content: center;
}

#coffee_score, #dessert_score, #mood_score {
	display: flex;
}

#coffee_score div, #dessert_score div, #mood_score div {
	padding-right: 20px;
}

.score_name {
	width: 160px;
}

#btn {
	text-align: right;
}

input[type="button"]:not(.imgDelBtn) {
	width: 100px;
	height: 40px;
	background-color: #f0dbc8;
	border: 0px;
	border-radius: 5px;
	font-size: 16px;
}

#ch {
	text-align: center;
	color: red;
}

.imgDelBtn {
	width: 35px;
	height: 22px;
	font-size: 13px;
	float: right;
	border: 0px;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div id="container">
		<!-- action="<c:url value='/cafeInfo'/>" method="post" onsubmit="return formCheck(this);"-->
		<form id="review" enctype="multipart/form-data"
			onsubmit="return formCheck(this);">
			<h1 id="cafe_title">리뷰 ${mode=="new"?"작성":"수정"}하기</h1>
			<textarea name="review_content" id="review_contents" cols="70"
				rows="10" placeholder="리뷰를 작성해주세요">${reviewDto.review_content }</textarea>
			<div id="review_img">
				<input type="file" name="uploadFile" id="uploadFile" /> <i
					class="fa-solid fa-camera"></i> <label for="uploadFile"
					id="fileName1"> ${reviewDto.review_img1} </label> <input
					type="button" id="img_del1" class="imgDelBtn" value="삭제" /> <input
					type="file" name="uploadFile2" id="uploadFile2" /> <i
					class="fa-solid fa-camera"></i> <label for="uploadFile2"
					id="fileName2"> ${reviewDto.review_img2} </label> <input
					type="button" id="img_del2" class="imgDelBtn" value="삭제" />
			</div>
			<div class="scores">
				<div id="coffee">
					<div class="score_name">커피 맛은 어떤가요?</div>
					<div id="coffee_score">
						<div class="star">
							<input type="radio" name="c_rating" value="5" id="c_rate5"
								${reviewDto.coffee_score==5?"checked":""}> <label
								class="c" for="c_rate5">⭐</label> <input type="radio"
								name="c_rating" value="4" id="c_rate4"
								${reviewDto.coffee_score==4?"checked":""}> <label
								class="c" for="c_rate4">⭐</label> <input type="radio"
								name="c_rating" value="3" id="c_rate3"
								${reviewDto.coffee_score==3?"checked":""}> <label
								class="c" for="c_rate3">⭐</label> <input type="radio"
								name="c_rating" value="2" id="c_rate2"
								${reviewDto.coffee_score==2?"checked":""}> <label
								class="c" for="c_rate2">⭐</label> <input type="radio"
								name="c_rating" value="1" id="c_rate1"
								${reviewDto.coffee_score==1?"checked":""}> <label
								class="c" for="c_rate1">⭐</label>
						</div>
						<div>
							<label><input type="checkbox" name="no_coffee"
								id="no_coffee">참여안함</label>
						</div>
					</div>
				</div>
			</div>
			<div class="scores">
				<div id="dessert">
					<div class="score_name">디저트 맛은 어떤가요?</div>
					<div id="dessert_score">
						<div class="star">
							<input type="radio" name="d_rating" value="5" id="d_rate5"
								${reviewDto.dessert_score==5?"checked":""}> <label
								class="d" for="d_rate5">⭐</label> <input type="radio"
								name="d_rating" value="4" id="d_rate4"
								${reviewDto.dessert_score==4?"checked":""}> <label
								class="d" for="d_rate4">⭐</label> <input type="radio"
								name="d_rating" value="3" id="d_rate3"
								${reviewDto.dessert_score==3?"checked":""}> <label
								class="d" for="d_rate3">⭐</label> <input type="radio"
								name="d_rating" value="2" id="d_rate2"
								${reviewDto.dessert_score==2?"checked":""}> <label
								class="d" for="d_rate2">⭐</label> <input type="radio"
								name="d_rating" value="1" id="d_rate1"
								${reviewDto.dessert_score==1?"checked":""}> <label
								class="d" for="d_rate1">⭐</label>
						</div>
						<div>
							<label><input type="checkbox" name="no_dessert"
								id="no_dessert">참여안함</label>
						</div>
					</div>
				</div>
			</div>
			<div class="scores">
				<div id="mood">
					<div class="score_name">분위기는 어떤가요?</div>
					<div id="mood_score">
						<div class="star">
							<input type="radio" name="m_rating" value="5" id="m_rate5"
								${reviewDto.mood_score==5?"checked":""}> <label
								class="m" for="m_rate5">⭐</label> <input type="radio"
								name="m_rating" value="4" id="m_rate4"
								${reviewDto.mood_score==4?"checked":""}> <label
								class="m" for="m_rate4">⭐</label> <input type="radio"
								name="m_rating" value="3" id="m_rate3"
								${reviewDto.mood_score==3?"checked":""}> <label
								class="m" for="m_rate3">⭐</label> <input type="radio"
								name="m_rating" value="2" id="m_rate2"
								${reviewDto.mood_score==2?"checked":""}> <label
								class="m" for="m_rate2">⭐</label> <input type="radio"
								name="m_rating" value="1" id="m_rate1"
								${reviewDto.mood_score==1?"checked":""}> <label
								class="m" for="m_rate1">⭐</label>
						</div>
						<div>
							<label><input type="checkbox" name="no_mood" id="no_mood">참여안함</label>
						</div>
					</div>
				</div>
			</div>

			<!-- 카페ID, 이미지 -->
			<input type="text" name="review_id" value="${reviewDto.review_id}"
				style="display: none"> <input type="text" name="cafe_id"
				value="${param.cafe_id}" style="display: none"> <input
				type="text" id="review_img1" name="review_img1"
				value="${reviewDto.review_img1}" style="display: none"> <input
				type="text" id="review_img2" name="review_img2"
				value="${reviewDto.review_img2}" style="display: none"> <input
				type='hidden' name="del" id="del" value=0> <input
				type='hidden' name="del2" id="del2" value=0>
			<!-- 별점 -->
			<input type="hidden" id="score1" data-check="1" name="coffee_score"
				value="${reviewDto.coffee_score }"> <input type="hidden"
				id="score2" data-check="1" name="dessert_score"
				value="${reviewDto.dessert_score }"> <input type="hidden"
				id="score3" data-check="1" name="mood_score"
				value="${reviewDto.mood_score }">
			<!-- 미입력시 메세지 창 -->
			<div id="ch">
				<c:if test="${not empty param.ch}">
					<i class="fa fa-exclamation-circle">${URLDecoder.decode(param.ch)}</i>
				</c:if>
			</div>
			<!-- 등록, 취소 -->
			<div id="btn">
				<!-- 타입 버튼으로. -->
				<input type="button" id="sub" class="btn" value="작성"> <input
					type="button" id="mod" class="btn" value="수정"> <input
					type="button" value="취소" onClick='window.close()'>
			</div>
		</form>
	</div>
</body>
<script src="https://kit.fontawesome.com/d0bb457ba4.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
let msg = "${msg}";
var submitted = '${submitted}';

if(msg =='write_ok'){
	alert("리뷰 등록이 완료되었습니다.")
	window.opener.location.reload(); 
    window.close();	
}else if(msg =='write_error'){
	alert("리뷰 등록을 실패하였습니다.")
	window.opener.location.reload(); 
	window.close();	
}else if(msg == 'modify_ok'){
	alert("리뷰 수정이 완료되었습니다.")
	window.opener.location.reload(); 
 	window.close();
}else if(msg == 'modify_error'){
	alert("리뷰 수정에 실패하였습니다.")
	window.opener.location.reload(); 
	window.close();	
}

/* 이미지 삭제 버튼 display */

var img_del1 = document.getElementById("img_del1");
var img_del2 = document.getElementById("img_del2");
if($('#filename1').text().length==0){
	img_del1.style.display="none";
}
if($('#filename2').text().length==0){
	img_del2.style.display="none";
}

/* 등록 작성 버튼 display */
 var mode = '${mode}';
 if(mode == "new"){
	 document.getElementById('mod').style.display="none";
 }else{
	 document.getElementById('sub').style.display="none";
	 if('${reviewDto.review_img1}'!=0){
	 	$('#img_del1').css('display',"inline-block");
	 }
	 if('${reviewDto.review_img2}'!=0){
	 	$('#img_del2').css('display',"inline-block");
	 }
 }

/***********************************
	등록, 수정, 이미지 삭제 버튼 클릭 했을 때!
************************************/

$(document).ready(function(){
	$('#uploadFile').on('change', function(){
		$('#fileName1').text($(this).val());
		$('#img_del1').css('display',"inline-block");
	});
	$('#uploadFile2').on('change', function(){
		$('#fileName2').text($(this).val());
		$('#img_del2').css('display',"inline-block");
	});
	
	let regex = new RegExp("(.*)\.(exe|sh|zip|alz)$");
	// 파일이름 .  exe|sh|zip|alz 인 경우를 체크함
	let maxSize =5242880; // 5Mb
	function checkExtension(fileName, fileSize){
		// 파일크기 초과시 종료시킴
		if((fileSize >= maxSize)){
			alert("파일 사이즈 초과(최대5Mb)");
			//return false;// return이 있어서 아래쪽 구문은 실행 안됨
		}
		// regex에 표현해둔 정규식과 일치하는지 여부를 체크, 일치하면 true, 아니면 false
		if(regex.test(fileName)){
			alert("(exe|sh|zip|alz) 확장자 파일은 업로드할 수 없습니다.");
			return false;
		}// else if(regex.test(fileName2)) alert("해당 확장자를 가진 파일은 업로드할 수 없습니다.(2번째 파일)");
		return true;
	}
	/******************
		작성 버튼 클릭
	*******************/

		document.getElementById('sub').addEventListener('click', e=>{
		let form = $('#review')[0];
		let formData = new FormData(form); 

		let inputFile1 = $("input[name='uploadFile']"); 
		let inputFile2 = $("input[name='uploadFile2']"); 

		let files1 = inputFile1[0].files;// 실제 file 데이터
		let files2 = inputFile2[0].files;// 실제 file 데이터
	
		for(let i = 0; i < files1.length; i++){
			console.log(i)
			if(!checkExtension(files1[i].name, files1[i].size)){
				return false;// 조건에 맞지않은 파일 포함시 onclick 이벤트 함수자체를 종료시켜버림
			}
		}
		for(let i = 0; i < files2.length; i++){
			console.log(i)
			if(!checkExtension(files2[i].name, files2[i].size)){
				return false;// 조건에 맞지않은 파일 포함시 onclick 이벤트 함수자체를 종료시켜버림
			}
		}
		// 파일 데이터를 가져와서 key, value로 저장
		formData.append("uploadFile", files1);
		formData.append("uploadFile2", files2);
	
		formData.append("msg", "mgs");
		console.log("--------------파일 적재 후 formData 태그 -------------");
		for (let key of formData.keys()) {
			  console.log(key, ":",formData.get(key));
		}
		for(let value of formData.values()){
			  /* alert(value); */
		}
		/******************
			ajax - 리뷰 작성
		*******************/
		$.ajax({
			url: '/cdcd/upload/', 
			// 폼 데이터로 인식하기 위해
			processData : false,
			contentType: false,
			data : formData,
			type : 'POST',
			success : function(result){
				console.log(result);
				$('#review_img1').val( result.split(" ")[0]);
				$('#review_img2').val( result.split(" ")[1]);
/* 				$('#deleteBtn').css('display', 'block'); */
				$('#del').val(2);
				$('#del2').val(2);
				 var form = document.getElementById('review');
				 form.method="post"; 
		 		 if(formCheck()==true){
		 			 form.submit(); 
				}  
			}
		}); // ajax
	});
		/******************
			수정 버튼 클릭
		*******************/
		document.getElementById('mod').addEventListener('click', e=>{

			let form =$('#review')[0];
			let formData = new FormData(form); 

			//alert(formData);
			let inputFile1 = $("input[name='uploadFile']"); 
			let inputFile2 = $("input[name='uploadFile2']"); 
			console.log(inputFile1)
			console.log(inputFile2)
						
			let files1 = inputFile1[0].files;// 실제 file 데이터
			let files2 = inputFile2[0].files;// 실제 file 데이터
			console.log(files1);
			console.log(files2);

			let fileName1 = $("#fileName1").text();
			let fileName2 = $("#fileName2").text();	
			
			if(files1.length==0&&fileName1.length==0){ //첫번째 새로운 파일, 기존 파일 둘 다 없을 때
				if(files2.length!=0){
					$('#del').val(3);
					$('#del2').val(2);
					alert("파일이 없습니다.")
				}else{
					$('#del').val(3);
					modi();
					return;
				}
			}else if(files2.length==0&&fileName2.length==0){//두번째 새로운 파일, 기존 파일 둘 다 없을 때
				if(files1.length!=0){
					$('#del').val(2);
					$('#del2').val(3);
					alert("파일이 없습니다.")
				}else{
					$('#del2').val(3);
					modi();
					return;
				}
			}else if(files1.length==0&&fileName1.length!=0){//첫번째 기존 파일 있을 때
				if(files2.length!=0){//두번째 파일 새롭게 추가할 때
					$('#del').val(1);
					$('#del2').val(2);
				}else{
					$('#del').val(1);
					modi();
					return;
				}
			}else if(files2.length==0&&fileName2.length!=0){//두번째 기존 파일 있을 때
				if(files1.length!=0){//첫번째 파일 새롭게 추가할 때
					$('#del').val(2);
					$('#del2').val(1);
				}else{
					$('#del2').val(1);
					modi();
					return;
				}
			}
			// 파일 데이터를 폼에 집어넣기
			for(let i = 0; i < files1.length; i++){
				console.log(i)
				if(!checkExtension(files1[i].name, files1[i].size)){
					return false;// 조건에 맞지않은 파일 포함시 onclick 이벤트 함수자체를 종료시켜버림
				}
				console.log("파일 길이")
				console.log(files1[i].name.length)
			}
			for(let i = 0; i < files2.length; i++){
				console.log(i)
				if(!checkExtension(files2[i].name, files2[i].size)){
					return false;// 조건에 맞지않은 파일 포함시 onclick 이벤트 함수자체를 종료시켜버림
				}
				console.log("파일 길이")
				console.log(files2[i].name.length)	
			}
			
			formData.append("uploadFile", files1);
			formData.append("uploadFile2", files2);
/* 			alert("#del value" + $('#del').val());
			alert("#del2 value" + $('#del2').val()); */
			/******************
				ajax - 리뷰 수정
			*******************/
			$.ajax({
				url: '/cdcd/upload/', 
				// 폼 데이터로 인식하기 위해
				processData : false,
				contentType: false,
				data : formData,
				type : 'POST',
				success : function(result){
					$('#review_img1').val( result.split(" ")[0]);
					$('#review_img2').val( result.split(" ")[1]);
					console.log(result);
					console.log($('#uploadFile').val())
					console.log($('#uploadFile2').val())
/* 			        $('#del').val(2);
			        $('#del2').val(2); */
					modi();
				}
			}); // ajax		
			
		});
		function modi(){
			let form = document.getElementById('review');
			form.action="<c:url value='/modify'/>";
			form.method="post";
			 if(formCheck()==true){
				form.submit(); 
			}  
		}

	/*******************
		이미지 삭제 버튼 클릭
	********************/
	$('#img_del1').click(function(){
			// form전송 객체, 주로 이미지와 같은 멀티미디어 파일을 페이지 전환없이 
			// 폼데이터를 비동기로 제출하고 싶을 때  사용
			let formData = new FormData(); 
			console.log(formData);
			
			let inputFile = $("input[name='uploadFile']"); 
			console.log(inputFile)
			
			let fileName = $("#fileName1").text()
			let files = inputFile[0].files;// 실제 file 데이터
			console.log(files);
			if(files.length==0 && fileName==''){
				alert("파일이 없습니다.")
				return
			}
			alert("파일이 삭제되었습니다.");
			$('#uploadFile').val('');
			$('#fileName1').text('');
			$('#img_del1').css('display',"none");			
			formData.append("uploadFile", files1);	
	});
	$('#img_del2').click(function(){
			// form전송 객체, 주로 이미지와 같은 멀티미디어 파일을 페이지 전환없이 
			// 폼데이터를 비동기로 제출하고 싶을 때  사용
			let formData = new FormData(); 
			console.log(formData);
			
			let inputFile = $("input[name='uploadFile2']"); 
			console.log(inputFile)
			
			let fileName = $("#fileName2").text()
			let files = inputFile[0].files;// 실제 file 데이터
			console.log(files);
			if(files.length==0 && fileName==''){
				alert("파일이 없습니다.")
				return
			}
			alert("파일이 삭제되었습니다.");
			$('#uploadFile2').val('');
			$('#fileName2').text('');
			$('#img_del2').css('display',"none");
	});
});	
 
	/*******************
			 별점
	********************/
    if (msg == "not_login") {
        alert("리뷰 작성은 로그인 후 이용 가능합니다.");
        window.opener.location.reload();
        opener.location.replace('./Home/login')
        window.close();
    }
    if (msg == "write_error") {
        "등록되지 않았습니다."
    }
    function setMessage(ch, element) {
        document.getElementById("ch").innerHTML = ch;
        if (element) {
            element.select();
        }
    }
    function formCheck(frm) {
        console.log("등록버튼");
        if ($('#review_contents').val().trim().length == 0) {
            console.log("리뷰작성콘솔");
            setMessage('리뷰 작성을 해주세요.', document.getElementById("review_contents"));
            return false;
        }else if (document.getElementById("score1").value == '') {
            if ($('#score1').attr('data-check') == '1') {
                setMessage('카페 별점을 매겨주세요.');
                return false;
            }else if($('#score1').attr('data-check') == '0' && document.getElementById("score2").value == '' && $('#score2').attr('data-check') == '1'){
                setMessage('디저트 항목을 완료해주세요.');
                return false;
            }else if($('#score1').attr('data-check') == '0' && document.getElementById("score3").value == '' && $('#score3').attr('data-check') == '1'){
                setMessage('분위기 항목을 완료해주세요.');
                return false;
            }
        }else if (document.getElementById("score2").value == '') {
            if ($('#score2').attr('data-check') == '1') {
                setMessage('디저트 별점을 매겨주세요.');
            return false;
            }else if($('#score2').attr('data-check') == '0' && document.getElementById("score1").value == '' && $('#score1').attr('data-check') == '1'){
                setMessage('디저트 항목을 완료해주세요.');
                return false;
            }else if($('#score2').attr('data-check') == '0' && document.getElementById("score3").value == '' && $('#score3').attr('data-check') == '1'){
                setMessage('분위기 항목을 완료해주세요.');
                return false;
            }
        }else if (document.getElementById("score3").value == '') {
            if ($('#score3').attr('data-check') == '1') {
                setMessage('분위기 별점을 매겨주세요.');
            return false;
            }else if($('#score3').attr('data-check') == '0' && document.getElementById("score1").value == '' && $('#score1').attr('data-check') == '1'){
                setMessage('디저트 항목을 완료해주세요.');
                return false;
            }else if($('#score3').attr('data-check') == '0' && document.getElementById("score2").value == '' && $('#score2').attr('data-check') == '1'){
                setMessage('분위기 항목을 완료해주세요.');
                return false;
            }
        }
        return true;
    }

    $('input[name=c_rating]').click(function() {
        var c_score = $('input[name=c_rating]:checked').val();
        $('#score1').val(c_score);
        console.log($('#score1').val(c_score));
    });
    $('input[name=d_rating]').click(function() {
        var d_score = $('input[name=d_rating]:checked').val();
        $('#score2').val(d_score);
        console.log($('#score2').val(d_score));
    });
    $('input[name=m_rating]').click(function() {
        var m_score = $('input[name=m_rating]:checked').val();
        $('#score3').val(m_score);
        console.log($('#score3').val(m_score));
    });
    var c_box = document.getElementsByName('no_coffee');
    var c_rating = $("input:radio[name=c_rating]");

    var d_box = document.getElementsByName('no_dessert');
    var d_rating = $("input:radio[name=d_rating]");

    var m_box = document.getElementsByName('no_mood');
    var m_rating = $("input:radio[name=m_rating]");
	
	/*******************
	 	리뷰 수정 - 참여x
	********************/
    /* 커피 별점 */
    if('${reviewDto.coffee_score}' == '' && mode!="new"){
    	$('#no_coffee').prop('checked',true);
        c_box.disabled = true;
        c_rating.attr("disabled", true);
        $(c_rating).removeAttr("checked");
        $(".c").css("text-shadow", "0 0 0 #f0f0f0").css("cursor","not-allowed");
        $('#score1').attr('data-check', '0');
        $('#score1').attr('value', 100);
        console.log($('#score1').attr('value'));
        console.log($('#score1').attr('data-check'));
    }  
    /* 디저트 별점 */
    if('${reviewDto.dessert_score}' == '' && mode!="new"){
    	$('#no_dessert').prop('checked',true);
        c_box.disabled = true;
        c_rating.attr("disabled", true);
        $(c_rating).removeAttr("checked");
        $(".d").css("text-shadow", "0 0 0 #f0f0f0").css("cursor","not-allowed");
        $('#score2').attr('data-check', '0');
        $('#score2').attr('value', 100);
        console.log($('#score2').attr('value'));
        console.log($('#score2').attr('data-check'));
    } 
    /* 분위기 별점 */
    if('${reviewDto.mood_score}' == '' && mode!="new"){
    	$('#no_mood').prop('checked',true);
        c_box.disabled = true;
        c_rating.attr("disabled", true);
        $(c_rating).removeAttr("checked");
        $(".m").css("text-shadow", "0 0 0 #f0f0f0").css("cursor","not-allowed");
        $('#score3').attr('data-check', '0');
        $('#score3').attr('value', 100);
        console.log($('#score3').attr('value'));
        console.log($('#score3').attr('data-check'));
    } 
    /* 리뷰 작성 시 클릭 */
    $('#no_coffee').click(
           function () {
                let c_check = $('#no_coffee').prop('checked');
                if (c_check) {
                    c_box.disabled = true;
                    c_rating.attr("disabled", true);
                    $(c_rating).removeAttr("checked");
                    $(".c").css("text-shadow", "0 0 0 #f0f0f0").css("cursor","not-allowed");
                    $('#score1').attr('data-check', '0');
                    $('#score1').attr('value', 100);
                    console.log($('#score1').attr('value'));
                    console.log($('#score1').attr('data-check'));
                } else {
                    c_box.disabled = false;
                    c_rating.attr("disabled", false);
                    $(".c").css("text-shadow", "").css("cursor", "pointer");
                    $('#score1').attr('data-check', '1');
                    $('#score1').attr('value', '');
                    console.log($('#score1').attr('data-check'));
                }
            });
    $('#no_dessert').click(
            function() {
                let d_check = $('#no_dessert').prop('checked');
                if (d_check) {
                    d_box.disabled = true;
                    d_rating.attr("disabled", true);
                    $(d_rating).removeAttr("checked");
                    $(".d").css("text-shadow", "0 0 0 #f0f0f0").css("cursor","not-allowed");
                    $('#score2').attr('data-check', '0');
                    $('#score2').attr('value', 100);
                    console.log($('#score2').attr('data-check'));
                } else {
                    d_box.disabled = false;
                    d_rating.attr("disabled", false);
                    $(".d").css("text-shadow", "").css("cursor", "pointer");
                    $('#score2').attr('data-check', '1');
                    $('#score2').attr('value', '');
                    
                }
            });
    $('#no_mood').click(
            function() {
                let m_check = $('#no_mood').prop('checked');
                if (m_check) {
                    m_box.disabled = true;
                    m_rating.attr("disabled", true);
                    $(m_rating).removeAttr("checked");
                    $(".m").css("text-shadow", "0 0 0 #f0f0f0").css("cursor","not-allowed");
                    $('#score3').attr('data-check', '0');
                    $('#score3').attr('value', 100);
                    console.log($('#score3').attr('data-check'));
                } else {
                    m_box.disabled = false;
                    m_rating.attr("disabled", false);
                    $(".m").css("text-shadow", "").css("cursor", "pointer");
                    $('#score3').attr('data-check', '1');
                    $('#score3').attr('value', '');
                }
            });

    
</script>
</html>

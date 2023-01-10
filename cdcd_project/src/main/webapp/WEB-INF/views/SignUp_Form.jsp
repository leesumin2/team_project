<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<link href="resources/css/web.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>카득카득 회원가입</title>
    <style>
        
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}

        #register {
            margin: 50px auto auto;
            width: 500px;
            border: 1px solid #eee;
            border-radius: 10px;
            box-shadow: 2px 3px 3px #eee;
		    font-family: 'SUIT-Regular';
        }
        #register h1 {
            text-align: center;
            color: #666;
            margin: 30px 0;
            letter-spacing: 2px;
        }
        form {
            margin: auto;
            width: 380px;
        }
        #register .msg {
            width: 300px;
            color: red;
            font-size: 13px;
            height: 20px;
            padding: 0px;
        }
        form label {
            width: 300px;
            float: left;
            color: #666;
            line-height: 30px;
        }
        form .form_item {
            padding-bottom: 5px;
        	display: flex;
        	flex-direction: column;
        	align-items: center;
        }
        #mem_id, #mem_pwd, #pwd_ck, #mem_email, #mem_phone {
            width: 300px;
            height: 30px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 13px;
		    font-family: 'SUIT-Regular';
        }
        #mem_phone1 {
            width: 50px;
            border: 1px solid #ccc;
            border-radius: 3px;
            height: 30px;
		    font-family: 'SUIT-Regular';
            text-align: center;
        }
        #mem_phone2 {
            width: 245px;
            border: 1px solid #ccc;
            border-radius: 3px;
            height: 30px;
		    font-family: 'SUIT-Regular';
        }
        #register #btn {
            padding: 10px;
            text-align: center;
            margin: 20px;
            color: #a38c77
        }
        input[type="submit"]  {
            width: 200px;
            height: 40px;
            background-color: #f0dbc8;
            border: 0px;
            border-radius: 5px;
            font-size: 16px;
		    font-family: 'SUIT-Regular';
        }
    </style>
</head>
<body>
    <div id="container">
<%@ include file="header.jsp" %>
        <div id="register">
            <h1>회원가입</h1>
			<form id="register_form" action="" method="post" onsubmit="return formCheck(this)">
                <div class="form_item">
                    <label for="mem_id">아이디</label>
                    <input type="text" name="mem_id" id="mem_id" placeholder="  8~10자 이내(영어 소문자 및 숫자 포함)">
                    <div class="msg" id="id_msg">${URLDecoder.decode(param.msg, "utf-8") }</div>
                </div>
                <div class="form_item">
                    <label for="mem_pwd">비밀번호</label>
                    <input type="password" name="mem_pwd" id="mem_pwd" placeholder="  8~10자 이내(영어 대소문자, 숫자 및 특수문자 포함)">
                    <div class="msg" id="pwd_msg">${URLDecoder.decode(param.msg, "utf-8") }</div>
                </div>
                <div class="form_item">
                    <label for="pwd_ck">비밀번호 확인</label>
                    <input type="password" name="pwd_ck" id="pwd_ck" placeholder="  비밀번호 입력">
                    <div class="msg" id="pwd_ck_msg">${URLDecoder.decode(param.msg, "utf-8") }</div>
                </div>
                <div class="form_item">
                    <label for="mem_email">이메일</label>
                    <input type="email" name="mem_email" id="mem_email" placeholder="  abc123@domain.com">
                    <div class="msg" id="email_msg">${URLDecoder.decode(param.msg, "utf-8") }</div>
                </div>
                <div class="form_item">
                    <label for="mem_phone">휴대전화</label>
                    <input type="hidden" name="mem_phone" id="mem_phone">
                    <div>
	                    <select name="mem_phone1" id="mem_phone1">
	                        <option value="010">010</option>
	                        <option value="011">011</option>
	                        <option value="016">016</option>
	                        <option value="017">017</option>
	                    </select>
	                    <input type="text" name="mem_phone2" id="mem_phone2" placeholder="  ' - ' 제외한 휴대전화 8자리 입력">
	                </div>
                    <div class="msg" id="phone_msg">${URLDecoder.decode(param.msg, "utf-8") }</div>
                </div>
                <div id="btn"><input type="submit" value="가입하기"></div>
            </form>
        </div>
    </div>
    <script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
    <script>
		function formCheck(frm) {
			
			frm.mem_phone.value = frm.mem_phone1.value + frm.mem_phone2.value;	
			let hangleReg = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			
			<!-- id 유효성 확인 -->
			let id_msg = document.getElementById('id_msg');
			let idReg = /^[a-z0-9]{8,10}$/;
			
			if(frm.mem_id.value == "") {
				console.log("message print")
				message('아이디를 입력해주세요.', id_msg);
			}
			else if(frm.mem_id.value.length<8 || frm.mem_id.value.length>10) {
				message('아이디는 8~10자 이내로 입력해주세요.', id_msg);
			}
			else if(!idReg.test(frm.mem_id.value) || hangleReg.test(frm.mem_id.value)) {
				message('영문 소문자와 숫자를 조합하여 입력해주세요.', id_msg);
			}
			else if(idCheck(frm.mem_id.value) == 1) {
				message('이미 사용 중인 아이디입니다.', id_msg);
			}
			else {
				id_msg.innerHTML = '';
			}
					
			
			<!-- pwd 유효성 확인 -->
			let pwd_msg = document.getElementById('pwd_msg');
			let pwdReg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,10}$/;
			
			if(frm.mem_pwd.value == "") {
				message('비밀번호를 입력해주세요.', pwd_msg);
			}
			else if(frm.mem_pwd.value.length<8 || frm.mem_pwd.value.length>10) {
				message('8~10자 이내로 입력해주세요.', pwd_msg);
			}
			else if(!pwdReg.test(frm.mem_pwd.value) || hangleReg.test(frm.mem_id.value)) {
				message('영문 대소문자, 숫자, 특수문자를 조합하여 입력해주세요.', pwd_msg);
			}
			else {
				pwd_msg.innerHTML = '';
			}
			
			
			<!-- pwd_ck 유효성 확인 -->
			let pwd_ck_msg = document.getElementById('pwd_ck_msg');
			
			if(frm.pwd_ck.value == "" || frm.mem_pwd.value != frm.pwd_ck.value) {
				message('비밀번호가 일치하지 않습니다.', pwd_ck_msg);
			}
			else {
				pwd_ck_msg.innerHTML = '';
			}
			
			
			<!-- email 유효성 확인 -->
			let email_msg = document.getElementById('email_msg');
			var emailReg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
			
			if(frm.mem_email.value == "") {
				message('이메일을 입력해주세요.', email_msg);
			}
			else if(frm.mem_email.value.length>20) {
				message('20자 이내로 입력해주세요.', email_msg);
			}
			else if(!emailReg.test(frm.mem_email.value)) {
				message('이메일 형식으로 입력해주세요.', email_msg);
			}
			else if(emailCheck(frm.mem_email.value) == 1) {
				message('이미 사용 중인 이메일입니다.', email_msg);	
			}
			else {
				email_msg.innerHTML = '';
			}
			
			
			<!-- phone 유효성 확인 -->
			let phone_msg = document.getElementById('phone_msg');
			let phoneReg = /^[0-9]{11,}$/;
			
			if(frm.mem_phone2.value.length!=8 || !phoneReg.test(frm.mem_phone.value)) {
				message("' - ' 제외한 휴대전화 8자리를 입력해주세요.", phone_msg);
			}
			else {
				phone_msg.innerHTML = '';
			}
			
			if(
				id_msg.innerHTML == '' &&
				pwd_msg.innerHTML == '' &&
				pwd_ck_msg.innerHTML == '' &&
				email_msg.innerHTML == '' &&
				phone_msg.innerHTML == ''
			) {
				
				return true;
					
			}
			
			return false;
			
		}
		
		
		<!-- id 중복 유효성 확인 -->
		function idCheck(mem_id) {
			
			let ckResult = 0;
			
			$.ajax({
				url: "/cdcd/idCheck",
				type: "POST",
				data: {
					mem_id: mem_id
				},
				async: false,
				success: function(result) {
					ckResult = result;
				},
				error: function() {
					alert("error");
				}
			});
			console.log(ckResult);
			return ckResult;
		}
		
		
		<!-- email 중복 유효성 확인 -->
		function emailCheck(mem_email) {

			let ckResult = 0;
			
			$.ajax({
				url: "/cdcd/emailCheck",
				type: "POST",
				data: {
					mem_email: mem_email
				},
				async: false,
				success: function(result) {
					ckResult = result;
				},
				error: function() {
					alert("error");
				}
			});
			
			return ckResult;
		}
		
		
		function message(msg, msgBox) {
			msgBox.innerHTML = `<i class="fa-solid fa-circle-xmark"></i> ${ '${msg}' }`;
		}
		
		
    </script>
</body>
</html>
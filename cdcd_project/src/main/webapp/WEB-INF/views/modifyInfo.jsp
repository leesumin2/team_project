<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<link link href="../resources/css/web.css" rel="stylesheet"/> 	
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <title>정보수정</title>
    <style>
        
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}

        #header {
            display: flex;
            justify-content: flex-end;
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
		    font-family: 'SUIT-Regular';
        }
        #register #msg {
            width: 300px;
            color: red;
            font-size: 13px;
            height: 20px;
            padding: 0px;
            margin: auto;
        }
        #register_form {
            margin: auto;
            width: 380px;
        }
        #register_form label {
            width: 300px;
            float: left;
            color: #666;
            line-height: 30px;
        }
        #register_form .form_item {
            padding-bottom: 20px;
        	display: flex;
        	flex-direction: column;
        	align-items: center;
        }
        #id, #pw, #pw_ck, #email {
            width: 300px;
            height: 30px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 13px;
		    font-family: 'SUIT-Regular';
		    padding-left: 10px;
        }
        #phone1 {
            width: 50px;
            border: 1px solid #ccc;
            border-radius: 3px;
            height: 30px;
		    font-family: 'SUIT-Regular';
            text-align: center;
        }
        #phone2 {
            width: 245px;
            border: 1px solid #ccc;
            border-radius: 3px;
            height: 30px;
		    font-family: 'SUIT-Regular';
        }
        #btn {
        	width: 300px;
        	display: flex;
			justify-content: space-between;
            text-align: center;
            color: #666;
            margin: 30px auto 50px;
            letter-spacing: 2px;
        }
        input[type="submit"], input[type="reset"] {
            width: 120px;
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
            <h1>정보 수정</h1>
            <div id="msg"></div>
			<c:if test="${not empty param.msg}">
				<i class="fa fa-exclamation-circle">${URLDecoder.decode(param.msg)}</i>
			</c:if>
			<form action="<c:url value='/Home/update'/>" method="post" onsubmit="return fCheck(this);" id="register_form" >
                <div class="form_item">
                    <label for="id">아이디</label>
                    <input type="text" name="id" id="id" placeholder="ID" value=${user.mem_id } readonly><!-- readonly -->
                </div>
                <div class="form_item">
                    <label for="pw">비밀번호</label>
                    <input type="password" name="pw" id="pw"  placeholder="영어 대소문자 및 숫자, 특수문자 포함하여 입력" >
                </div>
                <div class="form_item">
                    <label for="pw_ck">비밀번호 확인</label>
                    <input type="password" name="pw_ck" id="pw_ck"  placeholder="비밀번호 입력">
                </div>
                <div class="form_item">
                    <label for="email">이메일</label>
                    <input type="email" name="email" id="email"  placeholder="abc123@domain.com" value=${user.mem_email }>
                </div>
                <div id="phone" class="form_item">
                    <label for="phone">휴대전화</label>
                    <div>
	                    <select name="phone1" id="phone1">
	                        <option value="010" ${userp=="010"? 'selected="selected"' : ''}>010</option>
	                        <option value="011" ${userp=="011"? 'selected="selected"' : ''}>011</option>
	                        <option value="016" ${userp=="016"? 'selected="selected"' : ''}>016</option>
	                        <option value="017" ${userp=="017"? 'selected="selected"' : ''}>017</option>
	                    </select>
	                    <input type="text" name="phone2" id="phone2" placeholder="' - ' 제외한 전화번호 입력" value=${userp2 }>
	                </div>
                </div>
                <div id="btn">
                    <input type="submit" value="수정">
                    <input onclick="location.href='<c:url value='/'/>'" type="reset" value="취소">
                </div>
            </form>
        </div>
    </div>
    <script>	
	    function setMessage(msg, element){
			document.getElementById("msg").innerHTML=`${'${msg}'}`;  
			if(element){
				element.select(); 
			}
		} 
		function fCheck(frm){
			
			let msg='';
			if(  !(document.getElementById("pw").value===document.getElementById("pw_ck").value)  ){
				setMessage('비밀번호 확인이 비밀번호와 일치하지않습니다.',frm.pw_ck);
				return false;
			}
			
			if(document.getElementById("pw").value.length==0){
				setMessage('비밀번호를 입력하세요.',frm.pw);
				return false;
			}
			if(document.getElementById("pw_ck").value.length==0){
				setMessage('비밀번호확인을 입력하세요.',frm.pw_ck);
				return false;
			}
			if(document.getElementById("email").value.length==0){
				setMessage('email을 입력하세요.',frm.email);
				return false;
			}
			if(document.getElementById("phone2").value.length==0){
				setMessage('전화번호를 입력하세요.',frm.phone);
				return false;
			}
			let pwcks = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&].{7,9}$/;
			var passw=document.getElementById("pw").value;

			if( !pwcks.test(passw) ) {
				setMessage('비밀번호는 8~10글자로 대소문자 및 숫자, 특수문자를 포함시켜주세요 .',frm.pw);
			    return false;
			}
			
			alert("회원님의 정보가 수정되었습니다")
			return true;
		}
		
		
	</script>
</body>
<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
</html>
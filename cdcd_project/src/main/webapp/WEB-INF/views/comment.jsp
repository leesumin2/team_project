<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/7d1547ef5a.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
	
.clist{
	width:800px;
}
#commentList{
	display:flex;
}

button{
	margin-left:10px;
	margin-top:10px;
}
.commentAll{
	display:flex;
	flex-direction:column;
	width:800px;
	
	margin-right:auto;
	margin-left:auto;
		    font-family: 'SUIT-Regular';
}	
.send{
	display:flex;
	width:800px;
	justify-content:center;
	align-items:center;
}
#a_coment_content{
	width:700px;
}
.clist{
	list-style: none;
	width:1000px;
}

.clist li{
	display: inline-block;
	width:1000px;
}
.delBtn, .modBtnb{
	width:50px;
	margin: 0;
	margin-top: 5px;
	
}
i{
	font-size: 20px;
	padding-top:5px;
}

.bor{
	border-collapse: collapse;
	border-top: 1px solid black;
	width:650px;
	float:left;
	padding:5px;
	border-bottom: 1px solid black;
	border-width: 1px;
	line-height: 25px;
}
#udt{
	color:red;
	margin:0;
	padding:0;
	float:right;
}
#modBtn{
	display: none;
		    font-family: 'SUIT-Regular';
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
</head>

<body>
	<div class="commentAll">
		<h2>댓글</h2>
		<div class="send">
			<input class="form-control" type="text" name="a_coment_content" id="a_coment_content">
			<button class="btn btn-default" id="sendBtn" type="button">등록</button>
			<button class="btn btn-default" id="modBtn" type="button">수정</button>
		</div>
		<div id="commentList"></div>
		<div id="test"></div>
	</div>
	
	<script>
	

	let ask_id = ${param.ask_id};
	
	let mode = false;
	
	let showList= function(ask_id){
		console.log(ask_id);
		let a_coment_content = $('input[name=a_coment_content]').val("");
		
        $.ajax({
            type:'GET',       // 요청 메서드
            url: '/cdcd/comments?ask_id='+ask_id,  // 요청 URI
            success : function(result){
				$("#commentList").html(toHtml(result));
				
            },
            error: function(){ alert("error1") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
        
       //alert("the request is sent")//********************
	}
	
	// 문서가 로드가 되었을 때 실행되는 함수 - main함수와 동일한 역할로 생각
	$(document).ready(function(){
		showList(ask_id);
		//등록 버튼을 눌렀을 경우 
	    $("#sendBtn").click(function(){
		    	let a_coment_content = $('input[name=a_coment_content]').val();
		    	if(a_coment_content.trim()==''){
		    		alert("입력해주세요");
		    		return;
		    	}
		        $.ajax({
		            type:'POST',       // 요청 메서드
		            url: '/cdcd/comments/?ask_id='+ask_id,  // 요청 URI
		            headers: {"content-type" : "application/json"}, // 보내는 데이터 타입명시
		            data : JSON.stringify({ask_id:ask_id, a_coment_content:a_coment_content}), // 전달 데이터
		            success : function(result){ // 요청이 성공일 때 실행되는 이벤트
		            	alert('댓글이 등록되었습니다.');//**************************
		            	showList(ask_id);
		            },
		            error: function(){ alert("error2") } // 에러가 발생했을 때 실행되는 이벤트
		        }); // $.ajax()
	    });
	    
		var isAjaxing = false;
	    
		// 각 버튼의 수정 버튼이 눌렀을 경우 
    	$("#commentList").on("click", ".modBtnb" , (function(){
    		$('#sendBtn').attr('style', "display:none;");
    		$('#modBtn').attr('style', "display:block;");
        	let a_coment_id = $(this).parent().attr('data-a_coment_id');
        	let ask_id = $(this).parent().attr('data-ask_id');
			//수정 댓글 번호를 저장하기
        	$("#modBtn").attr('data-a_coment_id', a_coment_id);
			//텍스트 가져오기 (해당 수정글에))
			$('input[name=a_coment_content]').val($('span.a_coment_content', $(this).parent()).text());
			console.log($('span.a_coment_content', $(this).parent()).text());
    	}));
    	
	    // 등록 옆에 수정 버튼을 눌렀을 경우
   	    $("#modBtn").click(function(){
   	    	$('#sendBtn').attr('style', "display:block;");
    		$('#modBtn').attr('style', "display:none;");
			let a_coment_content = $('input[name=a_coment_content]').val();
	    	if(a_coment_content.trim()==''){
	    		alert("입력해주세요");
	    		return;
	    	}
	    	let a_coment_id = $("#modBtn").attr('data-a_coment_id');
	        $.ajax({
	            type:'PATCH',       // 요청 메서드
	            url: '/cdcd/comments/'+a_coment_id,  // 요청 URI
	            headers: {"content-type" : "application/json"},
	            data : JSON.stringify({a_coment_id:a_coment_id, a_coment_content:a_coment_content}),

	            complete :function(result){
            		alert('댓글이 수정되었습니다');//*******************
            		showList(ask_id);
	            },
	            error: function(){ 
	            	alert("error3") 	
	            } // 에러가 발생했을 때, 호출될 함수
	        }); // $.ajax()
    	});
	

	     
	    //삭제 버튼은 동적으로 생성되는 버튼이므로 이벤트를 추가하기에 적합하지 않음
	    //$("#delBtn").click(function(){
		//	showList(bno);
	    //});
	    $("#commentList").on("click", ".delBtn" , (function(){
        	let a_coment_id = $(this).parent().attr('data-a_coment_id');	    
        	//추가1
        	let coment_mem_id = $(this).parent().attr('date-coment_mem_id');
	        $.ajax({

	            type:'DELETE',       // 요청 메서드
	            //변경1
	            url: '/cdcd/comments/'+a_coment_id+'?ask_id='+ask_id+'&coment_mem_id='+coment_mem_id,  // 요청 URI
	            success : function(result){
	            	alert('댓글이 삭제되었습니다'); //***********************
	            	showList(ask_id);
	            },
	            error: function(){ alert("error4") } // 에러가 발생했을 때, 호출될 함수
	        }); // $.ajax()
	       // alert("the request is sent")
    	}));	

	});
	
	
	let toHtml = function(comments){
		let tmp ="<ul class=clist>"
		
		comments.forEach(function(a_coment){
			let date = new Date(a_coment.a_coment_date)
			let updatetime = new Date(a_coment.a_comment_update)
			let today = new Date()
			date2=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()
			updatetime2=updatetime.getFullYear()+"-"+(updatetime.getMonth()+1)+"-"+updatetime.getDate()
			today2=today.getFullYear()+"-"+(today.getMonth()+1)+"-"+today.getDate()
			
			tmp += '<li data-a_coment_id='+a_coment.a_coment_id
			//변경1
			tmp += ' data-ask_id='+a_coment.ask_id+' date-coment_mem_id='+a_coment.mem_id+'>&nbsp;&nbsp;&nbsp;'
			tmp += '<div class="bor"><i class="fa-solid fa-comment-dots"></i>'
			//alert(date.getTime() == updatetime.getTime());
			if(today2<=date2){
				tmp+="&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+date.getHours()+"&nbsp;:&nbsp;"+date.getMinutes()+"&nbsp;&nbsp;&nbsp;&nbsp;"
			}
			else{
				tmp+="&nbsp"+date2
			}
		
			tmp +='&nbsp;&nbsp;&nbsp;&nbsp;[<span class="mem_id">'
				+a_coment.mem_id+'] </span>'
			if(date.getTime() != updatetime.getTime()){
				if(today2<=updatetime2){
					tmp+="&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div id='udt'>수정됨["+updatetime.getHours()+"&nbsp;:&nbsp;"+updatetime.getMinutes()+"]</div>&nbsp;&nbsp;&nbsp;&nbsp;"
				}
				else{
					tmp+="&nbsp<div id='udt'>수정됨["+updatetime2+"]</div>"
				}
			}
			tmp +='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
			tmp += '    <br><span class="a_coment_content"> '+a_coment.a_coment_content+'</span></div>'
			
	        //alert(today2<=date2);
			if("${sessionScope.id}"!="admin"){
				if(a_coment.mem_id== "${sessionScope.id}"){
					tmp += '&nbsp;&nbsp<button class="delBtn">삭제</button>&nbsp;'
					tmp += '<button class="modBtnb">수정</button>'
				}
				
			}
			else{
				if(a_coment.mem_id== "${sessionScope.id}"){
					tmp += '<button class="modBtnb">수정</button>'
				}
			}
			
			if("${sessionScope.id}"=="admin"){
				tmp += '&nbsp;&nbsp<button class="delBtn">삭제</button>&nbsp;'
			}
			tmp += '</li>'
			
			
		})
		return tmp +'</ul>';
	}
	</script>
	
	
</body>

</html>
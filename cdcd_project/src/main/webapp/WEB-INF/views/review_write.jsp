<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 작성하기</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        * {
            box-sizing: border-box;
            margin : 0;
            padding: 0;
            font-family: 'Gowun Dodum', sans-serif;
        }
        #cafe_title {
            text-align: center;
            color: #a38c77;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #review {
            width: 500px;
            margin: auto;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }
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
            margin-bottom: 10px;
            width: 100%;
        }
        #review_img input[type="file"]::-webkit-file-upload-button {
            border: 1px solid #a38c77;
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
            background-color: #a38c77;
            font-family: 'Gowun Dodum', sans-serif;
            color: #fff;
            font-size: 15px;
        }
        #scores {
            padding-bottom: 20px;
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
        input[type="submit"]  {
            width: 100px;
            height: 40px;
            background-color: #f0dbc8;
            border: 0px;
            border-radius: 5px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div id="container">
        <form action="" id="review">
            <h1 id="cafe_title">리뷰 작성하기</h1>
            <textarea name="review_contents" id="review_contents" cols="70" rows="10" placeholder="내용을 입력하세요"></textarea>
            <div id="review_img">
                <input type="file">
                <input type="file">
            </div>
            <div id="scores">
                <div id="coffee">
                    <div class="score_name">커피 맛은 어떤가요?</div>
                    <div id="coffee_score">
                        <div>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                        </div>
                        <div>
                            <label><input type="checkbox" name="no_coffee" id="no_coffee">참여안함</label>
                        </div>
                    </div>
                </div>
                <div id="dessert">
                    <div class="score_name">디저트 맛은 어떤가요?</div>
                    <div id="dessert_score">
                        <div>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                        </div>
                        <div>
                            <label><input type="checkbox" name="no_dessert" id="no_dessert">참여안함</label>
                        </div>
                    </div>
                </div>
                <div id="mood">
                    <div class="score_name">분위기는 어떤가요?</div>
                    <div id="mood_score">
                        <div>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star-half-stroke"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                        </div>
                        <div>
                            <label><input type="checkbox" name="no_mood" id="no_mood">참여안함</label>
                        </div>
                    </div>
                </div>
            </div>
            <div id="btn">
                <input type="submit" value="등록">
                <input type="submit" value="취소">
            </div>
        </form>
    </div>
</body>
<script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
</html>
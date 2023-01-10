<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="loginOutlink"
   value="${sessionScope.id==null? '/Home/login':'/Home/logout'}" />
<%-- <c:set var="loginOut" value="${sessionScope.id==null?  :  }"/> --%>
<link href="${pageContext.request.contextPath}/resources/css/web.css" rel="stylesheet"/>
   <script src="https://kit.fontawesome.com/d0bb457ba4.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>디저트 추천</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <style>
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


        #container #content{
            width: 800px;
            margin: 50px auto 0 auto;
            display: grid;
            grid-template-columns: 250px 250px 1fr;
            grid-template-rows: 1fr 1fr;
            grid-gap: 20px 30px;
          font-family: 'SUIT-Regular';
        }
        .items img{
            width: 100%;
            height: 100%;
         object-fit: cover;
        }
        .items{
            width: 250px;
            height: 250px;
            text-align: center;
        }
        .items:first-of-type{
            margin-bottom: 50px;
        }


        h1{
            text-align: center;
            margin-top: 50px;
          font-family: 'SUIT-Regular';
        }
        .redd{
           font-weight: bold;
        }

        
    </style>
</head>

<body>
    <div id="container">
<%@ include file="header.jsp" %>
        

        <h1>추천 디저트 카페</h1>
        <div id="content">
         <div class="items">

                <a href="<c:url value='/cafeInfo?cafe_id=${cft1.cafe_id}'/>"><img src="${pageContext.request.contextPath}/img/cafeImg/${cft1.cafe_img}"></a>
                <label>${cft1.cafe_name}</label>
                <br>
                <c:if test="${bb[0]==0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">없음</span>
                </c:if>
                <c:if test="${bb[0]!=0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">${bb[0]}</span>
                </c:if>
            </div>

            <div class="items">
                <a href="<c:url value='/cafeInfo?cafe_id=${cft2.cafe_id}'/>"><img src="${pageContext.request.contextPath}/img/cafeImg/${cft2.cafe_img}"></a>
                <label>${cft2.cafe_name}</label>
                <br>
                <c:if test="${bb[1]==0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">없음</span>
                </c:if>
                <c:if test="${bb[1]!=0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">${bb[1]}</span>
                </c:if>
            </div>
            <div class="items">
                <a href="<c:url value='/cafeInfo?cafe_id=${cft3.cafe_id}'/>"><img src="${pageContext.request.contextPath}/img/cafeImg/${cft3.cafe_img}"></a>
                <label>${cft3.cafe_name}</label>
                <br>
                <c:if test="${bb[2]==0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">없음</span>
                </c:if>
                <c:if test="${bb[2]!=0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">${bb[2]}</span>
                </c:if>
            </div>
            <div class="items">
                <a href="<c:url value='/cafeInfo?cafe_id=${cft4.cafe_id}'/>"><img src="${pageContext.request.contextPath}/img/cafeImg/${cft4.cafe_img}"></a>
                <label>${cft4.cafe_name}</label>
                <br>
                <c:if test="${bb[3]==0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">없음</span>
                </c:if>
                <c:if test="${bb[3]!=0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">${bb[3]}</span>
                </c:if>
            </div>
            <div class="items">
                <a href="<c:url value='/cafeInfo?cafe_id=${cft5.cafe_id}'/>"><img src="${pageContext.request.contextPath}/img/cafeImg/${cft5.cafe_img}"></a>
                <label>${cft5.cafe_name}</label>
                <br>
                <c:if test="${bb[4]==0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">없음</span>
                </c:if>
                <c:if test="${bb[4]!=0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">${bb[4]}</span>
                </c:if>
            </div>
            <div class="items">
                <a href="<c:url value='/cafeInfo?cafe_id=${cft6.cafe_id}'/>"><img src="${pageContext.request.contextPath}/img/cafeImg/${cft6.cafe_img}"></a>
                <label>${cft6.cafe_name}</label>
                <br>
                <c:if test="${bb[5]==0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">없음</span>
                </c:if>
                <c:if test="${bb[5]!=0.0}">
                   디저트 <i class="fa-solid fa-star" style="color: gold;"></i> <span class="redd" style="color: red;">${bb[5]}</span>
                </c:if>
            </div>
        </div>

    </div>
</body>

</html>
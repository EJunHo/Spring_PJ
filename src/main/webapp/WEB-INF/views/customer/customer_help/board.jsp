<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/customer_CSS/faq.css">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<title>Insert title here</title>
</head>
<body>
 	<!-- header start -->
  	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header end -->
    <!-- main start -->
    <h1 align="center">고객지원센터</h1>
    <h3 align="center">궁금한점을 해결해드립니다.</h3>
    
    
    <div class="faq1">
        <div class="faq_div">
            <ul id="left" class="faq_left">
                <li><h3>상담 대표전화</h3></li>
                <li><h2>070-8829-8899</h2></li>
                <li>070-8829-8899</li>
                <li>MON-FRI : 1PM-5PM</li>
                <li>SAT SUN HOLIDAY OFF</li>
                <li>KAKAO ID : 알로디</li>
            </ul>
        </div>
        <div class="faq_div1">
            <ul id="right" class="faq_right" >
                <li><h3>공지사항</h3></li>
                <br>
                <li>- 2022 설 연휴 배송관련 안내</li>
                <li>- CJ대한통운 파업관련</li>
                <li>- CJ대한통운 파업 및 연말휴무 관련 공지</li>
                <li>- [무통장입금] 입금확인이 안될 경우</li>
            </ul>
        </div>
      
    </div>
    <div class="faq2">
        <div class="faq_question"> 
            <ul class=faq2_ul>
                <li><h2>무엇이든 물어보세요</h2></li>
                 
                        <li class="divlist"><a href="#">공지사항</a></li>
                        <li class="divlist"><a href="#">상품문의</a></li>
                        <li class="divlist"><a href="#">상품후기</a></li>
                 
                        <li><h2>이용안내 FAQ</h2></li>
                        <li><hr></li>
                    
            </ul>
        </div>
    </div>
    <!-- main end -->
    <!-- footer start -->
   		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- footer end -->
  
</body>
</html>
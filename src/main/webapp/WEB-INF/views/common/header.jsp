<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header start -->
    <header>
       
        <div class="gnb">
            <ul >
            	<c:if test="${sessionScope.customerID == null}">
                <li><a href="${path}/login.do">로그인</a></li>
                <li><a href="${path}/join.do">회원가입</a></li>
                <li><a href="${path}/cart_Order_List.ct">장바구니</a></li>
                <li><a href="${path}/member_commnu.bo">공지사항</a></li>
                </c:if>
            </ul>
            <ul>
				<c:if test="${sessionScope.customerID != null}">
				<li><span style="color:red">${sessionScope.customerID}</span></li>
                <li><a href="${path}/logout.do">로그아웃</a></li>
                <li><a href="${path}/modifyCustomer.do">정보수정</a></li>
                <li><a href="${path}/cart_Order_List.ct">장바구니</a></li>
                <li><a href="${path}/delivery_Order.co">주문조회</a></li>
                <li><a href="${path}/member_commnu.bo">공지사항</a></li>
                </c:if>
            </ul>
        </div>
        <!-- logo home 버튼 추가 필요 -->
        <div class="logo"><a href="${path}/main.do"><img src="${path}/resources/other_images/logo.png"></a>
        </div>
       
        <div class="lnb">
            <ul>
                <li><a href="${path}/best.st">베스트</a></li>
                <li><a href="${path}/best.st">수트</a></li>
                <li><a href="${path}/best.st">상의</a></li>
                <li><a href="${path}/best.st">셔츠</a></li>
                <li><a href="${path}/best.st">팬츠</a></li>
                <li><a href="${path}/best.st">아우터</a></li>
                <li><a href="${path}/best.st">슈즈</a></li>
            </ul>
        </div>
    </header>
    <!-- header end -->
</body>
</html>
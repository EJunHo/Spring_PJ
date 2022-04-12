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
	<ul class="menubarL">
		<li><h3>관리자 메뉴</h3><hr></li>
		
		<li> 
			<h4>재고관리</h4>
			<ul class="order_menu">
				<li><a href="${path}/productList.st">상품목록</a> </li>
				<li><a href="${path}/productAdd.st">상품등록</a> </li>
			</ul>
		</li>
			<li>
			<h4>주문관리</h4>
				<ul class="order_menu">
					<li><a href="${path}/order_Check.co">주문승인</a> </li>
					<li><a href="${path}/refund_manager.co">환불요청</a> </li>
				</ul>
			</li>
		<li><h4><a href="${path}/boardList.bo">게시판</a></h4></li>	
		<li><h4><a href="${path}/chartAction.st">결산</a></h4></li>
		<li><h4><a href="${path}/logout.do">로그아웃</a></h4></li>
	</ul>		
</body>
</html>
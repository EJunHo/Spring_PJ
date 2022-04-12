<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:if test="${deleteCnt == 0}">

<script type="text/javascript">
	alert("상품 삭제에 실패했습니다.")
</script>
</c:if>

<c:if test="${deleteCnt != 0}">
<script type="text/javascript">
	alert("상품을 삭제했습니다..")
	window.location="productList.st";
</script>
</c:if>
</body>
</html>
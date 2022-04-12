<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 처리 페이지</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- insertCnt 실패 -->
<c:if test="${insertCnt == 0}">
	<script type="text/javascript">
		alert("상품 등록 실패");
	</script>
</c:if>	

<c:if test="${insertCnt != 0}">
	<script type="text/javascript">
		alert("상품 등록 성공");
		window.location="productList.st";
	</script>

</c:if>
<!-- insertCnt 성공 -->	
</body>
</html>
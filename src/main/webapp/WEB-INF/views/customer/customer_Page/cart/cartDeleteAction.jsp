<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${c_delete==1}">
	<script type="text/javascript">
		alert("장바구니에서 삭제되었습니다...");
		window.history.back();
	</script>
</c:if>
<c:if test="${c_delete!=1}">
	<script type="text/javascript">
		alert("다시 확인하여 주세요...");
		window.history.back();
	</script>
</c:if>
</body>
</html>
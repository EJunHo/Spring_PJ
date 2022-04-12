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
<c:if test="${c_insert==1}">
	<script type="text/javascript">
		alert("추가되었습니다.");
		window.history.back();
	</script>
</c:if>
<c:if test="${c_insert!=1}">
	<script type="text/javascript">
		alert("입력하신 정보를 다시 확인해주세요.");
		window.history.back();
	</script>
</c:if>
</body>
</html>
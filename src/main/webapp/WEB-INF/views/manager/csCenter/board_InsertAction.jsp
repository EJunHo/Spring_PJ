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
	<!-- insertCnt 실패 -->
<c:if test="${insertCnt == 0}">
	<script type="text/javascript">
		alert("게시글 등록 실패");
		window.location="boardList.bo";
	</script>
</c:if>	

<c:if test="${insertCnt != 0}">
	<script type="text/javascript">
		alert("게시글 등록 성공");
		window.location="boardList.bo";
	</script>
</c:if>
<!-- insertCnt 성공 -->	
</body>
</html>
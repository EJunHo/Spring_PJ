<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="/manager/resources/js/request.js"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="500px">
	
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.writer}<br>
			<fmt:formatDate value="${dto.comment_date}" pattern="yyyy-mm-dd"/><br>
			${dto.console}<br>
			</td>
		</tr>
		
	</c:forEach>
	
	</table>
	
</body>
</html>
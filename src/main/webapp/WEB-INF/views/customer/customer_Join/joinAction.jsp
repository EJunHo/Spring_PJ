<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/customer_CSS/join.css">
<body>
    <!-- header start -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header end -->
	
	<!-- 메인 컨텐츠 start -->
	
	<!-- 회원 가입   -->
	
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("insert 실패"); 
		</script>
	</c:if>
	<c:if test="${insertCnt != 0}">
	<c:redirect url="mainSuccess.do?insertCnt=${insertCnt}" />
	</c:if>
	
	<!-- 메인 컨텐츠 end -->
	
	<!-- footer start -->
   	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- footer end -->
</body>
</html>
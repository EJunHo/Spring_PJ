<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content ="width=device-width, initial-scale=1"> 

<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/customer_CSS/join.css">
<script src="https://kit.fontawesome.com/42c47b0b4d.js" crossorigin="anonymous"></script>

<!-- 3-3. 자바스크립트 이벤트 추가: 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJS/join.js" defer></script>

<title>회원 정보 수정</title>
</head>
<body>

<!-- header 시작 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- header 끝 -->
		<c:if test="${updateCnt == 0}">
			<script type="text/javascript">	
			errorAlert(updateError);
			</script>
		</c:if>
	
		<c:if test="${updateCnt != 0 }">
			<%
			//모든 세션 삭제 비밀번호가 변경되었으므로 다시 로그인 하도록 함(세션이 남아있으면 로그인 시 변경안될수 있음)
			request.getSession().invalidate();
			%>
			<script type="text/javascript">
			setTimeout(() => {
				alert("회원정보 수정 성공");
				window.location="${path}/main.do";
			}, 1000);
			//1초 후 main.jsp로 이동
			</script>
		</c:if>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- footer 시작 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- footer 끝  -->	
</body>
</html>
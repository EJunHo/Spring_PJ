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

<title>회원 탈퇴</title>
</head>
<body>

<!-- header 시작 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- header 끝 -->
	  <!-- 패스워드가 일치할때  -->
	  <!-- 아이디와 비밀번호 일치 : 1 -->
   <c:if test="${selectCnt==1}">
      <!-- 탈퇴실패 -->
      <c:if test="${deleteCnt ==0}">
         <script type="text/javascript">
         errorAlert(idpwdError);
         </script>
      </c:if>
      <!-- 탈퇴성공 -->
      <c:if test="${deleteCnt !=0}">
         <%
            request.getSession().invalidate(); //모든 세션 삭제
         %>
         <script type="text/javascript">
            setTimeout(function() {
               alert("탈퇴되었습니다.");
               window.location="main.do";
            }, 1000);
         </script>   
      </c:if>
   </c:if>   
                     
   <c:if test="${selectCnt!=1}">
      <script type="text/javascript">
       	alert("탈퇴 실패")
      </script>
   </c:if>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- footer 시작 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- footer 끝  -->	
	
	
</body>
</html>
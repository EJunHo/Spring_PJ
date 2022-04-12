<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content ="width=device-width, initial-scale=1"> 
<title>회원수정 - 인증화면</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/customer_CSS/join.css">


<script src="https://kit.fontawesome.com/42c47b0b4d.js" crossorigin="anonymous"></script>

<!-- 3-3. 자바스크립트 이벤트 추가: 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJS/join.js" defer></script>


</head>
<body>

	<div class="wrap">
	
	<!-- header 시작 -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- header 끝 -->
	
	<!-- 메인 컨텐츠 시작 -->
	<div id="container">
		<div id="contents">
			<!-- 상단 중앙 시작 -->
			<div id="section1">
				<h1 align="center">로그인</h1>
			</div>
			<!-- 상단 중앙2 시작 -->
			<div id="section2">
				<div id="s2_inner">
					<div class="login">
						<form name="passwordform" action="${path}/modifyDetailAction.do">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
							<table>
								<colgroup>
									<col style="width: 80px;">
									<col style="width: 80px;">
								</colgroup>
								
								<tr>
									<th colspan="2" >
										회원정보 수정을 위해 <span style="color:#FF82AA;">${customerID}</span>님의 비밀번호를 입력하세요.
									</th>
								
								</tr>
								<tr>
									<th>* 비밀번호</th>
									<td><input type="password" id="password" class="input" name="password" size="15" placeholder="공백없이 15자 이내로 작성" autofocus required></td>
								</tr>
								<tr>
									<td colspan="2" style="border-bottom: none;">
									<br>
									<div align="center" class="input">
										<input type="submit" value="회원수정">
										<input type="button" value="수정취소" onclick="window.history.back();">
									</div>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인 컨텐츠 끝 -->
	</div>
	
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>	
	
	<!-- footer 끝 -->
	
</body>
</html>
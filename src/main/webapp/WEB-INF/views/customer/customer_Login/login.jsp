<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content ="width=device-width, initial-scale=1"> 
<title>로그인</title>

<!-- CSS -->
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/customer_CSS/login.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- fontawesome  -->
<script src="https://kit.fontawesome.com/42c47b0b4d.js" crossorigin="anonymous"></script>

<!-- 자바스크립트 이벤트 추가: 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->

</head>
<body>
	<div class="wrap"><!-- 묶음1 -->

	<!-- header 시작 -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- header 끝 -->
	
	<!-- UserLoginFaulureHandeler 에서 msg날림 -->
	<c:if test="${errorMsg != null }">
		<script type="text/javascript">
			alert("${errorMsg}");		
		</script>
	</c:if>
	
	<!-- 로그인 시작 -->
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
						<form name="loginform" action="${path}/login_check.do" method="post"onsubmit="return loginChk();">
							<input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}">
							<table>
								<colgroup>
									<col style="width: 80px;">
									<col style="width: 80px;">
								</colgroup>
								<tr align="center">
									<th colspan="2">
										<c:choose>
											<c:when test="${selectCnt == -1}">
												"비밀번호가 다릅니다. 다시 확인하세요"
											</c:when>
											<c:when test="${selectCnt == 0}">
												"비가입 회원입니다. 회원가입을 먼저 하시기 바랍니다."
											</c:when>
											<c:when test="${selectCnt == 1}">
												"가입 성공"
											</c:when>
											<c:otherwise>
												"환영합니다." <!-- 처음 방문, 로그아웃 -->
											</c:otherwise>
										</c:choose>
									</th>								
								</tr>
								<tr>
									<th>* 아이디</th>
									<td><input type="text" class="input" name="id" size="25" placeholder="공백없이 15자 이내로 작성" autofocus required></td>
								</tr>
								<tr>
									<th>* 비밀번호</th>
									<td><input type="password" class="input" name="password" size="25" placeholder="공백없이 15자 이내로 작성" required></td>
								</tr>
								<tr>
									<td colspan="2" style="border-bottom: none;">
									<br>
									<div align="center" class="col-12">
										<button type="submit"  class="btn btn-secondary" >로그인</button>
										<input type="button"  class="btn btn-secondary" value="회원가입" onclick="window.location='${path}/join.do'">
									</div>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 로그인 끝 -->
	</div><!-- 묶음1 -->
	
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
	
</body>
</html>
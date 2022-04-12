<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹  -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>

<title>Main</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/customer_CSS/join.css">
<script src="https://kit.fontawesome.com/ceb28bc2e6.js" crossorigin="anonymous"></script>
<!-- /* 3-3 javascript 추가 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 MAIN.JS에서 추가*/ -->
<script src="${path}/resources/js/customerJS/join.js" defer></script>
</head>
<body>
 <!-- header start -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- header end -->
	<!-- 메인 컨텐츠 start -->
	<!-- 화면 크기 조정을 위한 container -->

	<div id="container">
		<div id="contents">
			<!-- 상단 중앙 시작  -->
			<div id="section1">
				<h2 align="center" >회원가입</h2>
			</div>
				<!-- 상단 중앙2 시작 -->
				<div id="section2">
					<div id="s2_inner">
						<div class="join">
							<!-- <form name="joinform" action="joinAction.do" method="post" onsubmit="return signInCheck()"> -->
							<form name="joinform" action="${path}/joinAction.do"  onsubmit="return signInChk()">
								<input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input type="hidden" name="hiddenId" value="0">
								<table>
									<colgroup>
										<col style="width:150px;">
										<col style="width:auto;">
										<col style="width:atuo;">
									</colgroup>
										<tr>
											<th scope="row"> * 아이디 </th>
											<td><input type="text" class="input" name="id" size="50" placeholder="공백없이 20자 이내로 작성."></td>
											<td><input type="button" name="dupChk" value="중복확인" style="margin-left:10px;" onclick="comfirmId();"></td>
										</tr>
										<tr>
											<th scope="row"> * 비밀번호 </th>
											<td colspan="2"><input type="password" class="input" name="password" size="50" placeholder="공백없이 20자 이내로 작성."></td>
										</tr>
										<tr>
											<th scope="row"> * 비밀번호 확인 </th>
											<td colspan="2"><input type="password" class="input" name="repassword" size="50" placeholder="비밀번호 확인."></td>
										</tr>
										<tr>
											<th scope="row"> * 이름 </th>
											<td colspan="2"><input type="text" class="input" name="name" size="50"></td>
										</tr>
										<tr>
											<th scope="row"> * 생년월일 </th>
											<td colspan="2"><input type="date" class="input" name="birthday" size="1000" ></td>
										</tr>
										<tr>
										<!-- 상세주소로 우편번호 찾기 버튼 추가 -->
											<th scope="row"> * 주소 </th>
											<td colspan="2"><input type="text" class="input" name="address" size="50"></td>
										</tr>
										<tr>
											<th scope="row"> 핸드폰 </th>
											<td><input type="text" class="input" name="hp1"  maxlength="3" style="width:50px" >
											-
											<input type="text" class="input" name="hp2" maxlength="4" style="width:70px" >
											-
											<input type="text" class="input" name="hp3" maxlength="4" style="width:70px">
											</td>
										</tr>
										<tr>
											<th scope="row"> * 이메일 </th>
												<td><input type="text" class="input" name="email1" maxlength="20" style="width:100px">
												@
												<input type="text" class="input" name="email2" maxlength="20" style="width:100px">
												<select class="input" name="email3" style="width:100px" onchange="selectEmailChk()">
													<option value="0">직접입력</option>
													<option value="naver.com">네이버</option>
													<option value="daum.net">다음</option>
													<option value="gmail.com">구글</option>
													<option value="nate.com">네이트</option>
												</select>
												</td>
										</tr>
										<tr>
											<td colspan="3" style="border-bottom:none">
												<br>
												<div class="btn_input">
													<!-- submit : 폼에서 입력한 값들을 전송, action에서 지정한 페이지로 결과값 출력 -->
													<!-- type="button" onclick="window.location='${path}/customer_Login/login.html' -> 이동할 페이지 -->
													<input type="submit" value="회원가입">
													<input type="reset" value="초기화">
													<input type="button" class="button" value="가입취소" onclick="window.location='${path}/main.do'">
												</div>
											</td>
										</tr>
								</table>
							</form>
						</div>
					</div>		
				</div>
		</div>
	</div>
	<!-- 메인 컨텐츠 end -->
	<!-- footer start -->
 	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer end -->

</body>
</html>
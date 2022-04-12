<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 - 게시글 등록</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">
<!-- 인증 -->
<script src="https://kit.fontawesome.com/f07d2e0c9f.js" crossorigin="anonymous"></script>

<!-- 3-3. 자바스크립트 추가 : 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html이 브라우저창에 표시가 안되는 것을 방지 -->
<script>
$(function() {
	$("#btnSave").click(function() {
		document.board_insert.submit();
		//button의 역할이 submit처럼 변함
	});
});
</script>
</head>
<body>
    <!-- header start -->
  	<%@ include file="/WEB-INF/views/common/header.jsp" %>	
    <!-- header end -->
    <!-- main start -->
    <div id="container">
		<div id="contents">
			<!-- section1 시작 -->
			<div id="section1">
				<h1 align="left"> 상품등록 </h1>
					<hr>
			</div>	
			<!-- section2 시작 -->
			<div id="section2">
				<!-- 좌측 내용 시작 -->
				<div id="left">
					<div class="left_inside">
						<!-- 좌측메뉴 start-->
						<%@ include file="/WEB-INF/views/common/leftmenu.jsp" %>
						<!-- 좌측메뉴 end-->	
					</div>
				</div>
			<!-- 우측 내용 시작 -->
				<div id="right">
					<div class="table_div">
						<form action="${path}/board_InsertAction.bo" method="post" name="board_insert">
							<input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}">
							<table style="width:800px" align="center">
								<tr>
									<th>작성자</th>
									<td><input type="text" name="writer" id="name" size="20" placeholder="작성자"class="input" required autofocus></td>
										
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" name="password" id="password" class="input" size="20" placeholder="비밀번호 입력" required></td>
										
								</tr>
								<tr>
									<th>글 제목</th>
									<td><input type="text" class="input" name="title" id="title" size="50" placeholder="글 제목 입력" required></td>
								</tr>
								<tr>
									<th>글 내용</th>
									<td><textarea rows="5" cols="60" name="content" id="content"></textarea></td>
								</tr>
								 
								 <tr>
								 	<th colspan="2">
								 		<input type="button" class="inputButton" value="등록" id="btnSave">
								 		<input type="reset" class="inputButton" value="초기화" id="btnReset">
								 </tr>
							</table>
						</form>
					</div>
				</div>	
			</div>			
		</div>
	</div>

    <!-- main end -->
    <!-- footer start -->
     <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- footer end -->
   
</body>
</html>
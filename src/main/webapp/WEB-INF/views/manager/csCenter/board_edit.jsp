<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>관리자 - 게시글 수정삭제</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">
<!-- jquery 동작 -->
<script>
$(function(){
	//수정/삭제화면으로 이동
	$("#btnUpdate").click(function() {
		var writer = $("#writer").val();
		var password = $("#password").val();
		var title = $("#title").val();
		var content = $("#content").val();
		if(writer == "") {
			alert("작성자를 입력하세요");
			$("#writer").focus();
			return false;
		} 
		if(password == "") {
			alert("패스워드를 입력하세요");
			$("#password").focus();
			return false;
		} 
		if(title == "") {
			alert("타이틀을 입력하세요.");
			$("#title").focus();
			return false;
		}
		if(content == "") {
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
		}
		//에디트 페이지
		document.form1.action="${path}/board_updateAction.bo?${_csrf.parameterName}=${_csrf.token}";
		//form에 입력한 값을 들고 board_updateAction.bo
		document.form1.submit();
		
	});
	$("#btnList").click(function() {
		location.href="${path}/boardList.bo?${_csrf.parameterName}=${_csrf.token}";
	});
	
	//삭제버튼 클릭
	$("#btnDelete").click(function() {
		//컨트롤러로 보냄
		if(confirm("삭제하시겠습니까?")) {
			document.form1.action="${path}/board_DeleteAction.bo?${_csrf.parameterName}=${_csrf.token}";
			document.form1.submit();	
		} 
		
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
				<h1 align="left"> 수정삭제 </h1>
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
						<form method="post" name="form1">
							<table style="width:800px" align="center">
								<tr>
									<th style="width:150px">작성일</th>
									<td style="width:150px;" align="center">
										 <fmt:formatDate pattern="yyyy-mm-dd hh:mm" value="${dto.indate}" />	
									</td>
									<th style="width:150px">조회수</th>
									<td>${dto.redCnt}</td>
								</tr>
								<tr>
									<th style="width:150px">작성자</th>
									<td style="width:150px;" align="center">
									<input type="text" name="writer" id="writer" size="20" value="${dto.writer}">
									</td>
									<th style="width:150px">비밀번호</th>
									<td style="width:150px"><input type="password" name="password" id="password" class="input" size="10" placeholder="비밀번호 입력" required>
										<c:if test="${param.pwd_error == 'y' }">
											<span style="color:red">비밀번호가 일치하지 않습니다. </span>
										</c:if>
									</td>
								</tr>
								<tr>
									<th>글 제목</th>
									<td colspan="3" style="text-align:left">
									<input type="text" name="title" id="title" size="50" value="${dto.title}"></td>
								</tr>
								<tr>
									<th>글 내용</th>
									<td colspan="3" style="text-align:left">
									
									<textarea name="content" id="content">${dto.content}</textarea></td>
								</tr>
								 
								 <tr>
								 	<th colspan="4">
								 		<input type="hidden" name="num" value="${dto.num}">
								 		<input type="button" class="inputButton" value="수정" id="btnUpdate">
								 		<input type="button" class="inputButton" value="삭제" id="btnDelete">
								 		<input type="button" class="inputButton" value="목록" id="btnList">
								 	</th>
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
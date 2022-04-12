<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>게시판</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">

</head>
<body>
    <!-- header start -->
    	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header end -->
    <div id="container">
		<div id="contents">
			<!-- section1 시작 -->
			<div id="section1">
				<h1 align="left"> 상품문의 </h1>
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
					<!-- 메뉴리스트 -->
					
						<table style="width: 1000px" align="center">
							<tr>
								<th style="width:5%"></th>
								<th style="width:5%">번호</th>
								<th style="width:10%" >상품정보</th>
								<th style="width:50%">제목</th>
								<th style="width:15%">작성자</th>
								<th style="width:12%">작성일</th>
								
							</tr>
						
							<tr>
								<td><input type="checkbox" name="board_list">
								</td>
								<td>1001</td>
								<td>hong</td>
								<td>옷이 언제오나요???</td>
								<td>옷구매자</td>
								<td>2022-01-29</td>
							</tr>
							
						</table>
					</div>
					<div class="button">
						
						<input type="button" value="삭제" style="font-size: 15px;">
					</div>
					
						<!-- board page start -->
						<div class="page">
							<ul class="page-num">
								<li><a href="#"></a><<</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">>></a></li>
							</ul>
						</div>
						<!-- board page end -->
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
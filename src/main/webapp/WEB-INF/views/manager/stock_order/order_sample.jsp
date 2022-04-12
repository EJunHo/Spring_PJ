<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>주문카테고리</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">

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
				<h1 align="left"> 주문카테고리 </h1>
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
					<select name="제품상태">
						<option value="재고있음">재고있음</option>
						<option value="재고없음">재고없음</option>
						<option value="발주중">발주중</option>
					</select>
					<div class="table_div">
						<table style="width:800px" align="center">
							<tr>
								<th style="width:5%">번호</th>
								<th style="width:10%">상품코드</th>
								<th style="width:15%">이미지</th>
								<th style="width:10%">상품정보</th>
								<th style="width:10%">상품분류</th>
								<th style="width:10%">판매가</th>
								<th style="width:10%">원가</th>
								<th style="width:10%">재고수량</th>
								<th style="width:5%">상태</th>
								<th style="width:10%">구매횟수</th>
								<th style="width:15%">등록일</th>
							</tr>
							<!-- 게시글이 있으면  -->
							<!--2행  -->
							<tr>
								<td>1</td>
								<td>1001</td>
								<td>?</td>
								<td>?</td>
								<td>?</td>
								<td>10,000원</td>
								<td>5,000원</td>
								<td>50</td>
								<td>주문</td>
								<td>2</td>
								<td>2022.1.21</td>
							</tr>
							<!-- 3행 -->
							<tr>
								<td>1</td>
								<td>1001</td>
								<td>?</td>
								<td>?</td>
								<td>?</td>
								<td>10,000원</td>
								<td>5,000원</td>
								<td>50</td>
								<td>주문</td>
								<td>2</td>
								<td>2022.1.21</td>
							</tr>
						</table>
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
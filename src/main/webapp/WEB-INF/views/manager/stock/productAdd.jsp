<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>관리자 - 제품등록</title>
<!-- CSS -->
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/customer_CSS/login.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
						<form action="${path}/productAddAction.st?${_csrf.parameterName}=${_csrf.token}" method="post" name="productAdd" enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<table style="width:800px;" align="center">
								<tr>
									<th>브랜드 *</th>
									<td><input type="text" name="brand" id="brand" size="60" placeholder="브랜드 입력"class="input" required autofocus></td>
										
								</tr>
								<tr>
									<th>제품명 *</th>
									<td><input type="text" name="name" id="name" size="60" placeholder="상품명 입력"class="input" required autofocus></td>
										
								</tr>
								<tr>
									<th>제품 이미지 *</th>
									<td><input type="file" name="Img" id="Img" class="inputOpt" accept="image/*"></td>
										
								</tr>
								<tr>
									<th>상품카테고리 *</th>
									<td>
										<select id="category" class="input" name="category" required>
											<option>상품 카테고리</option>
											<option value="Outer" selected>Outer</option>
											<option value="Shirt">Shirt</option>
											<option value="Pants">Pants</option>
											<option value="Shoes">Shoes</option>
											<option value="TOP">TOP</option>
											<option value="Suit">Suit</option>
										</select>
									</td>
								 </tr>
								 
								 <tr>
								 	<th>제품설명 *</th>
								 	<td>
								 		<textarea id="content" name="content" placeholder="상세설명입력" rows="5" cols="50"></textarea>
								 	</td>
								 
								 </tr>
								 
								<tr>
									<th>판매가격</th>
									<td><input type="number" class="input" name="price" id="price" size="10" placeholder="상품 판매가 입력"></td>
								</tr>
 								<tr>
									<th>등록수량</th>
									<td><input type="number" class="input" name="count" id="count" size="10" placeholder="상품 재고수량 입력"></td>
								</tr>
								<tr>
									<th>판매상태</th>
									<td>
										<select id="status" class="input" name="status" required>
											<option>판매 상태</option>
											<option value="판매중" selected>판매중 </option>
											<option value="품절">품절</option>
											<option value="입고중">입고중</option>
										</select>
									</td>
								 </tr>
								 <tr>
								 	<th colspan="2">
								 		<input type="submit" class="btn btn-secondary" value="등록">
								 		<input type="reset" class="btn btn-secondary" value="초기화">
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
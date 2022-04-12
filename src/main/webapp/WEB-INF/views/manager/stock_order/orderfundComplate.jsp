<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>환불완료</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/search.CSS">
</head>
<body>
    <!-- header start -->
    	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header end -->
    <div id="container">
		<div id="contents">
			<!-- section1 시작 -->
			<div id="section1">
				<h1 align="left"> 환불완료 </h1>
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
					<div class="select">
                        <fieldset class="search_field">
							<input type="date" id="search_cal">
                        <select id="search_date">
                        <option>일주일</option>
                        <option>한달</option>
                        <option>세달</option>
                        <option>전체</option>
                        </select>
                        <select id="search_title">
                            <option>제목</option>
                            <option>내용</option>
                            <option>글쓴이</option>
                            <option>별명</option>
                            <option>상품정보</option>
                        </select>
                        <input type="search" value="" name="search" id="search_text">
                        <input type="button" value="검색" name="검색" id="search_btn">
                        </fieldset>
                        </div>
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
    <!-- footer start -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
     <!-- footer end -->
</body>
</html>
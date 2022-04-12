<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>환불취소</title>
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
				<h1 align="left"> 환불취소 </h1>
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
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<table style="width:800px" align="center" class="table table-hover">
							<tr>
								<th style="width:5%">배송번호</th>
								<th style="width:10%">상품명</th>
								<th style="width:15%">상품수량</th>
								<th style="width:10%">상품가격</th>
								<th style="width:10%">요청상태</th>
								<th style="width:10%">요청일</th>
								<th style="width:10%"></th>
								<th style="width:10%"></th>
							</tr>
							
							<c:forEach var="r" items="${refund}">
							<tr>
								<td>${r.delivery_no}</td>
								<td>${r.confirm_name}</td>
								<td>${r.confirm_count}</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${r.confirm_price}" /></td>
								<td>${r.confirm_state}</td>
								<td>${r.confirm_date}</td>
								<td>
									<button type="button" name="confirm_btn" value="${r.delivery_no}" onclick="window.location='${path}/cancle.co?delivery_no=${r.delivery_no}&order_count=${r.confirm_count}&pd_no=${o.pd_no}'">승인</button>
								</td>
								<td>
									<button type="button" name="confirm_btn" value="${r.delivery_no}" onclick="window.location='${path}/cancle.co?delivery_no=${r.delivery_no}&order_count=${r.confirm_count}&pd_no=${o.pd_no}'">취소</button>
								</td>
							</tr>
							</c:forEach>
						
						</table>
					    <!-- 페이징 처리 -->
                        <!-- 이전 버튼 활성화 여부 -->
                        <c:if test="${paging.startPage > 10}">
                           <a href="${path}/refund_manager.co?pageNum=${paging.prev}" style="color: black">[이전]</a>
                        </c:if> 
                        
                        <!-- 페이지번호 처리 -->
                        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                           <a href="${path}/refund_manager.co?pageNum=${num}"  style="color: black">${num}</a>
                        </c:forEach>
                        
                        <!-- 다음 버튼 활성화 여부 -->
                        <c:if test="${paging.endPage < paging.pageCount}">
                           <a href="${path}/refund_manager.co?pageNum=${paging.next}"  style="color: black">[다음]</a>
                        </c:if>
					</div>
					
				</div>	
			</div>			
		</div>
	</div>
    <!-- footer start -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
     <!-- footer end -->
</body>
</html>
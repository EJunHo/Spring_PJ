<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>주문승인</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/search.CSS">
<script src="${path}/resources/js/customerJS/join.js" defer></script>

</head>
<body>
	
    <!-- header start -->
   	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header end -->
    <div id="container">
		<div id="contents">
			<!-- section1 시작 -->
			<div id="section1">
				<h1 align="left"> 주문승인 </h1>
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
						<form name="order_form" class="order_form" id="order_form">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<div>
							</div>
							<div class="table_div">
								<table style="width:800px" align="center" class="table table-hover">
								<tr>
									<th style="width:10%">번호</th>
									<th style="width:15%">상품명</th>
									<th style="width:10%">상품수량</th>
									<th style="width:10%">상품가격</th>
									<th style="width:10%">승인상태</th>
									<th style="width:15%">주문날짜</th>
									<th style="width:5%">승인</th>
									<th style="width:5%">취소</th>
								</tr>
								
								<c:forEach var="o" items="${confirm}">
									<c:if test="${o.confirm_state == '승인대기'}">
								<input type="hidden" value="${o.delivery_no}" name="hidden_no" > 
								  ${o.pd_no}
								<tr>
									<td>${o.delivery_no}</td>
									<td>${o.confirm_name}</td>
									<td>${o.confirm_count}</td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${o.confirm_price}" /></td>
									<td>${o.confirm_state}</td>
									<td>${o.confirm_date}</td>
									<td>
										<button type="button" name="confirm_btn" value="${o.delivery_no}" onclick="window.location='${path}/confirm.co?delivery_no=${o.delivery_no}&order_count=${o.confirm_count}&pd_no=${o.pd_no}'">승인</button>
									</td>
									<td>
										<button type="button" name="confirm_btn" value="${o.delivery_no}" onclick="window.location='${path}/cancle.co?delivery_no=${o.delivery_no}&order_count=${o.confirm_count}&pd_no=${o.pd_no}'">취소</button>
									</td>
								</tr>
									</c:if>
								</c:forEach>
							
								<!-- board page start -->
									<tr>
			                   		<td colspan="10" align="center">
			                        <!-- 페이징 처리 -->
			                        <!-- 이전 버튼 활성화 여부 -->
			                        <c:if test="${paging.startPage > 10}">
			                           <a href="${path}/order_Check.co?pageNum=${paging.prev}" style="color: black">[이전]</a>
			                        </c:if> 
			                        
			                        <!-- 페이지번호 처리 -->
			                        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
			                           <a href="${path}/order_Check.co?pageNum=${num}"  style="color: black">${num}</a>
			                        </c:forEach>
			                        
			                        <!-- 다음 버튼 활성화 여부 -->
			                        <c:if test="${paging.endPage < paging.pageCount}">
			                           <a href="${path}/order_Check.co?pageNum=${paging.next}"  style="color: black">[다음]</a>
			                        </c:if>
			                  		  	 </td>
			                 		</tr>  
			                 		
								</table>
						<!-- board page end -->
							</div>
						</form> 
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
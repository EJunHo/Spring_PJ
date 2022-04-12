<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>제무결산</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/search.CSS">
<script src="${path}/resources/js/customerJS/join.js" defer></script>	<!-- JS기능 -->
<script>

/* 카트에 진입된 제품 Count 및 Price */
let totalPrice = 0;			//상품 개당 가격
let totalCount = 0;			//상품 수량
let total_CartPrice = 0;	//상품 수량 * 가격 

/* parameter value값을 받아와서 값을 저장 하고 출력 */
$(document).ready(function(){
	/* 가격 및 수량 초기화 */
	let totalPrice = 0;
	let totalCount = 0;
	let total_Account = 0;
	
	$(".account_id").each(function(index, element) {
		
		totalPrice = parseInt($(element).find("#hiddenPrice").val());
		totalCount = parseInt($(element).find("#hiddenCount").val());
		total_Account += totalPrice * totalCount;
		console.log(totalPrice);
		console.log(totalCount);
		
	});
	
	$(".total_Price_span").text(total_Account);
	
});


</script>
</head>
<body>
    <!-- header start -->
   	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header end -->
    <div id="container">
		<div id="contents">
			<!-- section1 시작 -->
			<div id="section1">
				<h1 align="left"> 제무결산 </h1>
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
                    <!-- date button start-->
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
                    <!-- date button end -->
					<div class="table_div">
						<ul>
							<li style="list-style: none"><span style="font-size: 15; font: bold;">결산금액</span></li>
							<li style="list-style: none"><span class="total_Price_span"></span></li>
						</ul>							
						<table style="width: 1000px" align="center">
							<tr>
								<th style="width:10%">배송코드</th>
								<th style="width:25%">상품명</th>
								<th style="width:20%">상품가격</th>
								<th style="width:10%">상품수량</th>
								<th style="width:15%">상태</th>
                                <th style="width:15%">주문일</th>
							</tr>
							<c:forEach var="a" items="${account}"> 
								<td class="account_id">
									<input type="hidden" id="hiddenPrice" name="hiddenPrice" value="${a.confirm_price}">
									<input type="hidden" id="hiddenCount" name="hiddenCount" value="${a.confirm_count}">
									<input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}">
								</td>
							<tr>
								 <td>${a.delivery_no}</td>
								 <td>${a.confirm_name}</td>
								 <td>${a.confirm_price}</td>
								 <td>${a.confirm_count}</td>
								 <td>${a.confirm_state}</td>
								 <td>${a.confirm_date}</td>
							</tr>		
								
							</c:forEach>
							<tr>
		                   		<td colspan="6" align="center">
		                    
		                    	</td>
		                 	 </tr>           
						</table>
						    <!-- 페이징 처리 -->
	                        <!-- 이전 버튼 활성화 여부 -->
	                        <c:if test="${paging.startPage > 10}">
	                           <a href="${path}/account.co?pageNum=${paging.prev}" style="color: black">[이전]</a>
	                        </c:if> 
	                        
	                        <!-- 페이지번호 처리 -->
	                        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
	                           <a href="${path}/account.co?pageNum=${num}"  style="color: black">${num}</a>
	                        </c:forEach>
	                        
	                        <!-- 다음 버튼 활성화 여부 -->
	                        <c:if test="${paging.endPage < paging.pageCount}">
	                           <a href="${path}/account.co?pageNum=${paging.next}"  style="color: black">[다음]</a>
	                        </c:if>
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
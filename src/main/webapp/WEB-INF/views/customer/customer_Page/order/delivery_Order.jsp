<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">
<script src="${path}/resources/js/customerJS/join.js" defer></script>
<script src="https://kit.fontawesome.com/ceb28bc2e6.js" crossorigin="anonymous"></script>


<title>Insert title here</title>
</head>
<body>
	 <!-- header start -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header end -->
    <!-- main start -->
      <c:if test="${customerID != null}">
        <div id ="container">
            <div id="contents">
                <div id="title">
                    <h1 align="left">주문정보</h1>
                    <hr>
                </div>
                    <ul class="menu">
                        <li class="menu_tap"><a href="#" style="text-decoration: none">주문내역조회</a>(<span id="total">0</span>)</li>
                        <li class="menu_css"><a href="#" style="text-decoration: none">취소/반품/교환 내역</a>(<span id="cs_total">0</span>)</li>
                    </ul>	
                    <hr>
                    <fieldset id="date_input">
                        <legend>검색</legend>
                        <div id="order_state">
                        <select class="order_state">
                                <option value="전체 주문처리상태">전체 주문처리상태</option>
                                <option value="입금전">입금전</option>
                                <option value="배송준비중">배송준비중</option>
                                <option value="배송중">배송중</option>
                                <option value="배송완료">배송완료</option>
                                <option value="취소">취소</option>
                                <option value="교환">교환</option>
                                <option value="환불">환불</option>
                        </select>
                         </div>
                   
                    <p class="date_button">
                        <a href="#" class="d_button" days="00">오늘</a>
                        <a href="#" class="d_button" days="07">1주일</a>
                        <a href="#" class="d_button" days="30">1개월</a>
                        <a href="#" class="d_button" days="90">3개월</a>
                        <a href="#" class="d_button" days="180">6개월</a>
                    </p>
                    <div id="replace">
                        <span class="replace_cal">
                            <input type="date" name="start_date" class="start_date" size="10" 
                            value="2022-01-28" type="text">
                            <input type="date" name="end_date" class="end_date" size="10" 
                            value="2022-01-28" type="text">
                            <input type="button" value="조회" name="search" class="search">
                        </span>
                    </div>
                    </fieldset>
                    <h2>주문 상품 정보   </h2>
                    <br>
                    <hr>
                        <div class="table_div">
							<form name="form1" >
                            <table style="width:90%" align="center">
                                <tr><!-- 카트안에 들어온 제품들에 대해 체크  -->
                                    <th style="width:10%">상품명</th>
                                    <th style="width:10%">상품가격</th>
                                    <th style="width:5%">상품수량</th>
                                    <th style="width:10%">승인여부</th>
                                    <th style="width:10%">구매일</th>
                                    <th style="width:5%">상품환불</th>
                                    <th style="width:5%">구매취소</th>
                                </tr>
                               	
                                 <c:forEach var="o" items="${confirm}">
                                <tr>
                                    <td>${o.confirm_name}</td>
                                    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${o.confirm_price}" /></td>
                                    <td>${o.confirm_count}</td>
                                    <td>${o.confirm_state}</td>
                                    <td>${o.confirm_date}</td>
                                 <c:if test="${o.confirm_state == '제품준비중'}">
                                    <td><button type="button" name="refund_btn" value="${o.confirm_state}" onclick="window.location='${path}/refund.co?delivery_no=${o.delivery_no}&order_count=${o.confirm_count}&pd_no=${o.pd_no}'">환불</button></td>
                                    <td><button type="button" name="cancle_btn" value="${o.confirm_state}" onclick="window.location='${path}/order_cancle.co?delivery_no=${o.delivery_no}&order_count=${o.confirm_count}&pd_no=${o.pd_no}'">취소</button></td>
                                 </c:if>
                                </tr>
                               
                                	</c:forEach>
                                
                                <tr>
			                   		<td colspan="10" align="center">
				                        <!-- 페이징 처리 -->
				                        <!-- 이전 버튼 활성화 여부 -->
				                        <c:if test="${paging.startPage > 10}">
				                           <a href="${path}/delivery_Order.co?pageNum=${paging.prev}" style="color: black">[이전]</a>
				                        </c:if> 
				                        
				                        <!-- 페이지번호 처리 -->
				                        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
				                           <a href="${path}/delivery_Order.co?pageNum=${num}"  style="color: black">${num}</a>
				                        </c:forEach>
				                        
				                        <!-- 다음 버튼 활성화 여부 -->
				                        <c:if test="${paging.endPage < paging.pageCount}">
				                           <a href="${path}/delivery_Order.co?pageNum=${paging.next}"  style="color: black">[다음]</a>
				                        </c:if>
			                  		</td>
		                 		</tr>   
							
                            	 </table>
                            	 </form>
                                </div>
            				</div>
       					</div>
     				</c:if>
    <!-- main end -->
    <!-- footer start -->
  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- footer end -->
  
</body>
</html>
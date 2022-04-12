<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">

<script src="https://kit.fontawesome.com/ceb28bc2e6.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	 <!-- header start -->
    	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header end -->
    <!-- main start -->
        <div id ="container">
            <div id="contents">
                <div id="title">
                    <h1 align="left">장바구니</h1>
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
                    <h2>주문 상품 정보</h2>
                    <br>
                    <hr>
                    <div id="right">
                        <div class="table_div">
                            <table style="width:100%" align="center">
                                <tr>
                                    <th style="width:10%">상품번호</th>
                                    <th style="width:10%">상품명</th>
                                    <th style="width:30%">상품이미지</th>
                                    <th style="width:10%">상품가격</th>
                                    <th style="width:10%">상품수량</th>
                                 
                                </tr>
                                <!-- 게시글이 있으면  -->
                                <!--2행  -->
                                <c:forEach var="list" items="${cart}">
                                <tr>
                                    <td>${list.order_no}</td>
                                    <td>${list.order_name}</td>
                                    <td><img src="${list.order_img}" width="50px"></td>
                                    <td>${list.order_price}</td>
                                    <td>${list.order_count}</td>
                                </tr>
                                </c:forEach>
                            </table>
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
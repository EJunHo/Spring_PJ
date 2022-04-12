<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/cart_order_list.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script src="${path}/resources/js/customerJS/join.js" defer></script>	<!-- JS기능 -->
<script src="https://kit.fontawesome.com/ceb28bc2e6.js" crossorigin="anonymous"></script>
<script>

	/* 카트에 진입된 제품 Count 및 Price */
	let cart_arr_item =[];		//체크 완료 상품
	let totalPrice = 0;			//상품 개당 가격
	let totalCount = 0;			//상품 수량
	let item_total = 0;			//상품 수량 * 가격
	let total_CartPrice = 0;	//전체 가격

	/* parameter value값을 받아와서 값을 저장 하고 출력 */
	$(document).ready(function(){
		/* 가격 및 수량 초기화 */
		let totalPrice = 0;
		let totalCount = 0;
		let item_total = 0;		
		let total_CartPrice = 0;
	
		$(".cart_info_id").each(function(index, element) {
				
				totalPrice = parseInt($(element).find("#hiddenPrice").val());
				totalCount += parseInt($(element).find("#hiddenCount").val());
				total_CartPrice += parseInt($(element).find("#hiddenTotalPrice").val());				
			
				if(totalPrice == 0) {
						/* 장바구니 값이 없을때 */
						$("#area_price_info").css("visibility","hidden");
					} else {
						/* 장바구니 값이 있을때 */
						$(".totalCount_span").text(totalCount);
						$(".countPrice_span").text(total_CartPrice);
					}
		});
	});
	
	/* 상품 구매 페이지 */
	function purchase_Item() {
	if ($("input[name=choice_Chk]").is(":checked")) {
			
			// 체크된 상태를 확인하여 false바꿔준다.
			$("input[name=choice_Chk]:checked").each(function(index, element) {
				$(element).attr("checked", false);
				/* 초기화를 안해주면 계속 배열에 값이 저장됨 */
				cart_arr_item = [];
			});
	
		}  else {
			// 전체 선택처리
			$("input[name=choice_Chk]").each(function(index, element) {
				$(element).attr("checked", true);
				cart_arr_item.push($(element).val());
			});
		} 
	
	if(confirm("상품을 구매하시겠습니까?")) {
		document.cart_form.action="${path}/cart_Order.co?cart_arr_item=" + cart_arr_item;
		document.cart_form.submit();
		}
	}
	
	/* 전체 삭제 */
	function cartDelete_All() {
		if(confirm("장바구니에 들어있는 상품을 전부 삭제하시겠습니까?")) {
			location.href="${path}/cartDeleteAction_All.ct";
		}
	}
	/* 삭제 버튼을 눌러서 개별 삭제 */
	function deletebtnItem(order_no) {
		location.href="${path}/cartDeleteAction.ct?order_no=" + order_no;
	}
	
</script>
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
                    <br>
                    <hr>
                     <c:if test="${customerID != null}">
                     <form action="${path}/order_Chk.co" method="post" name="cart_form" class="cart_form">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <div class="table_div">
                        	<div align="left" style="padding-left: 30px">
                        	</div>
                            <table style="width:100%" align="center" class="table table-striped table-hover">
                              <thead>
                                <tr><!-- 카트안에 들어온 제품들에 대해 체크  -->
                               		<th style="width:10%">상품선택</th>
                                    <th style="width:10%">상품번호</th>
                                    <th style="width:10%">상품명</th>
                                    <th style="width:30%">상품이미지</th>
                                    <th style="width:10%">상품가격</th>
                                    <th style="width:10%">상품수량</th>
                                    <th style="width:10%">삭제</th>
                                </tr>
                             </thead>
                                <!-- 장바구니 상품 출력  -->
                            
                                <c:forEach var="list" items="${cart}">
                                <td class="cart_info_id">
                             	    <!-- 갯수 및 가격 출력을 위한 hidden -->
                             	    <input type="hidden" name="orderNo"  value="${list.order_no}">
                             	    <input type="hidden" name="pdid" value="${list.order_id}">
	                                <input type="hidden" name="hiddenItem" id="hiddenItem" value="${list.order_no}">
	                                <input type="hidden" name="hiddenpdName" id="hiddenpdName" value="${list.order_name}">
	                                <input type="hidden" name="hiddenPrice" id="hiddenPrice" value="${list.order_price}">
	                                <input type="hidden" name="hiddenCount" id="hiddenCount" value="${list.order_count}">
	                                <input type="hidden" name="hiddenTotalPrice" id="hiddenTotalPrice" value="${list.order_count * list.order_price}">
                               		<input type="hidden" name="hiddenImg" id="hiddenImg" value="${list.order_img}">
                                </td>
                                <tr><!-- 카트안에 들어온 제품들 개별 체크 -->
                                	<td><input type="checkbox" class="choice_Chk" id="choice_Chk" name="choice_Chk" value="${list.order_no}">
                                    <td>${list.order_no}</td>
                                    <td>${list.order_name}</td>
                                    <td><img src="${list.order_img}" width="50px"></td>
                                    <td><fmt:formatNumber value="${list.order_price * list.order_count}" pattern="#,###" /></td>
                                    <td>${list.order_count}</td>
                                    <td>
                                    <input type="button" class="delete_btn" id="delete_btn" name="delete_btn" value="상품삭제" onclick="deletebtnItem('${list.order_no}');">
                                    </td>
                                </tr>
                                 </c:forEach>
                               
                            	 </table>
                            	 <br>
                            	 <br>
                            	 <br>
                            	 <br>
                            	 <hr>
                            	  <h2>주문 상품 정보</h2>
                            	 <span style="color: red;">*필수 입력사항</span>
                            <div class="area_box_info" style="width: 100%"> 
                            	 <div class="order_area_box" style="width: 70%">
                            	  <table border="1" style="width: 700px" class="table table-sm">
                            	 	<tr>
										<th style="width:20%">주문하시는분*</th>    
									    <td style="width:80%">
									  	  <input type="text" name="order_name" id="order_name" size="20" >
									  	</td>               	 	
                            	 	</tr>
                            	 	<tr>
                            	 		<th rowspan="5">주소*</th>
                            	 		<td><input type="text" class="zipcode1" name="zipcode1" id="zipcode1" size="10"><input type="button" value="우편번호"></td>
                            	 	</tr>
                            	 	<tr>
                            	 		<td><input type="text" class="addr1" id="addr1" name="addr1" size="50"> 기본주소 </td>
                            	 	</tr>
                          			<tr>
                          				<td><input type="text" class="addr2" id="addr2" name="addr2" size="50"> 나머지 주소 </td>
                          			</tr>
                            	 
                            	 	<tr></tr>
                            	 	<tr></tr>
                            	 		
                            	 	<tr>
                            	 		<th>휴대전화</th>
                            	 		<td>
	                            	 		<select id="phone1" class="phone1" name="phone1">
	                            	 				<option value="010"> 010 </option>
	                            	 				<option value="011">011</option>
	                            	 				<option value="070">070</option>
	                            	 				<option value="080">080</option>
	                            	 			</select>
                            	 			-
                            	 			<input type="text" id="phone2" name="phone2" class="phone2" size="10">
                            	 			-
                            	 			<input type="text" id="phone3" name="phone3" class="phone3" size="10">
                            			</td>
                            	 	</tr>
                            	 	
                            	 	<tr>
                            	 		<th>이메일</th>
                            	 			<td>
                            	 				<input type="text" class="input" name="email1" maxlength="20" style="width:100px">
												@
												<input type="text" class="input" name="email2" maxlength="20" style="width:100px">
												<select class="input" name="email3" style="width:100px">
													<option value="0">직접입력</option>
													<option value="naver.com">네이버</option>
													<option value="daum.net">다음</option>
													<option value="gmail.com">구글</option>
													<option value="nate.com">네이트</option>
												</select>
											</td>
                            	 		</tr>
                            	 	</table>
                            	 </div>
                            	 <div class="area_price_info" id="area_price_info">
	                        	 	 <table border="1px">
	                        	 	 	<tr>
	                        	 	 		<td> 상품수량</td>
	                        	 	 		<td style="width: 100px"><span class="totalCount_span" ></span></td>
	                        	 	 	</tr>
	                            		<tr>
	                            			<td> 총 가격</td>
	                            			<td style="width: 100px"><span class="countPrice_span" ></span></td>
	                            		</tr>
                           			</table>
                            	</div>
                           	</div>   
	                       	   	<div class="button_box" align="center" style="padding-top: 30px;" >
	                               	<input type="button" name="btnConfirm" value="구매 진행" onclick="purchase_Item();">
	                               	<input type="button" name="btnDelete" value="전체 상품 삭제" onclick="cartDelete_All();">
                                </div>
                               
            			</div>
            		</form>
               </c:if>
        </div>
	</div>
    <!-- main end -->
    <!-- footer start -->
  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- footer end -->
  
</body>
</html>
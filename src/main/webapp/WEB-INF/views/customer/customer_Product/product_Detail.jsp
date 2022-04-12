<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>  
<%@ page import = "java.sql.Date" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 - 게시판 상세페이지</title>

<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/customer_CSS/login.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">

<!-- 인증 -->
<script src="https://kit.fontawesome.com/f07d2e0c9f.js" crossorigin="anonymous" ></script>    
<script>
   $(function(){
      $("#buy_now").click(function(){ /* 등록버튼 클릭시 작동, 주의사항 : input 타입이 submit이면 작동이 이상해진다. button으로 해둬야함 */
    	//컨트롤러로 보냄
  		if(confirm("고르신 상품을 구매하시겠습니까?")) {
  			document.form1.action="${path}/buynow.ct";
  			document.form1.submit();	
  		} 
      });
   });
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <!-- header 끝 -->
   <c:if test="${customerID == null }">
   	<script>
		alert("로그인 후 이용하실 수 있습니다.");
		window.history.back();
   	</script>
   </c:if>
   
   <c:if test="${customerID != null }">
   <!-- 컨텐츠 시작 -->
   <div id="container">
      <div id="contents">
      <!-- section1 시작 -->      
         <div id="section1">
            <h1 align="center"> 상세페이지 </h1>
            <!-- 상세페이지 꾸미기 -->
         </div>
         <!-- section2 시작 -->      
         <div id="section2">
            <!-- 우측 내용 시작 -->
            <div id="right">
               <div class="table_div">
               	 	<form action="${path}/cartAddAction.ct" method="post" name=form1>
               	 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
               	 		<input type="hidden" name="hiddenpdNo" value="${dto.no}">
                  		<input type="hidden" name="hiddenpdImg" value="${dto.img}">
                	  	<input type="hidden" name="pageNum" value="${pageNum}">
                	  	<input type="hidden" name="hiddenName" value="${dto.name}">
                	  	<input type="hidden" name="hiddenPrice" value="${dto.price}">
                 			<table style="width: 100%; padding: 10px 0; border-collapse: collapse;"  >
                		
                			<tr>
                				<td><img src="${dto.img}" width=500px></td>
                			</tr>
							<tr>
								<td>${dto.name}</td>
							</tr>                 			
							<tr>
								<td>브랜드 :	${dto.brand}</td>
							</tr>
							<tr>
								<td>상세설명 : ${dto.content}</td>
								
							</tr>
							<tr>
								<td>가격 :  ${dto.price}</td>
							</tr>
							<tr>
								<td>수량 : <input type="text" id="count" name="count"></td>
							</tr>
							<tr>
                             <td>
                             <input type="submit" class="inputButton" value="장바구니 넣기" id="cart_in">
                             <input type="button" class="inputButton" value="바로구매" id="buy_now" >	
                             </td>
                            </tr>
                      	</table>        
                	  </form>
                	</div>
            	</div>  
            </div>
          
            <!-- 우측 내용 끝 -->
         </div> <!-- section2 -->
         
     	</div>
      </c:if>
     
   <!-- 컨텐츠 끝 -->
   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->
   
</body>
</html>
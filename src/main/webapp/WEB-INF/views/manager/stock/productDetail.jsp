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
<script src="https://kit.fontawesome.com/f07d2e0c9f.js" crossorigin="anonymous"></script>

<!-- 3-3. 자바스크립트 추가 : 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html이 브라우저창에 표시가 안되는 것을 방지 -->
<%-- <script src="${path}/resources/js/customerJS/main.js" defer></script> --%>

<!-- <script>
   $(function(){
      $("#btnSave").click(function(){ /* 등록버튼 클릭시 작동, 주의사항 : input 타입이 submit이면 작동이 이상해진다. button으로 해둬야함 */
         
         document.boardInsert.submit(); /* action에서 지정한 페이지로 이동 */
      });
   });
</script> -->
</head>
<body>
<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <!-- header 끝 -->
   
   <!-- 컨텐츠 시작 -->
   <div id="container">
      <div id="contents">
      <!-- section1 시작 -->      
         <div id="section1">
            <h1 align="center"> 상세페이지 </h1>
         </div>
         
         <!-- section2 시작 -->      
         <div id="section2">
            <!-- 좌측 메뉴바 시작 -->
            <div id="left">
               <div class="left_inside">
                  <!-- 좌측 메뉴바 -->
               </div>
            </div>
            <!-- 우측 내용 시작 -->
            <div id="right">
               <div class="table_div">
                  <form  action="${path}/productUpdateAction.st?${_csrf.parameterName}=${_csrf.token}" method="post" name="form1" enctype="multipart/form-data">
                     <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}">
                     <table style="width:1000px; align=center;">
                     
                     	<input type="hidden" name="hiddenpdNo" value="${dto.no}">
                     	<input type="hidden" name="hiddenpdImg" value="${dto.img}">
                     	<input type="hidden" name="pageNum" value="${pageNum}">
                        <tr>
                           <th style ="width:150px">제품번호</th>
                           <td>${dto.no}</td>
                           
                           <th style ="width:150px">제품명*</th>
                           <td><input type="text" name="name" id="name" value="${dto.name}" size="20" placeholder="제품명" required></td>
                        </tr>
                        <tr>
                        <th style ="width:150px">브랜드*</th>
                       		<td><input type="text" name="brand" id="brand" value="${dto.brand}" size="20" placeholder="브랜드명" required></td>
                        <th style ="width:150px">이미지*</th>
                        	
                       		<td><input type="file" name="Img" id="Img" size="20" placeholder="이미지" accept="image/*"><img src="${dto.img}" width="100px"></td>
                        </tr>
                        <tr>
                           <th style ="width:150px">카테고리</th>
                           <td colspan="3">
                           	<div>
                           		<select id="category" name="category" required>
                           			<option>제품구분</option>
                           			<option <c:if test="${dto.category == 'Outer'}"> selected </c:if> value="Outer">Outer</option>
                           			<option <c:if test="${dto.category == 'Shirt'}"> selected </c:if> value="Shirt">Shirt</option>
                           			<option <c:if test="${dto.category == 'Pants'}"> selected </c:if> value="Pants">Pants</option>
                           			<option <c:if test="${dto.category == 'Shoes'}"> selected </c:if> value="Shoes">Shoes</option>
                           			<option <c:if test="${dto.category == 'TOP'}"> selected </c:if> value="TOP">TOP</option>
                           			<option <c:if test="${dto.category == 'Suit'}"> selected </c:if> value="Suit">Suit</option>
                           		</select>
                           	</div>
                           </td>
                        </tr>
                        <tr>
                           <th style ="width:150px">제품설명</th>
                       	<td><textarea rows="5" cols="50" name="content" id="content" >${dto.content}</textarea></td>
                        </tr>
                        
                        <tr>
                           <th style ="width:150px">판매가격</th>
	                       <td>
	                       		<input type="number" name="price" id="price" value="${dto.price}" size="20" placeholder="price" required>
	                       </td>
                           <th style ="width:150px">제품수량</th>
	                       <td>
	                      	 	<input type="number" name="count" id="count" value="${dto.count}" size="20" placeholder="count" required>
	                       </td>
                        </tr>
                        
                        <tr>
                           <th style ="width:150px">판매상태</th>
                           <td colspan="3">
                           	<div>
                           		<select id="status" name="status" required>
                           			<option>제품구분</option>
                           			<option <c:if test="${dto.status == '판매중'}"> selected </c:if> value="판매중">판매중</option>
                           			<option <c:if test="${dto.status == '품절'}"> selected </c:if> value="품절">품절</option>
                           			<option <c:if test="${dto.status == '입고중'}"> selected </c:if> value="입고중">입고중</option>
                           		</select>
                           	</div>
                           </td>
                        
                        </tr>
                        <tr>
                        	<td colspan="3">
                           		<input type="text" name="indate" id="indate" value="${dto.indate}"> 
                           </td>
                        </tr>
                        
                        <tr>
                           <th colspan="4">
                              <input type="submit" class="inputButton" value="수정" id="btnEdit">
                              <input type="button" class="inputButton" value="취소" onclick="window.history.back();">
                           </th>
                        </tr>
                     </table>
                     
                  </form>
            </div>
            <!-- 우측 내용 끝 -->
         </div> <!-- section2 -->
         
      </div>
   </div>
   </div>
   <!-- 컨텐츠 끝 -->
</div>

   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->
   
</body>
</html>
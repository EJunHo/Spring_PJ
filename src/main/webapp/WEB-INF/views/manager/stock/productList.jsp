<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>

<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/customer_CSS/login.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">

<!-- 인증 -->
<script src="https://kit.fontawesome.com/f07d2e0c9f.js" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 3-3. 자바스크립트 추가 : 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html이 브라우저창에 표시가 안되는 것을 방지 -->
<!-- <script>
$(function(){
	$("#btnDelete").click(function() {
		//컨트롤러로 보냄
		if(confirm("삭제하시겠습니까?")) {
			document.form1.action="${path}/productDeleteAction.st";
			document.form1.submit();	
		} 
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
            <h1 align="center"> 재고목록 </h1>
         </div>
         <!-- section2 시작 -->      
         <div id="section2">
            <!-- 좌측 메뉴바 시작 -->
            <div id="left">
               <div id="left_inside">
                  <!-- 좌측 메뉴 -->
                     <%@ include file="/WEB-INF/views/common/leftmenu.jsp" %>
                  <!-- 좌측 메뉴바 -->
               </div>
            </div>
            <!-- 우측 내용 시작 -->
            <div id="right">
               <div class="table_div">
               <form method="post" name="form1">
                 <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}">
                  <table style="width:1000px" align="center" class="table table-hover">
                     <thead>
                     <tr>
                        <th style="width:5%" id="no" scope="col">상품번호</th>
                        <th style="width:5%"id="brand" scope="col">브랜드</th>
                        <th style="width:10%"id="name" scope="col">제품명</th>
                        <th style="width:10%"id="Img" scope="col">제품이미지</th>
                        <th style="width:10%"id="category" scope="col">카테고리</th>
                        <th style="width:10%"id="content" scope="col">제품설명</th>
                        <th style="width:10%"id="price" scope="col">판매가격</th>
                        <th style="width:10%"id="count" scope="col">재고수량</th>
                        <th style="width:10%"id="status" scope="col">판매상태</th>
                        <th style="width:10%" scope="col">등록일</th>
                        <th style="width:5%"id="pdUpdate" scope="col">수정</th>
                        <th style="width:5%"id="pdDelete" scope="col">삭제</th>
                     </tr>
                     </thead>
                     <!-- 게시글이 있으면 -->
                   	<c:forEach var="dto" items="${list}">
                     <tr>
                         <td>${dto.no}</td>
                         <td>${dto.brand}</td>
                         <td>${dto.name}</td>
                         <td><img src = "${dto.img}" width="50px"></td>
                       <%--   배포디렉터리 : <%=application.getRealPath("/images/") %> --%>
                         <td>${dto.category}</td>
                         <td>${dto.content}</td>
                         <td>${dto.price}</td>
                         <td>${dto.count}</td>
                         <td>${dto.status}</td>
                         <td>${dto.indate}</td>
                         <!-- 온클릭시 제품 디테일로 넘어가고 그때 정확한 제품을 가져가기 위해 제품의 번호와 페이지넘버를 가져간다. -->
                         <td><input type="button" value="수정" onclick = "window.location='productDetail.st?no=${dto.no}&pageNum=${paging.pageNum}'"></td>
                         <td><input type="button" id="btnDelete" name="btnDelete" value="삭제" onclick = "window.location='productDeleteAction.st?no=${dto.no}&pageNum=${paging.pageNum}'"></td>
                    		
                     </tr>
                   	 </c:forEach>
  					<tr>
                   		<td colspan="11" align="center">
                        <!-- 페이징 처리 -->
                        <!-- 이전 버튼 활성화 여부 -->
                        <c:if test="${paging.startPage > 10}">
                           <a href="${path}/productList.st?pageNum=${paging.prev}" style="color: black">[이전]</a>
                        </c:if> 
                        
                        <!-- 페이지번호 처리 -->
                        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                           <a href="${path}/productList.st?pageNum=${num}"  style="color: black">${num}</a>
                        </c:forEach>
                        
                        <!-- 다음 버튼 활성화 여부 -->
                        <c:if test="${paging.endPage < paging.pageCount}">
                           <a href="${path}/productList.st?pageNum=${paging.next}"  style="color: black">[다음]</a>
                        </c:if>
                     </td>
                  </tr>   
                  </table>
                 </form>
               </div>            
            </div>
         </div> <!-- section2 -->
         
      </div>
   </div>
   <!-- 컨텐츠 끝 -->
   
</div>

   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->
   
   
</body>
</html>

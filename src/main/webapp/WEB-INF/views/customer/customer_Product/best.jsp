<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>best</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/product.css">

</head>
<body>
    <!-- header start -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    
    <!-- header end -->
    <!-- section 1 start -->
    <div class="section1">
        <div class="imgbox">
        	<div id="pd_list">
        		<c:forEach var="d" items="${list}" >
        			<div class="item_photo_box">
        			<a href="${path}/product_Detail.st?no=${d.no}&pageNum=${paging.pageNum}">
        				<img src="${d.img}" width="150px">
        			</a>
        				<ul>
							<li>${d.name}</li>
							<li>${d.price}</li>
						</ul>
					</div>
        		</c:forEach>
        		</div>
        		<div class="paging" align="center" >
                        <!-- 페이징 처리 -->
                        <!-- 이전 버튼 활성화 여부 -->
                        <c:if test="${paging.startPage > 10}">
                           <a href="${path}/best.st?pageNum=${paging.prev}" style="color: black">[이전]</a>
                        </c:if> 
                        
                        <!-- 페이지번호 처리 -->
                        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                           <a href="${path}/best.st?pageNum=${num}"  style="color: black">${num}</a>
                        </c:forEach>
                        
                        <!-- 다음 버튼 활성화 여부 -->
                        <c:if test="${paging.endPage < paging.pageCount}">
                           <a href="${path}/best.st?pageNum=${paging.next}"  style="color: black">[다음]</a>
                        </c:if>
                </div>
        	</div>	
        </div>
    <!-- section 2 end -->
    <!-- footer start -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- footer end -->
  
</body>
</html>
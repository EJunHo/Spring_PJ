<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Commnunity</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/side.CSS">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/search.CSS">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
 	<!-- header start -->
  
 	<%@ include file="/WEB-INF/views/common/header.jsp" %>
  
    <!-- header end -->
    
    <!-- main start -->
    
    <div id="container">
		<div id="contents">
			<!-- section1 시작 -->
			<div id="section1">
				<h1 align="left"> 공지사항 </h1>
					<hr>
			</div>	

			<!-- section2 시작 -->
			<div id="section2">
	
			<!-- 우측 내용 시작 -->
				<div id="right">
                    
                    <div class="select">
                        <fieldset class="search_field">
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
				
						<table style="width: 1000px" align="center">
                                <tr>
                                    <th style="width:5%">번호</th>
                                    <th style="width:5%">작성자</th>
                                    <th style="width:30%">제목</th>
                                    <th style="width:20%">날짜</th>
                                    <th style="width:12%">조회수</th>
                                </tr>
		                        <c:forEach var="c" items="${list}">
						        <tr>
		                        <td>${c.num}</td>
		                        <td>${c.writer}</td>
		                        <td>
		                        	<a href="${path}/commnunity_Detail.bo?num=${c.num}" style="color:black">${c.title}</a>
		                         	<c:if test="${c.comment_count > 0}">
		                         		[${c.comment_count}]
		                         	</c:if>
		                         </td>
		                         <td>${c.indate}</td>
		                         <td>${c.redCnt}</td>
		                     	 </tr>         
                                </c:forEach>
						</table>
					</div>
				
				    <!-- 페이징 처리 -->
                      <!-- 이전 버튼 활성화 여부 -->
                      <c:if test="${paging.startPage > 10}">
                         <a href="${path}/member_commnu.bo?pageNum=${paging.prev}" style="color: black">[이전]</a>
                      </c:if> 
                      
                      <!-- 페이지번호 처리 -->
                      <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                         <a href="${path}/member_commnu.bo?pageNum=${num}"  style="color: black">${num}</a>
                      </c:forEach>
                      
                      <!-- 다음 버튼 활성화 여부 -->
                      <c:if test="${paging.endPage < paging.pageCount}">
                         <a href="${path}/member_commnu.bo?pageNum=${paging.next}"  style="color: black">[다음]</a>
                      </c:if>
				</div>	
			</div>			
		</div>
	</div>
	<!-- main end -->
    <!-- footer start -->
   
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   
    <!-- fotter end -->
   
</body>
</html>
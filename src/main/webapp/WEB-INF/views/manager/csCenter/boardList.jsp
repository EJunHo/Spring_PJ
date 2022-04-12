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
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">

<!-- 인증 -->
<script src="https://kit.fontawesome.com/f07d2e0c9f.js" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- 3-3. 자바스크립트 추가 : 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때까지 html이 브라우저창에 표시가 안되는 것을 방지 -->
<!-- <script>
	$(function() { //페이지가 로딩이 되면
		$("#btnInsert").click(function() {
			location.href="${path}/manager/csCenter/board_Insert.jsp";
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
            <h1 align="center"> 게시판 </h1>
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
               	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
                  <table style="width:1000px" align="center"class="table table-hover">
                     <tr>
                        <th style="width:10%">번호</th>
                        <th style="width:10%">작성자</th>
                        <th style="width:10%">제목</th>
                        <th style="width:10%">날짜</th>
                        <th style="width:10%">조회수</th>
                     </tr>
                     <!-- 게시글이 있으면 -->
                     <!-- daoimpl에서 가지고온 setAttribute list값을 꺼내서 출력 -->
                     <c:forEach var="dto" items="${list}">
                     <tr>
                         <td>${dto.num}</td>
                         <td>${dto.writer}</td>
                         <td>
                         	<a href="${path}/board_DetailAction.bo?num=${dto.num}" style="color:black">${dto.title}</a>
                         	<!--  -->
                         	<c:if test="${dto.comment_count > 0}">
                         		[${dto.comment_count}]
                         	</c:if>
                         </td>
                         <td>${dto.indate}</td>
                         <td>${dto.redCnt}</td>
                     </tr>
                    </c:forEach>
                  
                  <tr>
                     <td colspan="4" align="center">
                        <!-- 페이징 처리 -->
                        <!-- 이전 버튼 활성화 여부 -->
                        <c:if test="${paging.startPage > 10}">
                           <a href="${path}/boardList.bo?pageNum=${paging.prev}" style="color: black">[이전]</a>
                        </c:if> 
                        
                        <!-- 페이지번호 처리 -->
                        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                           <a href="${path}/boardList.bo?pageNum=${num}"  style="color: black">${num}</a>
                        </c:forEach>
                        
                        <!-- 다음 버튼 활성화 여부 -->
                        <c:if test="${paging.endPage < paging.pageCount}">
                           <a href="${path}/boardList.bo?pageNum=${paging.next}"  style="color: black">[다음]</a>
                        </c:if>
                     </td>
         
                     <td align="right">
                        <input type="button" id="btnInsert" value="글쓰기" onclick="window.location='${path}/board_Insert.bo'">
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

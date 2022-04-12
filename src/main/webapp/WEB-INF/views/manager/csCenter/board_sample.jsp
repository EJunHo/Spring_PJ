<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">
<title>Insert title here</title>
</head>
<body>
	<!-- header start -->
    	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header end -->
    <!-- main start -->
   <!-- 컨텐츠 시작 -->
   <div id="container">
      <div id="contents">
     	 <div id="section1">
				<h1 align="left"> 상품목록 </h1>
					<hr>
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
                  <table style="width:1000px" align="center">
                     <tr>
                        <th style="width:10%">번호</th>
                        <th style="width:10%">작성자</th>
                        <th style="width:10%">제목</th>
                        <th style="width:10%">날짜</th>
                        <th style="width:10%">조회수</th>
                     </tr>
                     <!-- 게시글이 있으면 -->
                     <!-- daoimpl에서 가지고온 setAttribute list값을 꺼내서 출력 -->
                
                    <tr>
                    	<td colspan="2" style="text-align:right; border-bottom:none">
                    		<!-- <input type="button" id="btnWrite" value="글쓰기" onclick="boardInsert.do"> -->
                    		<input type="button" id="btnInsert" value="글쓰기">
                    </tr>
                  </table>
               </div>            
            </div>
         </div> <!-- section2 -->
         
      </div>
   </div>
    
    <!-- main end -->
    <!-- footer start -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- footer end -->
</body>
</html>
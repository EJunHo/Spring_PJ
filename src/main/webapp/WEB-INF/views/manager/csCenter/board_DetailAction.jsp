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
<script> 

$(function(){ //page가 로드되면
	comment_list();
   //댓글 쓰기 버튼 
   $("#btnSave").click(function() {
	   comment_add();
   });
   
   //목록으로 이동
   $("#btnList").click(function(){
      location.href="${path}/boardList.bo"
   });
   
   //수정삭제화면으로 이동
   $("#btnEdit").click(function() {
    document.form1.action="${path}/passwordCHk.bo"
    document.form1.submit();
    
   });
});

//댓글 쓰기
function comment_add() {
   //게시글번호, 작성자, 글내용을 파라미터로 넘김
   var param = {
      "board_num" : ${dto.num},
      "writer" : $('#writer').val(),
      "console" : $('#console').val()
   }
   $.ajax({
	   type : "post",
   	   url : "${path}/commentAdd.bo${_csrf.parameterName}=${_csrf.token}",	
   	   data : param , 
   	   success : function() {
	   		$('#writer').val("");
			$('#console').val("");
   			comment_list();
   	   }
   });
}

//댓글 목록
function comment_list() {
	$.ajax({
		type : "post",
		url : "${path}/commentList.bo?${_csrf.parameterName}=${_csrf.token}",
		data : "num=${dto.num}",
		success : function(result) {
				$('#commentList').html(result);
		} 
	});
}

</script>

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
                     <%@ include file="/WEB-INF/views/common/leftmenu.jsp" %>
                  <!-- 좌측 메뉴바 -->
               </div>
         
            </div>
            <!-- 우측 내용 시작 -->
            <div id="right">
               <div class="table_div">
                  <%-- <form action="${path}/board_insertAction.bo" method="post" name="boardInsert"> --%>
                  <form  method="post" name="form1">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                     <table align=center">
                        <tr>
                           <th style ="width:150px">작성일</th>
                           <td style ="width:150px; text-align:center;" >
                           <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${dto.indate}" />
                             <th >조회수</th>
                           <td style ="width:150px; text-align:center;">${dto.redCnt}</td>
                             
                        </tr>
                        <tr>
                        <th style ="width:150px">작성자</th>
                           <td style ="width:150px; text-align:center;">${dto.writer}</td>
                           
                           <th style ="width:150px">비밀번호</th>
                           <td>
                                 <input type="password" class="input" name="password" id="password" value="${dto.password}" size ="20" placeholder="비밀번호 입력" required>
                                 <c:if test="${param.message == 'error'}">
                                    <span style="color:red;">비밀번호가 일치하지 않습니다.</span>
                                 </c:if>
                           </td>
                        </tr>
                     
                        <tr>
                           <th>글제목</th>
                           <td colspan="3" style="text-align:left;">${dto.title}</td>
                        </tr>
                        <tr>
                           <th>글내용</th>
                           <td colspan="3" style="text-align:left;">
                           <textarea rows="5" cols="60" name="content" id="content">${dto.content}</textarea>
                           </td>
                        </tr>
                        <tr>
                           <th colspan="4">
                              <input type="hidden" name="num" value="${dto.num}">
                              <input type="button" class="btn btn-secondary"  value="수정/삭제" id="btnEdit">
                              <!-- 제이쿼리로 사용할 경우 type="button" => click으로 동작시키기 위해서 -->
                              
                           <!--    <input type="button" class="inputButton" value="수정" id="btnUpdate">
                              <input type="button" class="inputButton" value="삭제" id="btnDelete"> -->
                              <input type="button" class="btn btn-secondary" " value="목록" id="btnList">
                           </th>
                        </tr>
                     </table>
                     
                  </form>
                  
               <!-- 댓글 입력 코드 -->
                  <h3>댓글</h3>
                  
                  <table width="700px" border="1">
                     <tr>
                        <th style="width:100px">이름</th>
                        <td style="width:200px" colspan="2">
                           <input id="writer" placeholder="이름">
                        </td>   
                        <td style="width:30px" rowspan="2" align="right"><button id="btnSave" type="button" class="btn btn-secondary" >확인</button></td>                  
                     </tr>
                     <tr>
                        <th style="width:100px">내용</th>
                        <td  style="width:170px"><textarea rows="5" cols="60" id="console" placeholder="내용을 입력하세요."></textarea></td>
                     </tr>
                  </table>
                  <br><br>
                  
                  <!-- 댓글 목록을 출력할 영역 -->
                  <div id="commentList">
                      <h3>댓글 목록을 출력할 영역</h3>
                  </div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content ="width=device-width, initial-scale=1"> 
<title>회원가입</title>

<!-- CSS -->
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/customer_CSS/join.css">

<!-- fontawesome  -->
<script src="https://kit.fontawesome.com/42c47b0b4d.js" crossorigin="anonymous"></script>

<!-- 3-3. 자바스크립트 이벤트 추가: 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJS/join.js" defer></script>
<script src="${path}/resources/js/customerJS/errMsg.js" defer></script>
</head>
<body>

	<div class="wrap"><!-- 묶음1 -->
	<!-- header 시작 -->
	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<!-- header 끝 -->
	
	<!-- 회원가입 컨텐츠 시작 -->
	<!-- 템플릿 만들기 -->
	<div id="container">
		<div id="contents">
		 <!-- 상단 중앙 시작 -->
		 <div id="section1">
		 	<h2 align="center" style="padding: 10px 20px 0; border-bottom: 5px solid #B1AEB7"> 정보 수정 </h2>
		</div>
		<div id="section2">
	 		<div id="se_inner">
	 		<div class="join">
				<form name="modifyform" action="${path}/modifyCustomerAction.do" method="post" >
				<input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}">
					
					<table>
						<colgroup>
						<col style="width: 150px;">
						<col style="width: auto;">
						<col style="width: auto;">
						</colgroup>
						<tr>
							<th> * 아이디 </th>
							<td>
								${dto.getId()}
							</td>
						</tr>
						
						<tr>
							<th> * 비밀번호 </th>
							<%-- <td colspan="2"><input type="password" class="input" name="password" size="15" value="${dto.getPassword()}" placeholder="공백없이 15자 이내로 작성" > --%>
							<td colspan="2"><input type="password" class="input" name="password" size="15" value="${dto.getPassword()}" placeholder="공백없이 15자 이내로 작성" disabled="disabled"></td>
							
						</tr>
						
						<tr>
							<th> * 비밀번호(확인) </th>
							<%-- <td colspan="2"><input type="password" class="input" name="repassword" size="15" value="${dto.getPassword()}" placeholder="공백없이 15자 이내로 작성"> --%>
							<td colspan="2"><input type="password" class="input" name="repassword" size="15" value="${dto.getPassword()}" placeholder="공백없이 15자 이내로 작성" ></td>
						</tr>
						
						<tr>
                          		<th>* 이름</th>
                          		<td colspan="2"><input type="text" class="input" name="name" value="${dto.getName()}" size="15"></td>
                       	</tr>
                       	
                       	<tr>
                          		<th>* 생년월일</th>
                          		<td colspan="2"><input type="date" class="input" name="birthday" value="${dto.getBirthday()}" size="30"></td>
                       	</tr>
                       	
                       	<tr>
                          		<th>* 주소</th>
                          		<td colspan="2"><input type="text" class="input" name="address" value="${dto.getAddress()}"size="60"></td>
                       	</tr>
                     
                       	<c:if test="${dto.getHp() == null}">
                       	<tr>
                          	<th> 핸드폰</th>
	                      		<td>
	                       		<input type="text" class="input" name="hp1" style="width:50px">
								-
								<input type="text" class="input" name="hp2" style="width:70px">
								-
								<input type="text" class="input" name="hp3" style="width:70px">
								</td>
                       	</tr>
                        </c:if>
                        <c:if test="${dto.getHp() != null }">
                       		
               			<c:set var="hpArr" value="${fn:split(dto.getHp(),'-')}" />
               		 	 <tr>
                          	<th> 핸드폰</th>
                          	<td>
                          	<input type="text" class="input" name="hp1" value="${hpArr[0]}" style="width:50px">
							-
							<input type="text" class="input" name="hp2" value="${hpArr[1]}" style="width:70px">
							-
							<input type="text" class="input" name="hp3" value="${hpArr[2]}" style="width:70px">
							</td>
                       	</tr>
                       	</c:if>
	                    <c:set var="emailChk" value="${fn:split(dto.getEmail(),'@')}" />
                    	<tr>
                           <th>이메일</th>
                           <td>
                           <input type="text" class="input" name="email1" value="${emailChk[0]}" style="width:100px">
							@
							<input type="text" class="input" name="email2" value="${emailChk[1]}" style="width:100px">
							<select class="input" name = "email3" style="width: 100px" onchange="modifyEmailChk()">
								<option value="0">직접입력</option>
								<option value="naver.com">네이버</option>
								<option value="gmail.com">구글</option>
								<option value="daum.net">다음</option>
								<option value="nate.com">네이트</option>
							</select>
							</td>
                       	</tr>
                       	<tr>
                       		<td colspan="3" style="border-bottom: none">
                       		<br>
                        		<div align="right">
   	                    			<input type="submit" value="회원수정">
       	                			<input type="reset" value="초기화">
           	            			<input type="button" class="button" value="수정취소" onclick="window.history.back()">
               	        		</div>
   							</td>                    	
                        </tr>
					</table>
                  <%--   <c:if test="${selectCnt != 1}" >
						<script type="text/javascript">
							errorAlert(passwordError);
						</script>
			 		</c:if>  --%>
				</form>		 
	 		</div>
	 	</div>
	</div>
	
	<!-- 회원가입 컨텐츠 끝 -->
	</div><!-- 묶음1 -->
	</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝  -->
	
</body>
</html>
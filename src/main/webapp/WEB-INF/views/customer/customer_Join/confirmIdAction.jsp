<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복확인</title>
<script src="${path}/resources/js/customerJS/join.js" defer></script>
</head>
<body onload="confirmIdFocus()">
	<h2> 중복확인 페이지</h2>
	<form action="${path}/confirmIdAction.do" method="post" name="confirmform" onsubmit="return confirmIdChk()">
		<c:if test="${selectCnt == 1}">
			<table>
			<tr>
				<th colspan="2">
					<span>${id}</span>는 사용할 수 없습니다.
				</th>
			</tr>
			
			<tr>
				<th> 아이디 </th>
				<td><input class="input" type="text" name="id" maxlength="20" style="width:150px" autofocus required></td>
			</tr>
			
			<tr>
				<th colspan="2">
				<input class="inputbutton" type="submit" value="확인">
				<input class="inputbutton" type="reset" value="취소" onclick="self.close();">
			</tr>
			</table>
		</c:if>
		<c:if test="${selectCnt != 1}">
			<table>
				<tr>
					<td align="center">
						<span>${id}</span>는 사용할 수 있습니다.
					</td>
				</tr>
				
				<tr>
					<th>
						<input class="input" type="button" value="확인" onclick="setId('${id}');">
					</th>
				</tr>
			</table>
		</c:if>
	</form>
	
</body>
</html>
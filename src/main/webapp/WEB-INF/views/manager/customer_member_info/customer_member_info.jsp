<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>게시판</title>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/search.CSS">

</head>
<body>
    <!-- header start -->
  	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header end -->
    <div id="container">
		<div id="contents">
			<!-- section1 시작 -->
			<div id="section1">
				<h1 align="left"> 고객게시판 </h1>
					<hr>
			</div>	
			<!-- section2 시작 -->
			<div id="section2">
				<!-- 좌측 내용 시작 -->
				<div id="left">
					<div class="left_inside">
						<!-- 좌측메뉴 start-->
							<%@ include file="/WEB-INF/views/common/leftmenu.jsp" %>
						<!-- 좌측메뉴 end-->	
					</div>
				</div>
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
					<!-- 메뉴리스트 -->
					
						<table style="width: 1000px" align="center">
							<tr>
								<th style="width:5%">고객번호</th>
								<th style="width:5%">아이디</th>
								<th style="width:5%">우편번호</th>
								<th style="width:15%">주소</th>
								<th style="width:12%">전화번호(일반)</th>
								<th style="width:13%">전화번호(H.P)</th>
								<th style="width:5%">회원등급</th>
								<th style="width:10%">이메일수신여부</th>
								<th style="width:10%">생년월일</th>
								
							</tr>
						
							<tr>
								<td>1001</td>
								<td>hong</td>
								<td>74564</td>
								<td>부천시 원미구 심곡동</td>
								<td>02-5455-8732</td>
								<td>010-3344-2256</td>
								<td>silver</td>
								<td>수신</td>
								<td>1998-05-03</td>
							
							</tr>
							<!--상의 겨울  -->
							<tr>
								<td>1002</td>
								<td>kim</td>
								<td>23211</td>
								<td>부천시 원미구 도당동</td>
								<td>02-5455-2244</td>
								<td>010-7799-4532</td>
								<td>gold</td>
								<td>수신</td>
								<td>1998-05-03</td>
							
							</tr>
							<!-- 상의 여름 -->
							<tr>
								<td>1003</td>
								<td>kim</td>
								<td>53445</td>
								<td>부천시 원미구 역곡동</td>
								<td>02-6423-2244</td>
								<td>010-5785-3462</td>
								<td>gold</td>
								<td>수신거부</td>
								<td>2001-03-03</td>
							
							</tr>
								<!-- 슈즈 -->
								<tr>
									<td>1004</td>
									<td>jung</td>
									<td>57642</td>
									<td>부천시 원미구 중동</td>
									<td>02-5455-7676</td>
									<td>010-3535-2222</td>
									<td>silver</td>
									<td>수신거부</td>
									<td>2005-12-03</td>
								
								</tr>
								<!-- 팬츠데님  -->
								<tr>
									<td>1005</td>
									<td>park</td>
									<td>12354</td>
									<td>부천시 원미구 소사동</td>
									<td>02-5543-2233</td>
									<td>010-4322-1154</td>
									<td>silver</td>
									<td>수신</td>
									<td>2004-04-07</td>
								
								</tr>
									<!-- 팬츠면  -->
									<tr>
										<td>1006</td>
										<td>lee</td>
										<td>32452</td>
										<td>부천시 원미구 상동</td>
										<td>02-5455-2244</td>
										<td>010-3333-2222</td>
										<td>gold</td>
										<td>수신거부</td>
										<td>1988-06-21</td>
									
									</tr>
							
						</table>
					</div>
						<!-- board page start -->
						<div class="page">
							<ul class="page-num">
								<li><a href="#"></a><<</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">>></a></li>
							</ul>
						</div>
						<!-- board page end -->
				</div>	
			</div>			
		</div>
	</div>
	<!-- main end -->
    <!-- footer start -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
     <!-- footer end -->
</body>
</html>
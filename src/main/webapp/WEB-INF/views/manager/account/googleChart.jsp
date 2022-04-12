<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${path}/resources/css/common_CSS/ex.css">
<link rel="stylesheet" href="${path}/resources/css/manager_CSS/categoryTable.css">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/search.CSS">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script src="${path}/resources/js/customerJS/join.js" defer></script>	
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
     
    google.charts.load('current', {'packages':['corechart'] }  );
    
    google.charts.setOnLoadCallback(drawChart);
  

      function drawChart() {

        var data = google.visualization.arrayToDataTable(
        	${list}	
        );

        var options = {
          title: '일별 판매 수익'
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

        chart.draw(data, options);
      }
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['bar']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = google.visualization.arrayToDataTable(
    	${category}
   );

    var options = {
      chart: {
        title: '제품별 판매 수량'
        
      }
    };

    var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
  
  }
  </script>
    <!-- header start -->
   	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- header end -->
    <div id="container">
		<div id="contents">
			<!-- section1 시작 -->
			<div id="section1">
				<h1 align="left"> 제무결산 </h1>
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
                    <!-- date button start-->
                    <div class="select">
                    <form name="form1" method="post" >
                    	 <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"> 
                        <fieldset class="search_field">
                        <input type="date" id="fromDate" name="fromDate" value="fromDate"> ~
                        <input type="date" id="endDate" name="endDate" value="endDate">
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
                        </form>
                        </div>
                   		<!-- date button end -->
						<div class="table_div">
							<ul>
								<li style="list-style: none"><span style="font-size: 15; font: bold;"></span></li>
								<li style="list-style: none"><span class="total_Price_span"></span></li>
							</ul>					
					
						<!-- 결산차트 사용 데이터 -->
						<div id="chart_div" style="width:900px; height:500px;">
					
						
						</div>
						<!-- 카테고리별 사용 데이터 -->
						<div id="columnchart_material" style="width: 900px; height: 300px;">
						
						</div>
						
					</div>
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


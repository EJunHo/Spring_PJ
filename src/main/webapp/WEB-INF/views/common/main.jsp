<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/common_CSS/main.css">
<title>Insert title here</title>
</head>
<body>
  <!-- header start -->
   <%@ include file="header.jsp" %>
    <!-- header end -->
    
    <!-- section 1 start -->
    <div id="content">
        <div class="section1">
           <input type="radio" name="slide" id="slide1" checked>
           <input type="radio" name="slide" id="slide2">
           <input type="radio" name="slide" id="slide3">
           <div class="slidewrap">
               <ul class="slidelist">
                   <li>
                        <a><label for="slide3" class="left"></label>
                        <img src="${path}/resources/other_images/suite_1.jpg">
                        <label for="slide2" class="right"></label></a>
                   </li>
                
                   <li>
                         <a><label for="slide1" class="left"></label>
                          <img src="${path}/resources/other_images/suite_2.jpg">
                          <label for="slide3" class="right"></label></a>
                   </li>
                 
                   <li>
                        <a><label for="slide2" class="left"></label>
                        <img src="${path}/resources/other_images/suite_3.jpg">
                        <label for="slide1" class="right"></label></a>
                   </li>
               </ul>
           </div>
          
        </div>
    </div>
    <!-- section 1 end -->
    <!-- section 2 start -->
    <div class="section2">
        <div class="imgbox">
           <img src="${path}/resources/other_images/suite_4.png" width="400" height="400">
                <ul>
                    <li>올리 슬림핏 수트 셋업 차콜</li>
                    <li>81,000원</li>
                    <li></li>
                    <li></li>
                </ul>
        </div>
        <div class="imgbox">
            <img src="${path}/resources/other_images/상의/c8b9867fcd913bbe188288a9ca10c95f.jpg" width="400" height="400">
                <ul>
                    <li>퍼펙트 핏 수트 셋업</li>
                    <li style="font-weight: lighter;">트렌디한 핏의 퀄리티 좋은 셋업</li>
                    <li>125,000원</li>
                    <li><small>상품문의9</small></li>
                </ul>
        </div>
        <div class="imgbox">
            <img src="${path}/resources/other_images/suite_6.jpg" width="400" height="400">
                <ul>
                    <li>울리 슬림핏 수트 셋업 베이지</li>
                    <li>81,000원</li>
                    <li></li>
                    <li></li>
                </ul>
        </div>
        <div class="imgbox">
            <img src="${path}/resources/other_images/셔츠/c10f4860d656e30dfe1960c01cf87eda.jpg" width="400" height="400">
                <ul>
                    <li>어반 스탠다드 스판 수트셋업</li>
                    <li><small>1 color / 5 size</small></li>
                    <li>89,000원</li>
                    <li><small>상품문의24</small></li>
                </ul>
        </div>
     

        
    </div>
    <!-- section 2 end -->

      <!-- section 3 start -->
      <div class="section3">
        <div class="imgbox">
           <img src="${path}/resources/other_images/팬츠/c91db2c852ce13580bd16422808368f5.jpg" width="400" height="400">
                <ul>
                    <li>어반 스탠다드 스판 수트셋업</li>
                    <li><small>1 color / 5 size</small></li>
                    <li>89,000원</li>
                    <li></li>
                </ul>
        </div>
        <div class="imgbox">
            <img src="${path}/resources/other_images/팬츠/a036aad8dd8b6962a373fa0778f965f0.png" width="400" height="400">
                <ul>
                    <li>에디 싱글 수트 셋업</li>
                    <li><small>3 color / 3 size</small></li>
                    <li>117,000원</li>
                    <li></li>
                </ul>
        </div>
        <div class="imgbox">
            <img src="${path}/resources/other_images/overfit1.gif" width="400" height="400">
                <ul>
                    <li>페스토 체크 셋업수트</li>
                    <li>127,000원</li>
                    <li><small>상품문의</small></li>
                    <li></li>
                </ul>
        </div>
        <div class="imgbox">
            <img src="${path}/resources/other_images/팬츠/582d00f69ed2dcf1a1f5603ecb1ee84a.png" width="400" height="400">
                <ul>
                    <li>디메로 셋업수트</li>
                    <li><small>5 color / 3 size</small></li>
                    <li>68,000원</li>
                    <li><small>상품문의</small></li>
                </ul>
        </div>
      

        
    </div>
    
    <!-- section 2 end -->
    
   <!-- footer start -->
   <%@ include file="footer.jsp" %>
   <!-- footer end -->
   	
</body>
</html>
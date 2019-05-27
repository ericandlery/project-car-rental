<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:remove var="staff_login_ok" scope="session"/>
<c:remove var="manager_login_ok" scope="session" />			<!-- 強制登出管理者和門市人員 -->
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Jeams租車</title>
    <link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
<script src="/TestRentalMVC/assets/js/jquery.min.js"></script> 
<script src="/TestRentalMVC/assets/js/bootstrap.min.js"></script> 
<script src="/TestRentalMVC/assets/js/wow.min.js"></script> 
<script src="/TestRentalMVC/assets/js/slick.min.js"></script> 
<script src="/TestRentalMVC/assets/js/custom.js"></script>
    <style>
/*         CSS改這個地方//////////////////////////// */
        
           .content_top{floft:left;margin-left:10px;}
/*         CSS///////////// ///////////////////////*/
    </style>
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
      });
//     	JavaScript改這個地方///////////////////////////////////////


// 		JavaScript////////////////////////////////////////////////
    </script>
</head>
<body>
    <div>
        <c:choose>
        <c:when test="${empty login_ok}">
        <nav id="include_nav_no_login">
        </nav>
        </c:when>
        <c:otherwise>
        <nav id="include_nav_login">
        </nav>
        </c:otherwise>
        </c:choose>
        <article>
        
 <div class="content_top">
      <div class="row">
        <div class="col-lg-6 col-md-6 col-sm6">
          <div class="latest_slider">
            <div class="slick_slider">
              <div class="single_iteam"><a class="slider_tittle" >
              <img src="/TestRentalMVC/images/car550x290x1.jpg" alt=""></a>
              </div>
              <div class="single_iteam"><a class="slider_tittle" >
              <img src="/TestRentalMVC/images/car550x290.jpg" alt=""></a>
              </div>
              <div class="single_iteam"><a class="slider_tittle" >
              <img src="/TestRentalMVC/images/car550x290x2.jpg" alt=""></a>
              </div>
              <div class="single_iteam"><a class="slider_tittle" >
              <img src="/TestRentalMVC/images/car550x290x3.jpg" alt=""></a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm6">
          <div class="content_top_right">
            <ul class="featured_nav wow fadeInDown">
              <li><img src="/TestRentalMVC/images/300x215xa.jpg" alt="">
                <div class="title_caption"><a href="http://www.cwb.gov.tw/V7/index.htm">台灣主要城市氣候</a></div>
              </li>
              <li><img src="/TestRentalMVC/images/300x215xb.jpg" alt="">
                <div class="title_caption"><a href="http://1968.freeway.gov.tw/">國道高速公路即時路況資訊</a></div>
              </li>
              <li><img src="/TestRentalMVC/images/300x215xc.jpg" alt="">
                <div class="title_caption"><a href="http://www.thsrc.com.tw/tw/TimeTable/SearchResult">台灣高鐵時刻表</a></div>
              </li>
              <li><img src="/TestRentalMVC/images/300x215xd.jpg" alt="">
                <div class="title_caption"><a href="http://twtraffic.tra.gov.tw/twrail/TW_Quicksearch.aspx">國內火車時刻表</a></div>
              </li>
                
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
<!--     <div class="single_bottom_rightbar"> -->
<!--             <ul role="tablist" class="nav nav-tabs custom-tabs"> -->
<!--               <li class="active" role="presentation"><a data-toggle="tab" role="tab" aria-controls="home" href="#mostPopular">Most Popular</a></li> -->
<!--               <li role="presentation"><a data-toggle="tab" role="tab" aria-controls="messages" href="#recentComent">Recent Comment</a></li> -->
<!--             </ul> -->
<!--             <div class="tab-content"> -->
<!--               <div id="mostPopular" class="tab-pane fade in active" role="tabpanel"> -->
<!--                 <ul class="small_catg popular_catg wow fadeInDown"> -->
<!--                   <li> -->
<!--                     <div class="media wow fadeInDown"> <a class="media-left" href="#"><img src="images/112x112.jpg" alt=""></a> -->
<!--                       <div class="media-body"> -->
<!--                         <h4 class="media-heading"><a href="#">Duis condimentum nunc pretium lobortis </a></h4> -->
<!--                         <p>Nunc tincidunt, elit non cursus euismod, lacus augue ornare metus, egestas imperdiet nulla nisl quis mauris. Suspendisse a pharetra </p> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </li> -->
<!--                   <li> -->
<!--                     <div class="media wow fadeInDown"> <a class="media-left" href="#"><img src="images/112x112.jpg" alt=""></a> -->
<!--                       <div class="media-body"> -->
<!--                         <h4 class="media-heading"><a href="#">Duis condimentum nunc pretium lobortis </a></h4> -->
<!--                         <p>Nunc tincidunt, elit non cursus euismod, lacus augue ornare metus, egestas imperdiet nulla nisl quis mauris. Suspendisse a pharetra </p> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </li> -->
<!--                   <li> -->
<!--                     <div class="media wow fadeInDown"> <a class="media-left" href="#"><img src="images/112x112.jpg" alt=""></a> -->
<!--                       <div class="media-body"> -->
<!--                         <h4 class="media-heading"><a href="#">Duis condimentum nunc pretium lobortis </a></h4> -->
<!--                         <p>Nunc tincidunt, elit non cursus euismod, lacus augue ornare metus, egestas imperdiet nulla nisl quis mauris. Suspendisse a pharetra </p> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </li> -->
<!--                 </ul> -->
<!--               </div> -->
<!--           </div> -->
        </article>

    </div>
    
<%-- <h3>path=<%=application.getRealPath("/")%></h3>     --%>
    <%@ include file='/shared/footer.jsp'%>
               
</body>
</html>
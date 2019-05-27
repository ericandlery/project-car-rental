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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/header_footer.css"> -->
    
<!--     景點本身的樣式 -->
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
  <link href="../resources/css/font-awesome.min.css" rel="stylesheet">
  <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> 
  <link href="../resources/css/flexslider.css" rel="stylesheet"> 
  <link href="../resources/css/templatemo-style.css" rel="stylesheet"> 
  
     
<!--     景點本身的樣式 -->
<script src="../TestRentalMVC/assets/js/jquery.min.js"></script> 
<script src="../TestRentalMVC/assets/js/bootstrap.min.js"></script> 
<script src="../TestRentalMVC/assets/js/wow.min.js"></script> 
<script src="../TestRentalMVC/assets/js/slick.min.js"></script> 
<script src="../TestRentalMVC/assets/js/custom.js"></script>

    <style>
/*         CSS改這個地方//////////////////////////// */
        .map {
	height: 250px;
	width: 200px;
}
        
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
<!--                       HTML改這裡 ////////////////////-->
		
		
<!--                       HTML/////////////////////////// -->
        </article>
        
   

     
	<!-- white bg -->
	<section class="tm-white-bg section-padding-bottom">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3">
						<hr>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<h2 class="tm-section-title" style="font-weight:bold">選擇位置</h2>
					</div>
					<div class="col-lg-4 col-md-3 col-sm-3">
						<hr>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-tours-box-2">
						<a href="tour_north.controller?location=north" class="tm-tours-box-2-link">
						<img src="../images/台北.jpg" alt="image" class="img-responsive"></a>
						<div class="tm-tours-box-2-info">
							<h3 class="margin-bottom-15" style="font-weight:bold" align="center">北部景點</h3>
							
						</div>
						
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-tours-box-2">
						<a href="tour_north.controller?location=west" class="tm-tours-box-2-link">
						<img src="../images/台中.jpg" alt="image" class="img-responsive"></a>
						<div class="tm-tours-box-2-info">
							<h3 class="margin-bottom-15" style="font-weight:bold" align="center">中部景點</h3>
							
						</div>
						
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-tours-box-2">
						<a href="tour_north.controller?location=south" class="tm-tours-box-2-link">
						<img src="../images/高雄.jpg" alt="image" class="img-responsive"></a>
						<div class="tm-tours-box-2-info">
							<h3 class="margin-bottom-15" style="font-weight:bold" align="center">南部景點</h3>
							
						</div>
											</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-tours-box-2">
						<a href="tour_north.controller?location=east" class="tm-tours-box-2-link">
						<img  src="../images/東部.jpg" alt="image" class="img-responsive"></a>
						<div class="tm-tours-box-2-info">
							<h3 class="margin-bottom-15" style="font-weight:bold" align="center">東部景點</h3>
							
						</div>
						
					</div>
				</div>
			</div>
			
		</div>
	</section>




	<!-- gray bg -->
	<section class="container tm-home-section-1" id="more">
	
	
	
			<div class="row">
				<div class="tm-section-header">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<hr>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						
						<c:choose>
						
	<c:when test="${not empty area_noTour}">
	<div style="font-size:50px;font-family:impact ;color:blue" align="center">${area_noTour}</div>
			
	</c:when>
	<c:otherwise>
		<h2 class="tm-section-title" style="font-weight:bold">景點</h2>
	
						
						
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3">
						<hr>
					</div>
				</div>
			</div>
			
		<div class="section-margin-top">
		
			<div class="row">
			
			
			

			<input id="size" style="display:none" value="${size}">
			
			<c:forEach var="all" items="${all}">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="tm-tours-box-1">
					
					
					
					
					
					<tr><td width="2%" align="center" style="background-color:#CCDDFF;border-color:black;">
								<c:choose>
								<c:when test="${empty all.photo}">
								<p>沒有圖片</p>
								</c:when>
								<c:otherwise>
								<img  src="/TestRentalMVC/resources/tour/${all.photo}" height="300px" width="500px">
								</c:otherwise>
								</c:choose>
										
										</td></tr>
				
							<div class="tm-tours-box-1-info">
								<div class="tm-tours-box-1-info-left">
									<p class="text-uppercase margin-bottom-20">

										
										<tr>
											<td>名稱:</td>
											<td>${all.name}</td></br>
										</tr>
<!-- 										<tr> -->
<!-- 											<td>地址:</td> -->
<%-- 											<td>${all.address}</td></br> --%>
<!-- 										</tr> -->
										<tr>
											<td>預算:</td>
											<td>${all.price}</td></br>
										</tr>
										<tr>
											<td>就近據點:</td>
											<td> <a href="/TestRentalMVC/branch_zone/branch_search.jsp">${all.branch_name}</a></td></br>
										</tr>
<!-- 										<tr> -->
<!-- 											<td>score</td> -->
<%-- 											<td>${all.score}</td></br> --%>
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td>score_count</td> -->
<%-- 											<td>${all.score_count}</td></br> --%>
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td>popularity</td> -->
<%-- 											<td>${all.popularity}</td></br> --%>
<!-- 										</tr> -->

										
										<tr>
<!-- 											<td>敘述</td> -->
											<td>${all.description}</td></br>
										</tr>
								</div>
								<div class="tm-tours-box-1-info-right">
									<article>
										<div>
										
<!-- 										地圖 -->
										
										<input id='address' type="hidden" value="${all.address}">
<%-- 										<div style="height:200px;weight:200px" id='${all.id}'></div> --%>
										<div id='${all.address}' class="map">mapTest</div>		

										</div>
									</article>
								</div>
							</div>
							<div class="tm-tours-box-1-link">
							<div class="tm-tours-box-1-link-left">${all.address}</div>
					
						</div>
					</div>
				</div>
				</c:forEach>
				
				
				
			</div>
		</div>
		</c:otherwise>
	</c:choose>
	</section>

</div>

	<script type="text/javascript" src="../resources/js/jquery-1.11.2.min.js"></script>
	<!-- jQuery -->
	<script type="text/javascript" src="../resources/js/moment.js"></script>
	<!-- moment.js -->
	<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
	<!-- bootstrap js -->
	<script type="text/javascript" src="../resources/js/bootstrap-datetimepicker.min.js"></script>
	<!-- bootstrap date time picker js, http://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script type="text/javascript" src="../resources/js/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="../resources/js/templatemo-script.js"></script>
	<!-- Templatemo Script -->
<!-- 	<script async defer -->
<!--             src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWlvLUkAizgsYBZZD-v8FNYdDhF1-6qSo&callback=initMap"> -->
<!--     </script> -->
	
	
	
	
	<!------------------------  GoogleMap ----------------------->

	
	<script>

	
		function initMap() {
			var i=document.getElementById("size").value;
		
			for(var n=0;n<=i-1;n++){
				var mp=$(".map").eq(n).attr("id");//取出所有div的class=map的元素，eq(0)=第一個，attr=抓取id值
	 			var map = new google.maps.Map(document.getElementById(mp), {
				zoom : 12,
			});
			var geocoder = new google.maps.Geocoder();
			geocodeAddress(geocoder, map);
				
				
			}
				
	 		   
		
		}
		
		</script>



   <script>
		function geocodeAddress(geocoder, resultsMap) {

		var address = document.getElementById('address').value;
// 	     alert(address);
		document.getElementById('address').removeAttribute("id");
		
		
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status === 'OK') {
									resultsMap
											.setCenter(results[0].geometry.location);
									var marker = new google.maps.Marker({
										map : resultsMap,
										position : results[0].geometry.location
									});
								} else {
// 									alert('Geocode was not successful for the following reason: '
// 											+ status);
								}
							});
		}
	</script>

<script defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC1NIJ4lHxca0Xj-L32quFIB-A4eKvpRsE&callback=initMap">
    </script>
<!-- ----------------------------------------------- -->
 

	<script>
		// HTML document is loaded. DOM is ready.
		$(function() {

			$('#hotelCarTabs a').click(function(e) {
				e.preventDefault()
				$(this).tab('show')
			})

			$('.date').datetimepicker({
				format : 'MM/DD/YYYY'
			});
			$('.date-time').datetimepicker();

			// https://css-tricks.com/snippets/jquery/smooth-scrolling/
			$('a[href*=#]:not([href=#])')
					.click(
							function() {
								if (location.pathname.replace(/^\//, '') == this.pathname
										.replace(/^\//, '')
										&& location.hostname == this.hostname) {
									var target = $(this.hash);
									target = target.length ? target
											: $('[name=' + this.hash.slice(1)
													+ ']');
									if (target.length) {
										$('html,body').animate({
											scrollTop : target.offset().top
										}, 1000);
										return false;
									}
								}
							});
		});

		// Load Flexslider when everything is loaded.
		$(window).load(function() {
			$('.flexslider').flexslider({
				controlNav : false
			});
		});
	</script>

    
     
    <!-- 	<footer class="tm-black-bg"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<p class="tm-copyright-text"> -->
<!-- 					Copyright &copy; 2084 Your Company Name | Designed by <a -->
<!-- 						rel="nofollow" href="http://www.templatemo.com" target="_parent">templatemo</a> -->
<!-- 				</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</footer> -->
  <%@ include file='/shared/footer.jsp'%> 
    

    
</body>
</html>
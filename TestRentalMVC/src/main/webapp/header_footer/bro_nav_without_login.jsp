<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/css/animate.css">
<link rel="stylesheet" type="text/css" href="/TestRentalMVC/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/TestRentalMVC/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/TestRentalMVC/css/slick.css">
<link rel="stylesheet" type="text/css" href="/TestRentalMVC/css/style.css">
<link rel="stylesheet" type="text/css" href="/TestRentalMVC/css/theme.css">
<link rel="stylesheet" type="text/css" href="/TestRentalMVC/css/font-awesome.min.css">

<script src="/TestRentalMVC/assets/js/jquery.min.js"></script> 
<script src="/TestRentalMVC/assets/js/bootstrap.min.js"></script> 
<script src="/TestRentalMVC/assets/js/wow.min.js"></script> 
<script src="/TestRentalMVC/assets/js/slick.min.js"></script> 
<script src="/TestRentalMVC/assets/js/custom.js"></script>
<title>Jeams租車</title>

<style>
.outer{height:200px;}

</style>
</head>
<body>
<div class="outer">
<header id="header">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="header_bottom">
					<div class="header_bottom_left">   <!-- 回租車首頁 -->
						<a class="logo" href="/TestRentalMVC/index.jsp"><img
							src="/TestRentalMVC/images/logo60x60.png" /><strong>Jeams租車</strong>
							<span>We Are Give You Happy Time</span></a>
					</div>
					<div class="header_bottom_right">   <!-- 廣告欄 -->
						<a href="#"><img src="/TestRentalMVC/images/car728x90.png"alt=""></a>  
					</div>
				</div>
			</div>
		</div>
</header>

	<div id="navarea">
		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav custom_nav">
					<li class="dropdown"><a href="#" class=""
							data-toggle="dropdown" role="button" aria-expanded="false">租車專區</a>
							<ul class="dropdown-menu" role="menu">
								<li><a
									href="/TestRentalMVC/rent_car_function/make_reservation/reservation_form.jsp">快速預約租車</a></li>								
							</ul></li>
							<li><a href="/TestRentalMVC/car_list/car_list_index.jsp">車輛簡介</a></li>
							<li><a href="/TestRentalMVC/Tour/tour_all.jsp">景點查詢</a></li>
							<li class="dropdown"><a href="#" class=""
							data-toggle="dropdown" role="button" aria-expanded="false">機場接送專區</a>
							<ul class="dropdown-menu" role="menu">
								<li><a
									href="/TestRentalMVC/pickup_service/airfield/airfield_service.jsp">接送服務</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class=""
							data-toggle="dropdown" role="button" aria-expanded="false">會員專區</a>
							<ul class="dropdown-menu" role="menu">
							<li><a
									href="/TestRentalMVC/member_function/member_zone.jsp">會員服務總攬</a></li>
								<li><a
									href="/TestRentalMVC/member_function/inquire_orders.jsp">查詢租車訂單</a></li>
									<li><a
									href="/TestRentalMVC/member_function/pickup/check_pickup_order.jsp">查詢機場接送訂單</a></li>
								<li><a href="/TestRentalMVC/member_function/wallet.jsp">電子錢包</a></li>
								<li><a
									href="/TestRentalMVC/member_function/member_update.jsp">更新會員資料</a></li>
								<li><a
									href="/TestRentalMVC/member_function/between_opinion.jsp">意見回覆</a></li>
							</ul>
							
						</li>
						<li><a href="/TestRentalMVC/forum/showhotArticle.controller">討論區</a></li>
						<li><a href="/TestRentalMVC/branch_zone/branch_search.jsp">查詢據點</a></li>
						<li><a href="/TestRentalMVC/opinion/send_opinion.jsp">意見</a></li>
						<li><a href="/TestRentalMVC/member_registry/member_registry.jsp">會員註冊</a></li>
						<li><a href="/TestRentalMVC/member_function/login.jsp">會員登入</a></li>
						<li><a href="/TestRentalMVC/manager_zone/manager_login.jsp">管理員登入</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	
	</div>
</body>
</html>
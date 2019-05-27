<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty manager_login_ok}">
<c:redirect url="/manager_zone/manager_login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>歡迎來到ProjectRental</title>
    <link rel="shortcut icon" href="../images/logo16x16.ico">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/manager_hf2.css">
    <style>
/*         改這個地方 */
        #manager{width:1500px;height:700px;margin:auto;color:white;}
        #title{height:150px;}
        .box{border-radius:20px;background-color:azure;width:200px;height:200px;display:inline-block;font-size:28px;margin:40px;overflow:auto;text-align:center;}
        .box span{background-color:yellowgreen;display:block;height:50px;text-align:center;
                  background:-webkit-radial-gradient(circle,#45FF45,#00D100)}
        
        .icons{height:70%;width:70%;margin:auto;}
/*         改這個地方 */
    </style>
    <script>
    </script>
</head>
<body>
    <div>
    <header>
			接送服務管理
			<div>
				<a href="/TestRentalMVC/manager_zone/manager_zone.jsp"><img
					src="/TestRentalMVC/images/home160x160.png"></a> <span><a
					href="/TestRentalMVC/index.jsp"><img
						src="/TestRentalMVC/images/logout180x130.png"></a></span>
			</div>
		</header>
        <nav></nav>
        <article>
<!--                       改這裡 -->
		<div id="manager">
                <div id="title"></div>
                <center>
                <a href="showDriverList.controller"><div class="box"><span>司機名單</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/driverlist.jpg"></div></a>
                <a href="showTodayPickupOrder.controller"><div class="box"><span>近期接送訂單</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/recentpickup.png"></div></a>
                <a href="showPickupOrderList.controller"><div class="box"><span>所有接送訂單</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/allpickup.png"></div></a>
				</center>
            </div>
		
<!--                       改這裡 -->
        </article>
    </div>
</body>
</html>
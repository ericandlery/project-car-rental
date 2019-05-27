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
    <title>Jeams租車管理員</title>
    <link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
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
		article{margin-left:100px;}
        #manager{width:1500px;height:700px;margin:auto;color:white;overflow:auto;}
        #title{height:150px;}
        .box{border-radius:20px;background-color:azure;width:200px;height:200px;display:inline-block;
             font-size:28px;margin:40px;overflow:auto;text-align:center;}
        .box span{background-color:yellowgreen;display:block;height:50px;text-align:center;
                  background:-webkit-radial-gradient(circle,#45FF45,#00D100);font-weight:bold;}
        
        .icons{height:70%;width:70%;margin:auto;}
/*         改這個地方 */
    </style>
    <script>
    </script>
</head>
<body>
    <div>
		<header>
			管理者頁面
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
                <a href="selectAllMembersOrderById.controller"><div class="box"><span>會員列表</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/member_list.png"></div></a>
                <a href="selectAllOrderOrder.controller"><div class="box"><span>訂單列表</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/orders.png"></div></a>
                <a href="selectAllCarOrder.controller"><div class="box"><span>車輛列表</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/car_list.png"></div></a>
                <a href="selectAllBranchOrder.controller"><div class="box"><span>據點列表</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/branch.png"></div></a>
                <a href="selectAllCarCategory.controller"><div class="box"><span>車型管理</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/car_model.png"></div></a><br/>
                <a href="/TestRentalMVC/manager_zone/pickup_manager/pickup_menu.jsp"><div class="box"><span>接送服務管理</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/pickup.png"></div></a>
                <a href="manageArticle.controller"><div class="box"><span>討論區管理</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/forums.png"></div></a>
                <a href="showOpinionList.controller"><div class="box"><span>客戶意見</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/opinion.png"></div></a>
                <a href="reviewMembership.controller"><div class="box"><span>審核會員</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/approval.jpg"></div></a>
                <a href="tour_all.controller"><div class="box"><span>旅遊景點</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/tour.png"></div></a><br>
                <a href="showStaffList.controller"><div class="box"><span>門市人員管理</span><img class="icons" alt="按此進入" src="/TestRentalMVC/resources/manager_icons/staff.png"></div></a>

<!--                 <div class="box"><span>TEST</span></div> -->
            </div>
		
<!--                       改這裡 -->
        </article>
    </div>
</body>
</html>
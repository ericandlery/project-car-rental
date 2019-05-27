<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:remove var="staff_login_ok" scope="session"/>
<c:remove var="manager_login_ok" scope="session"/>			<!-- 強制登出管理者和門市人員 -->
<c:if test="${empty login_ok}">
<c:redirect url="/member_function/login.jsp"></c:redirect>
</c:if>
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
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script -->
<!-- 	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- 	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/header_footer.css"> -->
    <style>
        .top{height:700px;}
         #title{text-align: center;font-size: 3em;font-weight:bold;color:#636363;font-family:標楷體;}
        .menu{height:200px;width:100px;float:left;margin-left:500px;margin-top:100px;}
       .menu1{height:200px;width:100px;float:left;margin-left:700px;margin-top:100px;}
       #bottom{float:right;margin-right:200px;clear:both;}
/*        .title{text-align:center;font-size:3em;} */
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
    <div class="top">
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
        <div id="title"><p>接送訂單查詢表</p></div>
<!--                       HTML改這裡 ////////////////////-->
<!-- 		<div id="outer"> -->
<!--                 <a href="checkPickupOrder.controller?type=current"><div class="menu"><p class="title">查詢現在訂單</p></div></a> -->
<!--                 <a href="checkPickupOrder.controller?type=history"><div class="menu"><p class="title">查詢歷史訂單記錄</p></div></a> -->
<!--        </div> -->

				<div class="menu">
					<a href="checkPickupOrder.controller?type=current"><img
						src="/TestRentalMVC/images/query200x200.jpg" alt="查詢目前訂單"></a></div>
					<div class="menu1"><a href="checkPickupOrder.controller?type=history"><img
						src="/TestRentalMVC/images/querylist200x200.jpg" alt="查詢歷史訂單記錄"></a>
				</div>
			
		
<!--                       HTML/////////////////////////// -->
        </article>
    </div>
    
    <div id="bottom"><a href="/TestRentalMVC/member_function/member_zone.jsp">
                <img src="/TestRentalMVC/images/backpage120x70.png"></a></div>
                
        <%@ include file='/shared/footer.jsp'%> 
    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>租車頁面</title>
    <link rel="shortcut icon" href="../images/logo16x16.ico">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/header_footer.css">
    <style>
/*         改這個地方 */
        #rent_zone{background-color:aquamarine;width:1400px;height:800px;margin:auto;}
        #title{text-align:center;font-size:3em;}
        .box{background-color:powderblue;width:200px;height:200px;display:inline-block;margin:30px;}
        .function{font-size:2em;text-align:center;background-color:lightgrey;}
        
/*         改這個地方 */
    </style>
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/nav_with_login.jsp");
      });
    </script>
</head>
<body>
    <div>
    <header>
            ProjectRental
        </header>
<%--         <%@ include file='/shared/header.jsp'%> --%>
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
<!--                       改這裡 -->
		<div id="rent_zone">
                <p id="title">租車頁面</p>
                <a href="/TestRentalMVC/rent_car_function/make_reservation/reservation_form.jsp"><div class="box"><p class="function">快速預約租車</p></div></a>
<!--                 <a href="/TestRentalMVC/rent_car_function/rent_step/rent_step1.jsp"><div class="box"><p class="function">租車</p></div></a> -->
                <div class="box"><p class="function">敬請期待</p></div>
                <div class="box"><p class="function">敬請期待</p></div>
                <div class="box"><p class="function">敬請期待</p></div>
                <div class="box"><p class="function">敬請期待</p></div><br />
                <div class="box"><p class="function">敬請期待</p></div>
                <div class="box"><p class="function">敬請期待</p></div>
                <div class="box"><p class="function">敬請期待</p></div>
                <div class="box"><p class="function">敬請期待</p></div>
                <div class="box"><p class="function">敬請期待</p></div>
            </div>
		
<!--                       改這裡 -->
        </article>
        
    </div>
<%--     <%@ include file='/shared/footer.jsp'%> --%>
</body>
</html>
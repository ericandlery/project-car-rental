<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	src="/TestRentalMVC/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body{background-color:aqua;margin:0px;}
        header{height:100px;background-color:blue;font-size:3em;}
        nav{background-color:antiquewhite;height:40px;}
        nav span{float:right;margin-right:100px;font-size:2em;border-left:solid black 40px;}

        footer{background-color:darkorchid;height:50px;text-align:center;font-size:2em}
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

        </article>
    </div>
</body>
</html>
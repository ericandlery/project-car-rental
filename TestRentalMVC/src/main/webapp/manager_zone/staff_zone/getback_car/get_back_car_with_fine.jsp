<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>罰錢</title>
<link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
<script
	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		var diffDays=$("#a").text();
		var oldPrice=$("#b").text();
		var newPrice=$("#c").text();
		
		alert("原價是"+oldPrice+"元，但是你逾期"+diffDays+"天，加上罰款後必須付"+newPrice+"元");
		location.href="getCarBackOrders.controller";
	});
</script>
</head>
<body>
<p style="display:none" id="a">${diffDays}</p>
<p style="display:none" id="b">${oldPrice}</p>
<p style="display:none" id="c">${newPrice}</p>
</body>
</html>
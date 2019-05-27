<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
/*         改這個地方 */
/*         div#inquire{width:1000px;height:600px;margin:auto;} */
       
/*         div#top{height:150px;text-align:center} */
/*         div#now{background-color:palevioletred;width:300px;height:300px;position:relative;top:0px;left:100px;display:inline-block;text-align:center;} */
/*         div#past{background-color:palevioletred;width:300px;height:300px;position:relative;top:0px;left:300px;display:inline-block;text-align:center;} */
/*         #title{display:inline-block;position:relative;top:50px;font-size:3em;} */
        span.text{display:inline-block;font-size:2em;margin-top:50px;}
        
         .top{height:700px;}
         .title{text-align: center;font-size: 3em;font-weight:bold;color:#636363;font-family:標楷體;}
        .menu{height:200px;width:100px;float:left;margin-left:500px;margin-top:100px;}
       .menu1{height:200px;width:100px;float:left;margin-left:700px;margin-top:100px;}
       #bottom{float:right;margin-right:200px;clear:both;}
/*         改這個地方 */
    </style>
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
      });
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
        <div class="title"><p>租車訂單查詢表</p></div>
        
  
                <div class="menu">
					<a href="activeOrder.controller"><img
						src="/TestRentalMVC/images/query200x200.jpg" alt="查詢目前訂單"></a></div>
					<div class="menu1"><a href="historyOrder.controller"><img
						src="/TestRentalMVC/images/querylist200x200.jpg" alt="查詢歷史訂單記錄"></a>
				</div>
				</article>
  </div>
  
                <div id="bottom"><a href="/TestRentalMVC/member_function/member_zone.jsp">
                <img src="/TestRentalMVC/images/backpage120x70.png"></a></div>

        
    
         <%@ include file='/shared/footer.jsp'%> 
</body>
</html>
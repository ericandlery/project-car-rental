<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
.top{height:750px;}
.box{border:solid black 2px;width:900px;margin:auto;margin-top:50px;}
#title{background-color:black;text-align:center;color:white;font-size:3em;}
.txt{border:solid black 2px;width:400px;height:250px;margin:20px;display:inline-block;background-color:#BFEFED;overflow:auto;}
.self{border:solid black 2px;height:100px;overflow:auto;background-color:#CCE8CF;}

/*         改這個地方 */
    </style>
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
        
        $.getJSON("showMemState.controller",function(data){
        	$("#state").text(data);
        });

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
<!--                       改這裡 -->
		<div class="box">
		
			<div id="title"><p>留言及回覆</p></div>
			<c:if test="${not empty error}">
				<h1 style="text-align:center;">${error}</h1>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="list" items="${list}">
					<div class="txt">
						您的留言<br>
						發送時間：${list.datetime}
						<div class="self">
							<p>${list.text}</p>
						</div>
						<fieldset style="color:red;"><legend style="font-size:12px;">管理員回覆<br>回覆時間：${list.re_time}</legend>${list.reply}</fieldset>
					</div>
				</c:forEach>
			</c:if>
<!--                       改這裡 -->
        </article>
        
    </div>
    <%@ include file='/shared/footer.jsp'%> 
</body>
</html>
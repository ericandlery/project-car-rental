<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
/*     ////////////////// */
                input:-webkit-autofill {
		    -webkit-box-shadow: 0 0 0px 1000px white inset;
		}
/* 		///////////// */
    </style>
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
      });
    
    </script>
</head>
<body>
    <div class="container">
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
<div class="container">
		<h2>註冊會員</h2>
		<form action="addNewMember.controller" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="email">電子信箱(這將會是您的帳號):</label> <input type="email"
					class="form-control" id="email" placeholder="Enter email"
					name="email"> <span>${emailWrong}</span>
			</div>
			<div class="form-group">
				<label for="pwd">密碼:</label> <input type="password"
					class="form-control" id="password" placeholder="Enter password"
					name="password"> <span>${errors.error2}</span>
			</div>
			<div class="form-group">
				<label for="name">名字:</label> <input type="text"
					class="form-control" id="name" placeholder="Enter your name"
					name="name"> <span>${errors.error3}</span>
			</div>
			<div class="form-group">
				<label for="IDcard">身分證字號:</label> <input type="text"
					class="form-control" id="id_card"
					placeholder="Enter your ID card number" name="id_card"> <span>${errors.error4}</span>
			</div>
			<div class="form-group">
				<label for="address">地址:</label> <input type="text"
					class="form-control" id="address" placeholder="Enter address"
					name="address"> <span>${errors.error5}</span>
			</div>
			<!-- 轉換日期格式!!!!!!!!!!!!!!! -->
			<div class="form-group">
				<label for="birth">生日:</label> <input type="date"
					class="form-control" id="birth" placeholder="Enter birthday"		
					name="birthDate"> <span>${errors.error6}</span>
			</div>
			<!-- 重要!!!!!!!!!!!!!!! -->
			<div class="form-group">
				<label for="phone">手機號碼:</label> <input type="text"
					class="form-control" id="phone"
					placeholder="Enter your phone number" name="phone"> <span>${errors.error7}</span>
			</div>
			<div class="form-group">
				<label for="tele">電話號碼:</label> <input type="text"
					class="form-control" id="tel"
					placeholder="Enter your telephone number" name="tel"> <span>${errors.error8}</span>
			</div>
			<div class="form-group">
				<label for="photo">大頭照(限JPEG格式):</label> <input type="file"
					class="form-control" id="mem_photo" value="upload photo" name="file" accept="image/jpeg"> <span></span>
			</div>
			<div class="form-group">
				<label for="photo">駕照圖檔(限JPEG格式):</label> <input type="file"
					class="form-control" id="license_photo" name="license_photo_t" accept="image/jpeg"> <span>${license_photoWrong}</span>
			</div>
			<div class="checkbox">

<!-- 				<label><input type="checkbox" name="remember"> -->
<!-- 					Remember me</label> -->
<!-- 					 <label><input type="checkbox" -->
<!-- 					name="Subscription"> Subscription</label> -->
			</div>
<!-- 			<input class="hiddenText" name="wallet" > -->
<!-- 			<input class="hiddenText" name="bonuspoint" > -->
<!-- 			<input class="hiddenText" name="subscription" > -->
<!-- 			<input class="hiddenText" name="mem_state" > -->
<!-- 			<input class="hiddenText" name="registration_date" > -->
<!-- 			<input class="hiddenText" name="license_num" > -->
<!-- 			<input class="hiddenText" name="license_leval" > -->
			<button type="submit" class="btn btn-primary">Submit</button> <span>${errors.error0}</span>
		</form>
	</div>
        </article>
    </div>
        <%@ include file='/shared/footer.jsp'%> 
</body>
</html>
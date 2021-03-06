<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:remove var="staff_login_ok" scope="session" />
<c:remove var="manager_login_ok" scope="session" />
<!-- 強制登出管理者和門市人員 -->
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
/*         CSS改這個地方//////////////////////////// */
.top{height:1300px;}
#title {
	text-align: center;
	font-size: 3em;
	font-weight:bold;
	color:#636363;
	font-family:標楷體;
}

#menu {
	background-color: yellow;
	height: 700px;
	width: 300px;
	float: right;
	color: white;
	font-size: 2em;
	position: fixed;
}

#content {
	border: solid black 10px;
	width: 1200px;
	float: right;
	margin-right: 80px;
	text-align:center;
}

#list {
	margin: 60px;
}

.box {
	background-color: whitesmoke;
	height: 900px;
	width: 500px;
	display: inline-block;
	margin-left: 50px;
	border: solid black;
	margin-top: 50px;
	float:left;
}

.pics {
	border: solid red 4px;
	height: 400px;
}
.pics img{
	width:100%;
	height:100%;
}
p#licenseLevel{font-weight:bolder;color:red;}
span#licenseLevel{font-size:20px;}
span#description{font-size:18px;}

body{
  background: url(/TestRentalMVC/resources/background/silverstoneopacity.png) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
/*         CSS///////////// ///////////////////////*/
</style>
<script>
	$(function() {
		$("#include_nav_no_login").load(
				"/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
		$("#include_nav_login").load(
				"/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
	});
	//     	JavaScript改這個地方///////////////////////////////////////

	// 		JavaScript////////////////////////////////////////////////
</script>
</head>
<body>
	<div class="top">
		<c:choose>
			<c:when test="${empty login_ok}">
				<nav id="include_nav_no_login"></nav>
			</c:when>
			<c:otherwise>
				<nav id="include_nav_login"></nav>
			</c:otherwise>
		</c:choose>
		<article>
			<!--                       HTML改這裡 ////////////////////-->
			<div id="title">
				<p>車種一覽表</p>
			</div>
			<div id="menu">
				<ul id="list">
					<li><a href="showCategoryList.controller">車種</a></li>
					<li><a href="showModelList.controller">車型</a></li>
<!-- 					<li><a href="#">車款</a></li> -->
<!-- 					<li><a href="/TestRentalMVC/index.jsp">回首頁</a></li> -->
				</ul>
			</div>
			<div id="content">
				<c:if test="${not empty no}">
					<h1 >沒有車種</h1>
				</c:if>
				<c:if test="${not empty list}">
				<c:forEach var="list" items="${list}">
				
					<a href="showModelList.controller?modelId=${list.id}">
					<div class="box">
					<div class="pics">
						<img alt="暫時沒圖片" src="/TestRentalMVC/resources/car_category/${list.photo}" title="${list.name}">
					</div>
						<h1>${list.name}</h1><br>
						<p id="licenseLevel">所需駕照等級：<span id="licenseLevel">限 ${list.license_leval}</span> 以上</p><br>
						<span id="description">${list.description}</span><br>
					
					</div>
					</a>
					
					
				
				</c:forEach>
				</c:if>

			</div>


			<!--                       HTML/////////////////////////// -->
		</article>
	</div>
		        <%@ include file='/shared/footer.jsp'%> 
</body>
</html>
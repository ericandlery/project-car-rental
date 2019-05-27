<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:remove var="staff_login_ok" scope="session"/>
<c:remove var="manager_login_ok" scope="session"/>			<!-- 強制登出管理者和門市人員 -->
<c:remove var="login_ok" scope="session"/>
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
        #manager_login{width:1500px;height:700px;margin:auto;color:white;}
        #title{margin-top:200px;width:100%;height:100px;text-align:center;font-size:60px;font-weight:bold;color:#5E5E5E;}
        #login_box{background: rgba(0%,0%,214%,0.1);width:500px;height:200px;margin-right:200px;
                   color:black;display:inline-block;float:right;font-weight:bold;font-size:16px;}
        .form{width:60%;margin-top:50px;display:inline-block;margin-left:100px;}
        #staff_box{background: rgba(0%,0%,214%,0.1);width:500px;height:200px;margin-left:200px;
                    color:black;display:inline-block;float:left;font-weight:bold;font-size:16px;}
        
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
			Jeams租車管理系統
			<div>
				<a href="/TestRentalMVC/index.jsp"><img
					src="/TestRentalMVC/images/home160x160.png"></a> 
			</div>
		</header>
		<nav></nav>
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
		<div id="manager_login">
                <div id="title">門市人員登入&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;管理員登入</div>
                
                <div id="staff_box">
                    <div class="form">
                        <form action="staffLogin.controller" method="post">
                            帳號  <input type="text" name="name"  /><br /><br />				<!-- 記得改回來 -->
                            密碼  <input type="password" name="password"  /><br /><br />
                            <input type="submit" value="登入" /><br>
                            ${staff_wrong}
                        </form>
                    </div>
                </div>
                <div id="login_box">
                    <div class="form">
                        <form action="managerLogin.controller" method="post">
                            帳號  <input type="text" name="name"  /><br /><br />				<!-- 記得改回來 -->
                            密碼  <input type="password" name="password"  /><br /><br />
                            <input type="submit" value="登入" /><br>
                            ${wrong}
                        </form>
                    </div>
                </div>
            </div>
		
<!--                       改這裡 -->
        </article>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
/*         //////////////// */

        div#reg_success{background-image:URL(/TestRentalMVC/images/900x600.jpg);height:500px;width:900px;margin:auto}
        div#reg_success h1{text-align:center;font-family:標楷體;}
/*         ////////////////// */
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
            <div id="reg_success">
                <h1>註冊成功！請等待審核通過才能使用租車服務喔！</h1>
                請再確認您的資料(若有錯誤可至會員專區修改)：<hr /><table>
                <tr><td>姓名</td><td>${login_ok.name}</td></tr>
                <tr><td>E-mail</td><td>${login_ok.email}</td></tr>
                <tr><td>地址</td><td>${login_ok.address}</td></tr>
                <tr><td>身分證字號</td><td>${login_ok.id_card}</td></tr>
                <tr><td>生日</td><td><fmt:formatDate type = "date" value = "${login_ok.birth}" /></td></tr>
                <tr><td>手機</td><td>${login_ok.phone}</td></tr>
                <tr><td>電話</td><td>${login_ok.tel}</td></tr>
                <tr><td>註冊日期</td><td><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${login_ok.registration_date}" /></td></tr>
                <tr><td>會員狀態</td><td>${login_ok.mem_state}</td></tr>
                </table>
            </div>
            <div id="home"></div>
        </article>
    </div>
         <%@ include file='/shared/footer.jsp'%> 
</body>
</html>
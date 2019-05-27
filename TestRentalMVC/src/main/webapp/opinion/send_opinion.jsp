<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:remove var="staff_login_ok" scope="session"/>
<c:remove var="manager_login_ok" scope="session" />			<!-- 強制登出管理者和門市人員 -->
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
/*         h1{text-align:center;} */
/*         #body{margin-left:600px;width:800px;background-color:lime;font-weight:bolder;height:800px;} */
/*         form{font-size:2em;} */
/*         input{margin:auto;} */
/*         .span{color:red;} */
        #outer{height:850px;width:1170px;}
        #body h1{text-align:center;font-family:標楷體;}
        #body{background-image:URL(/TestRentalMVC/images/900x1000.jpg);height:900px;width:900px;margin:auto}
        form{font-size:2em;}
        input{margin:auto;}
        .span{color:red;}
        
/*         CSS///////////// ///////////////////////*/
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
<!--                       HTML改這裡 ////////////////////-->
<div id="outer">
		<div id="body">
			<h1>歡迎使用意見信箱</h1>
			<form action="addNewOpinion.controller" method="post">
			<fieldset>
				<legend>請填寫您的意見</legend>
				大名：<input type="text" name="name" value="${login_ok.name}">&nbsp;<Span class="span">${errors.name}</Span><br><br>
				信箱：<input type="email" name="email" value="${login_ok.email}">&nbsp;<Span class="span">${errors.email}</Span><br><br>
				標題：<input type="text" name="title">&nbsp;<Span class="span">${errors.title}</Span><br><br>
				內文：<textarea rows="10" cols="40" name="text"></textarea>&nbsp;<Span class="span">${errors.text}</Span><br><br>
				<input type="submit" value="按此送出"> <input type="reset" value="重新填寫">
			</fieldset>
			</form>
		</div>
		</div>
<!--                       HTML/////////////////////////// -->
        </article>
    </div>
         <%@ include file='/shared/footer.jsp'%> 
</body>
</html>
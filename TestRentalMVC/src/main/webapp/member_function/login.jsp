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
/*         //////////////// */
        .top{height:800px}
        div#login{background-image:URL(/TestRentalMVC/images/900x800.jpg);border:solid #636363 2px;width:900px;
                  height:500px;margin-top:100px;margin-left:400px;font-weight:bold;}
        div#login h1{font-weight:bold;font-size:4em;color:#636363;}          
        fieldset{background-color:gold;width:500px;height:250px;background: rgba(224%,146%,0%,0.3);}
        div#form{background-color:gold;width:250px;overflow:auto;}
        div#form input{float:right;}
        div#form span{float:left}

        #forgetpassword{
        	color:red;
        	font-size:small;
        }
/*         /////////////////// */
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
			<div id="login">
                <h1>會員登入</h1>
                <br>
                <br>
                <fieldset>
                    <legend>請輸入會員資料</legend>
                    <form action="memberLogin.controller" method="post"><div id="form">
                        <span>Email</span><input type="email" name="email" /><br />		<!-- 記得改回來 -->
                        <span>密碼</span><input type="password" name="password" /><br />			<!-- 記得改回來 -->
                        </div>${login_failed}
                        <hr />
                        <input type="submit" value="送出"/>
                        <input type="reset" value="重設" />
                    </form>
              		<a href="#" id="forgetpassword">忘記密碼?</a>
                </fieldset>
            </div>
        </article>
    </div>
         <%@ include file='/shared/footer.jsp'%> 
</body>
</html>
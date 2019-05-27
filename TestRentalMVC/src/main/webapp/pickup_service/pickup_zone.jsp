<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%-- <c:remove var="staff_login_ok" scope="session"/> --%>
<%-- <c:remove var="manager_login_ok" scope="session" />			<!-- 強制登出管理者和門市人員 --> --%>
<c:if test="${empty login_ok}">
<c:redirect url="/member_function/login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>接送專區</title>
    <link rel="shortcut icon" href="../images/logo16x16.ico">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/header_footer.css">
    <style>
/*         CSS改這個地方//////////////////////////// */
        #body {
            background-color: coral;
            height: 600px;
            margin: auto;
            width: 1600px;
            margin: auto;
            overflow: auto;
        }

        #title {
            text-align: center;
            font-size: 3em;
            overflow: auto;
        }

        .box {
            width: 300px;
            height: 300px;
            background-color: mediumaquamarine;
            display: inline-block;
            margin: 45px;
        }

            .box p {
                font-size: 3em;
                text-align: center;
                background-color: powderblue;
            }
        
        
/*         CSS///////////// ///////////////////////*/
    </style>
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/nav_with_login.jsp");
      });
//     	JavaScript改這個地方///////////////////////////////////////


// 		JavaScript////////////////////////////////////////////////
    </script>
</head>
<body>
    <div>
<%--         <%@ include file='/shared/header.jsp'%> --%>
		<header>
            ProjectRental
        </header>
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
		<div id="body">
                <h1 id="title">接送服務</h1>
                <a href="/TestRentalMVC/pickup_service/airfield/airfield_service.jsp"><div class="box"><p>機場接送</p></div></a>
                <div class="box"><p>TEST</p></div>
                <div class="box"><p>TEST</p></div>
                <div class="box"><p>TEST</p></div>

            </div>
		
		
<!--                       HTML/////////////////////////// -->
        </article>
<%--         <%@ include file='/shared/footer.jsp'%> --%>
    </div>
<%-- <h3>path=<%=application.getRealPath("/")%></h3>     --%>
    
    
</body>
</html>
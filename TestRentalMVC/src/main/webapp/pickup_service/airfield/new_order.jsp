<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:remove var="staff_login_ok" scope="session"/>
<c:remove var="manager_login_ok" scope="session" />			<!-- 強制登出管理者和門市人員 -->
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
/*         CSS改這個地方//////////////////////////// */
 #body{background-image:URL(/TestRentalMVC/images/900x600.jpg);height:500px;width:900px;margin:auto}
        #body h1{text-align:center;font-family:標楷體;}


/*         #body { */
/*             background-color: coral; */
/*             height: 600px; */
/*             margin: auto; */
/*             width: 1400px; */
/*             margin: auto; */
/*             overflow: auto; */
/*         } */

/*         #title { */
/*             text-align: center; */
/*             font-size: 3em; */
/*             overflow: auto; */
/*         } */

        table, tr, th, td {
            border: solid black 10px;
            border-collapse: collapse;
            margin: auto;
        }
        
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
<!--                       HTML改這裡 ////////////////////-->
		<div id="body">
<!--                 <div id="title">接送服務下單成功</div> -->
<!--                 <h5>請至會員專區查看您的訂單</h5> -->
                <h1>接送服務下單成功</h1>
                <h1>請至會員專區查看您的訂單</h1>
            </div>
		
<!--                       HTML/////////////////////////// -->
        </article>
          
    </div>
<%-- <h3>path=<%=application.getRealPath("/")%></h3>     --%>
    
    <%@ include file='/shared/footer.jsp'%>
</body>
</html>
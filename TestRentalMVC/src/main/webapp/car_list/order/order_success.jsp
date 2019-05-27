<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:remove var="staff_login_ok" scope="session"/>
<c:remove var="manager_login_ok" scope="session" />			<!-- 強制登出管理者和門市人員 -->
<c:remove var="order" scope="session"/>						<!-- 移除購物車物件 -->
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

    <style>
/*         CSS改這個地方//////////////////////////// */
        .top{height:700px;}
         #outer{border:solid black 2px;height:400px;width:800px;margin:auto;margin-top:20px;
                background-image:URL(/TestRentalMVC/images/900x600.jpg)} 
         #title{text-align:center;font-size:3em;background: rgba(100%,100%,100%,0.7);
                font-weight:bold;font-family:標楷體;color:#545454} 
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
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
      });

    function goback(){
    	location.href="/TestRentalMVC/index.jsp";
    }
    
    </script>
</head>
<body onclick="goback()">
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
<!--                       HTML改這裡 ////////////////////-->
		<div id="outer">
			<div><p id="title">您已經完成訂單</p><br><p>請至會員專區查詢您的訂單紀錄</p></div>
		</div>

			<!--                       HTML/////////////////////////// -->
        </article>
     
    </div>
<%-- <h3>path=<%=application.getRealPath("/")%></h3>     --%>
    
        <%@ include file='/shared/footer.jsp'%> 
</body>
</html>
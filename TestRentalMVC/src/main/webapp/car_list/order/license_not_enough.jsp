<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:remove var="staff_login_ok" scope="session"/>
    <c:remove var="manager_login_ok" scope="session"/>			<!-- 強制登出管理者和門市人員 -->
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


<link rel="stylesheet" href="/TestRentalMVC/resources/css/jquery-ui.css">
  <script src="/TestRentalMVC/resources/js/jquery-ui.js"></script>
<style>
body{
  background: url(/TestRentalMVC/resources/background/silverstoneopacity.png) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
</style>
<script>
$(function(){
    $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
    $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
  });



$(document).ready(function(){
	$( "#dialog-message" ).dialog({
		  width: 800
		});
	
	$( "#dialog-message" ).dialog({
	      modal: true,
	      buttons: {
	        Ok: function() {
	          $( this ).dialog( "close" );
	          location.href="showCategoryList.controller";
	        }
	      }
	    });
});

function goback(){
	location.href="/TestRentalMVC/car_list/car_list_index.jsp";
}
</script>
<style>
.top{height:700px;}
</style>

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
</div>
	

<div>
		<div id="dialog-message" title="等級不足">
			<span class="ui-icon ui-icon-circle-check"
				style="float: left; margin: 0 7px 50px 0;"></span>
			<h1>您的駕照等級不夠，請至車種選單選擇其他車種</h1>
</div>
		</div>

 <%@ include file='/shared/footer.jsp'%>
 
</body>
</html>
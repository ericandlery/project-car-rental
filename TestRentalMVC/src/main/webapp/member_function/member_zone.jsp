<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
/*         改這個地方 */
        .top{height:950px;}
        #member_zone{height:700px;width:700px;overflow:auto;margin-bottom:-10px;margin-left:300px;
                     background-color:#FFF3DE;width:1170px;height:700px;margin-top:50px;} */
        #title{text-align:center;}
        .box{background-color:#FFC9C9;width:180px;height:180px;border-radius:20px;overflow:hidden;}
        #up{position:relative;left:50px;top:50px;display:inline-block;margin-left:10px;}
        #down{position:relative;left:50px;top:150px;display:inline-block;margin-left:10px;}
        div.box span{border-radius:20px 20px 0px 0px;background:-webkit-radial-gradient(circle,#8282FF,#3030FF);display:block;
                     margin:auto;text-align:center;font-size:20px;font-weight:bold;color:white;}
        p#state_column{font-size: 3em;font-weight:bold;color:#636363;font-family:標楷體;text-align: center;}
        .img{height:100%;width:100%;}
/*         改這個地方 */
    </style>
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
        
        $.getJSON("showMemState.controller",function(data){
        	$("#state").text(data);
        });

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
<!--                       改這裡 -->
		<div id="member_zone">
                <div id="title"> <br><p id="state_column">會員專區<br>狀態：<span id="state"></span> 駕照等級：${login_ok.license_leval}</p></div>
                <a href="/TestRentalMVC/member_function/inquire_orders.jsp"><div class="box" id="up"><span>查詢訂單</span><img src="/TestRentalMVC/resources/manager_icons/m_order_list.jpg" class="img"></div></a>
                <a href="/TestRentalMVC/member_function/wallet.jsp"><div class="box" id="up"><span>電子錢包</span><img src="/TestRentalMVC/resources/manager_icons/Wallet-icon.png" class="img"></div></a>
                <a href="/TestRentalMVC/member_function/member_update.jsp"><div class="box" id="up"><span>更新會員資料</span><img src="/TestRentalMVC/resources/manager_icons/m_update.png" class="img"></div></a>
<!--                 <a href="/TestRentalMVC/member_function/member_friend.jsp"><div class="box" id="up"><span>好友區塊</span><img src="/TestRentalMVC/resources/manager_icons/m_order_list.jpg" class="img"></div></a> -->
                <a href="/TestRentalMVC/member_function/pickup/check_pickup_order.jsp"><div class="box" id="up"><span>查詢接送訂單</span><img src="/TestRentalMVC/resources/manager_icons/m_airdield.jpg" class="img"></div></a><br>
                <a href="/TestRentalMVC/member_function/between_opinion.jsp"><div class="box" id="down"><span>意見回覆</span><img src="/TestRentalMVC/resources/manager_icons/m_opinion.png" class="img"></div></a>
               
            </div>
            
<!--                       改這裡 -->
        </article>
        
    </div>
    <%@ include file='/shared/footer.jsp'%> 
</body>
</html>
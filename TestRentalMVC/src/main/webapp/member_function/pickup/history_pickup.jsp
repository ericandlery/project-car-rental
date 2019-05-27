<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
    <style>
/*         CSS改這個地方//////////////////////////// */
/*         #outer{height:700px;width:1400px;background-color:burlywood;overflow:auto;margin:auto;} */
         .top{height:900px;}
        #outer{height:700px;width:1400px;overflow:auto;margin:auto;}
       .menu{background-color:deeppink;height:250px;width:250px;float:right;margin-right:250px;margin-top:100px;}
       .title{background-color:mistyrose;text-align:center;font-size:2em;}
       #order{background-color:beige;width:500px;height:600px;float:left;margin-left:100px;margin-top:10px;overflow:auto;}
       #title{background-color:white;font-size:3em;text-align:center;}
        #no_order{font-size:2em;}
        table,tr,td{border:solid black 2px;border-collapse:collapse;text-align:center;}
        #table{margin-left:50px;height:600px;}
        #bottom{float:right;margin-right:30px;clear:both;}
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
                <div class="menu"><p class="title">查詢歷史訂單記錄</p></div>
                <div id="order">
                    <p id="title">您過去的接送服務訂單</p>
                    <c:if test="${not empty no_order}"><span id="no_order">${no_order}</span></c:if>
                    <c:if test="${not empty history_order}">
                    	<div id="table">
	                    <table>
	                    	<c:forEach var="history_order" items="${history_order}">
	                    	<tr><td colspan="2">&nbsp;</td></tr>
	                    	<tr><td>訂單編號</td><td>${history_order.id}</td></tr>
	                    	<tr><td>接送車輛</td><td>${history_order.car_num}</td></tr>
	                    	<tr><td>接送司機</td><td>${history_order.driver_id}</td></tr>
	                    	<tr><td>起點</td><td>${history_order.start_location}</td></tr>
	                    	<tr><td>終點</td><td>${history_order.end_location}</td></tr>
	                    	<tr><td>日期</td><td><fmt:formatDate type="date" value="${history_order.start_date}"/></td></tr>
	                    	<tr><td>時間</td><td><fmt:formatDate type="time" value="${history_order.start_time}"/></td></tr>
	                    	<tr><td>價錢</td><td>${history_order.price}</td></tr>
	                    	<tr><td>訂單狀態</td><td>${history_order.order_state}</td></tr>
	                    	<tr><td>下單時間</td><td>${history_order.order_s_datetime}</td></tr>
	                    	<tr><td>付款方式</td><td>${history_order.payment}</td></tr>
	                    	</c:forEach>
	                    </table><br>
	                    </div>
                    </c:if>
                    
                </div>
					<div id="bottom">
                 	<a href="/TestRentalMVC/member_function/pickup/check_pickup_order.jsp" ><img src="/TestRentalMVC/images/backpage120x70.png"></a>
                 	</div>

            </div>
		
<!--                       HTML/////////////////////////// -->
        </article>
      
    </div>
        <%@ include file='/shared/footer.jsp'%> 
</body>
</html>
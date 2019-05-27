<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty manager_login_ok}">
<c:redirect url="/manager_zone/manager_login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>所有接送訂單</title>
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
        #manager{background: rgba(255%,18%,18%,0.3);width:1500px;height:700px;margin:auto;color:black;overflow:auto;}
        #title{height:100px;text-align:center;font-size:4em;}
        table{margin-left:50px;margin-top:100px;}
        table,tr,th,td{border:solid black 2px;border-collapse:collapse;padding:2px;font-size:20px;}
        
        #bottom{float:right;margin-right:30px;clear:both;}
/*         改這個地方 */
    </style>
    <script>
    </script>
</head>
<body>
    <div><header>
			所有接送訂單
			<div>
				<a href="/TestRentalMVC/manager_zone/manager_zone.jsp"><img
					src="/TestRentalMVC/images/home160x160.png"></a> <span><a
					href="/TestRentalMVC/index.jsp"><img
						src="/TestRentalMVC/images/logout180x130.png"></a></span>
			</div>
		</header>
        <nav></nav>
        <article>
<!--                       改這裡 -->
		<div id="manager">
<!--                 <div id="title"><a href="/TestRentalMVC/manager_zone/manager_zone.jsp">管理者頁面</a>=><a href="/TestRentalMVC/manager_zone/pickup_manager/pickup_menu.jsp">接送服務管理頁面</a>=>所有接送訂單</div> -->
                <c:if test="${not empty no_list}"><h1>${no_list}</h1></c:if>
                <c:if test="${not empty pickup_list}">
                	<table>
                		<tr><th>訂單編號</th><th>會員編號</th><th>車牌號碼</th><th>司機編號</th><th>起點</th><th>終點</th><th>接送日期</th>
                		<th>接送時間</th><th>價錢</th><th>訂單狀態</th><th>下單日期</th><th>結束日期</th><th>付款方式</th></tr>
                		<c:forEach var="order" items="${pickup_list}">
                			<tr><td>${order.id}</td><td>${order.mem_id}</td><td>${order.car_num}</td><td>${order.driver_id}</td>
                			<td>${order.start_location}</td><td>${order.end_location}</td>
                			<td><fmt:formatDate type="date" value="${order.start_date}"/></td><td><fmt:formatDate type="time" value="${order.start_time}"/></td>
                			<td>${order.price}</td><td>${order.order_state}</td><td>${order.order_s_datetime}</td>
                			<td>${order.oder_e_datetime}</td><td>${order.payment}</td></tr>
                		</c:forEach>
                	</table>
                </c:if>
            </div>
		
		<div id="bottom"><a href="/TestRentalMVC/manager_zone/pickup_manager/pickup_menu.jsp">
                <img src="/TestRentalMVC/images/backpage120x70.png"></a></div>
		
		
<!--                       改這裡 -->
        </article>
    </div>
</body>
</html>
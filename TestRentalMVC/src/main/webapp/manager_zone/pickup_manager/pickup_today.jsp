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
    <title>今日接送訂單</title>
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
        #manager{background: rgba(255%,18%,18%,0.3);width:1500px;height:1000px;margin:auto;color:black;overflow:auto;}
        #title{height:100px;text-align:center;font-size:4em;}
        table,th,tr,td{border:solid white 2px;border-collapse:collapse;padding:4px;}
        td{font-size:30px;}
        th{font-size:3em;}
        #names{font-size:3em;}
        #bottom{float:right;margin-right:30px;clear:both;}
/*         改這個地方 */
    </style>
    <script>
    function dealOrder(event){
    	var r=confirm("確定要完成這筆訂單嗎？");
    	if(r==true){
    		return;
    	}else{
    		event.preventDefault();
    		return;
    	}
    }
    
    </script>
</head>
<body>
    <div>
    <header>
			今天的接送服務訂單
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
                <div id="title"></div>
                <!-- 今天訂單 -->
                <table>
<!--                 	<tr><th colspan="12">今天的接送服務訂單</th></tr> -->
                	<c:if test="${not empty no_order}"><tr><td>${no_order}</td></tr></c:if>
                	<c:if test="${not empty today_order}">
                	<tr><td>訂單編號</td><td>客戶會員編號</td><td>車牌號碼</td><td>司機編號</td><td>起點</td>
                	<td>終點</td><td>日期</td><td>時間</td><td>價格</td><td>訂單狀態</td><td>下單日期</td><td>付款方式</td></tr>
                	<c:forEach var="order" items="${today_order}">
                	<tr><td>${order.id}</td><td>${order.mem_id}</td><td>${order.car_num}</td><td>${order.driver_id}</td><td>${order.start_location}</td>
                	<td>${order.end_location}</td><td><fmt:formatDate type="date" value="${order.start_date}"/></td><td><fmt:formatDate type="time" value="${order.start_time}"/></td><td>${order.price}</td><td>${order.order_state}</td>
                	<td>${order.order_s_datetime}</td><td>${order.payment}</td><td>
                	<form action="finishPickupOrder.controller" method="post">
                	<input name="orderId" type="text" value="${order.id}" style="display:none;">
                	<input type="submit" value="接送完成" style="color:black;" onclick="dealOrder(event)">	<!-- 接送完成，傳入訂單編號做處理 -->
                	</form></td></tr>
                	</c:forEach>
                	</c:if>
                </table><br>
                <c:if test="${not empty driver_names}">
                <p id="names">請<c:forEach var="names" items="${driver_names}">${names}&nbsp;</c:forEach>這${drivers}位司機在接送完成後處理手續</p>
                </c:if>
                <hr>
                <!-- 明天訂單 -->
                <table>
                	<tr><th colspan="12">明天的接送服務訂單</th></tr>
                	<c:if test="${not empty no_order2}"><tr><td>${no_order2}</td></tr></c:if>
                	<c:if test="${not empty today_order2}">
                	<tr><td>訂單編號</td><td>客戶會員編號</td><td>車牌號碼</td><td>司機編號</td><td>起點</td>
                	<td>終點</td><td>日期</td><td>時間</td><td>價格</td><td>訂單狀態</td><td>下單日期</td><td>付款方式</td></tr>
                	<c:forEach var="order2" items="${today_order2}">
                	<tr><td>${order2.id}</td><td>${order2.mem_id}</td><td>${order2.car_num}</td><td>${order2.driver_id}</td><td>${order2.start_location}</td>
                	<td>${order2.end_location}</td><td><fmt:formatDate type="date" value="${order2.start_date}"/></td><td><fmt:formatDate type="time" value="${order2.start_time}"/></td><td>${order2.price}</td><td>${order2.order_state}</td>
                	<td>${order2.order_s_datetime}</td><td>${order2.payment}</td></tr>
                	</c:forEach>
                	</c:if>
                </table><br>
                <c:if test="${not empty driver_names2}">
                <p id="names">請提醒<c:forEach var="names2" items="${driver_names2}">${names2}&nbsp;</c:forEach>這${drivers2}位司機做準備</p>
                </c:if>
                <hr>
                <!-- 未處理訂單 -->
                <table>
                	<tr><th colspan="12">尚未處理的訂單</th></tr>
                	<c:if test="${not empty no_order3}"><tr><td>${no_order3}</td></tr></c:if>
                	<c:if test="${not empty today_order3}">
                	<tr><td>訂單編號</td><td>客戶會員編號</td><td>車牌號碼</td><td>司機編號</td><td>起點</td>
                	<td>終點</td><td>日期</td><td>時間</td><td>價格</td><td>訂單狀態</td><td>下單日期</td><td>付款方式</td></tr>
                	<c:forEach var="order3" items="${today_order3}">
                	<tr><td>${order3.id}</td><td>${order3.mem_id}</td><td>${order3.car_num}</td><td>${order3.driver_id}</td><td>${order3.start_location}</td>
                	<td>${order3.end_location}</td><td><fmt:formatDate type="date" value="${order3.start_date}"/></td><td><fmt:formatDate type="time" value="${order3.start_time}"/></td><td>${order3.price}</td><td>${order3.order_state}</td>
                	<td>${order3.order_s_datetime}</td><td>${order3.payment}</td><td>
                	<form action="finishPickupOrder.controller" method="post">
                	<input name="orderId" type="text" value="${order3.id}" style="display:none;">
                	<input type="submit" value="接送完成" style="color:black;" onclick="dealOrder(event)">	<!-- 接送完成，傳入訂單編號做處理 -->
                	</form></td></tr>
                	</c:forEach>
                	</c:if>
                </table><br>
                <c:if test="${not empty driver_names3}">
                <p id="names">請提醒<c:forEach var="names3" items="${driver_names3}">${names3}&nbsp;</c:forEach>這${drivers3}位司機趕快處理！</p>
                </c:if>
                <hr>
            </div>
		
		
		<div id="bottom"><a href="/TestRentalMVC/manager_zone/pickup_manager/pickup_menu.jsp">
                <img src="/TestRentalMVC/images/backpage120x70.png"></a></div>
		
		<!-- 隱藏區塊 -->
<!--                       改這裡 -->
        </article>
    </div>
</body>
</html>
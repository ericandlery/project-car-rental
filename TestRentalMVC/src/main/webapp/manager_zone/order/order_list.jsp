<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty manager_login_ok}">
	<c:redirect url="/manager_zone/manager_login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>所有訂單</title>
<link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/TestRentalMVC/resources/css/manager_hf2.css">
<style>
/*         改這個地方 */
#out {
	width: 1400px;
	height: 800px;
	background: rgba(255%,18%,18%,0.3);
	margin: auto;
	color: black;
	overflow: auto;
}

table, thead, tbody, tfoot, tr, th, td {
	border: solid white 2px;
	border-collapse: collapse;
	margin: auto;
	padding: 10px;
}

#menu {
	background-color: Highlight;
	width: 200px;
	height: 100px;
	float: right;
	text-align: center;
	padding-top: 20px;
	font-size: 2em;
}

#title {
	text-align: center;
	display: block;
	font-size: 3em;
}

form {
	color: black;
}
/*         改這個地方 */
</style>
<script>
	
</script>
</head>
<body>
	<div>
		<header>
			所有訂單
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
			<div id="out">
<!-- 				<span id="title">所有訂單</span> -->
				<form action="selectAllOrderOrder.controller" method="get">
					<select name="order">
						<option value="id">訂單邊號</option>
						<option value="memid">會員編號</option>
						<option value="car_num">車牌號碼</option>
						<option value="start_branch_name">取車據點</option>
						<option value="end_branch_name">還車據點</option>
						<option value="start_date">借車日期</option>
						<option value="end_date">還車日期</option>
<!-- 						<option value="remark">註解</option> -->
						<option value="price">總價錢</option>
						<option value="order_date">下單日期</option>
						<option value="order_state">訂單狀態</option>
						<option value="code">優惠卷代碼</option>
						<option value="trip_id">套裝行程</option>
					</select> <select name="sort">
						<option value="asc">小到大</option>
						<option value="desc">大到小</option>
					</select> <input type="submit" value="排序">
				</form>
				<c:choose>
					<c:when test="${empty order_list}">
						<h1>${no_order}</h1>
					</c:when>
					<c:otherwise>
						<table>
							<tr>
								<th>訂單編號</th>
								<th>會員編號</th>
								<th>車牌號碼</th>
								<th>取車據點</th>
								<th>還車據點</th>
								<th>借車日期</th>
								<th>還車日期</th>
								<th>註解</th>
								<th>總價錢</th>
								<th>下單日期</th>
								<th>訂單狀態</th>
								<th>優惠卷代碼</th>
								<th>套裝行程</th>
							</tr>
							<c:forEach var="o" items="${order_list}">
								<tr>
									<td>${o.id}</td>
									<td>${o.memid}</td>
									<td>${o.car_num}</td>
									<td>${o.start_branch_name}</td>
									<td>${o.end_branch_name}</td>
									<td><fmt:formatDate type = "date" value = "${o.start_date}" /></td>
									<td><fmt:formatDate type = "date" value = "${o.end_date}" /></td>
									<td>${o.remark}</td>
									<td>${o.price}</td>
									<td>${o.order_date}</td>
									<td>${o.order_state}</td>
									<td>${o.code}</td>
									<td>${o.trip_id}</td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</div>

			<!--                       改這裡 -->
		</article>
	</div>
</body>
</html>
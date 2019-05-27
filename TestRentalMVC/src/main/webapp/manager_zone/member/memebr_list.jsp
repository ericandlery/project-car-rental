<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty manager_login_ok}">
	<c:redirect url="/manager_zone/manager_login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>會員名單</title>
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
	background: rgba(255%,18%,18%,0.2);
	margin: auto;
	color: white;
	overflow: auto;
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

table.memberTable {
	font-family: "Arial Black", Gadget, sans-serif;
	border: 3px solid #1F30A4;
	background-color: #A9EEDA;
	width: 100%;
	text-align: center;
	border-collapse: collapse;
}

table.memberTable td, table.memberTable th {
	border: 4px solid #69A0AA;
	padding: 8px 6px;
}

table.memberTable tbody td {
	font-size: 13px;
	font-weight: bold;
	color: #1F16A8;
}

table.memberTable tr:nth-child(even) {
	background: #D0E4F5;
}

table.memberTable thead {
	background: #207EBB;
	background: -moz-linear-gradient(top, #589ecc 0%, #368bc1 66%, #207EBB 100%);
	background: -webkit-linear-gradient(top, #589ecc 0%, #368bc1 66%, #207EBB 100%);
	background: linear-gradient(to bottom, #589ecc 0%, #368bc1 66%, #207EBB 100%);
	border-bottom: 2px solid #444444;
}

table.memberTable thead th {
	font-size: 16px;
	font-weight: bold;
	color: #FFFFFF;
	text-align: center;
	border-left: 2px solid #D0E4F5;
}

table.memberTable thead th:first-child {
	border-left: none;
}

table.memberTable tfoot {
	font-size: 14px;
	font-weight: normal;
	color: #FFFFFF;
	background: #2D3236;
	background: -moz-linear-gradient(top, #616568 0%, #42464a 66%, #2D3236 100%);
	background: -webkit-linear-gradient(top, #616568 0%, #42464a 66%, #2D3236 100%);
	background: linear-gradient(to bottom, #616568 0%, #42464a 66%, #2D3236 100%);
	border-top: 2px solid #444444;
}

table.memberTable tfoot td {
	font-size: 14px;
}

table.memberTable tfoot .links {
	text-align: right;
}

table.memberTable tfoot .links a {
	display: inline-block;
	background: #1C6EA4;
	color: #FFFFFF;
	padding: 2px 8px;
	border-radius: 5px;
}
/*         改這個地方 */
</style>
<script>
	
</script>
</head>
<body>
	<div>
		<header>
			會員名單
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
<!-- 				<span id="title"></span> -->
				<form action="selectAllMembersOrderById.controller" method="get">
					<select name="order">
						<option value="id">編號</option>
						<option value="id_card">身分證字號</option>
						<option value="name">名字</option>
						<option value="email">電子信箱</option>
						<option value="address">地址</option>
						<option value="birth">生日</option>
						<option value="phone">手機</option>
						<option value="tel">電話</option>
						<option value="wallet">電子錢包</option>
<!-- 						<option value="bonuspoint">紅利點數</option> -->
<!-- 						<option value="subscription">訂閱服務</option> -->
						<option value="mem_state">會員狀態</option>
						<option value="registration_date">註冊日期</option>
						<option value="license_num">駕照號碼</option>
						<option value="license_leval">駕照級別</option>
					</select> <select name="sort">
						<option value="asc">小到大</option>
						<option value="desc">大到小</option>
					</select> <input type="submit" value="排序">
				</form>
				<c:choose>
					<c:when test="${empty member_list}">
						<h1>${no_member}</h1>
					</c:when>
					<c:otherwise>
						<table class="memberTable">
                            <thead>
                                <tr>
                                    <th>編號</th>
                                    <th>身分證字號</th>
                                    <th>名字</th>
                                    <th>電子信箱</th>
<!--                                     <th>密碼</th> -->
                                    <th>地址</th>
                                    <th>生日</th>
                                    <th>手機</th>
                                    <th>電話</th>
                                    <th>電子錢包</th>
<!--                                     <th>紅利點數</th> -->
                                    <th>照片</th>
<!--                                     <th>訂閱服務</th> -->
                                    <th>會員狀態</th>
                                    <th>註冊日期</th>
                                    <th>駕照號碼</th>
                                    <th>駕照級別</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="14"></td>
                                </tr>
                            </tfoot>
                            <tbody>
                                <c:forEach var="m" items="${member_list}">
                                    <tr>
                                        <td>${m.id}</td>
                                        <td>${m.id_card}</td>
                                        <td>${m.name}</td>
                                        <td>${m.email}</td>
<%--                                         <td>${m.password}</td> --%>
                                        <td>${m.address}</td>
                                        <td><fmt:formatDate type = "date" value = "${m.birth}" /></td>
                                        <td>${m.phone}</td>
                                        <td>${m.tel}</td>
                                        <td>${m.wallet}</td>
<%--                                         <td>${m.bonuspoint}</td> --%>
                                        <td><img src="/TestRentalMVC/member_photo/${m.mem_photo}" height="100" width="200"></td>
<%--                                         <td>${m.subscription}</td> --%>
                                        <td>${m.mem_state}</td>
                                        <td>${m.registration_date}</td>
                                        <td>${m.license_num}</td>
                                        <td>${m.license_leval}</td>
                                    </tr>
                                </c:forEach>
                            <tbody>
                        </table>
					</c:otherwise>
				</c:choose>
			</div>

			<!--                       改這裡 -->
		</article>
	</div>
</body>
</html>
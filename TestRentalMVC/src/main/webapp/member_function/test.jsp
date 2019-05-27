<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../images/logo16x16.ico">
</head>
<body>
<%-- <%@ include file='/shared/header.jsp'%> --%>
	<form action="bonuspoint.controller" method="post">
		<table>
		<tr>
			<td><input type="submit" value="測試紅利點數"></td>
			<td><span class="error">${updateBonues}</span></td>
		</tr>
		<tr>
			<td>測試優惠卷<input type="text" value=""></td>
			<td><input type="text" value="Total Coupon! "></td>
		</tr>
		</table>
	</form>
<%-- 	<%@ include file='/shared/footer.jsp'%> --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- 	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/header1.css"> -->
<style>

       
</style>
<script>
	$(function() {
		$("#include_nav_no_login").load(
				"/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
		$("#include_nav_login").load(
				"/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
	});
</script>
</head>
<body>
	<div>
		<c:choose>
			<c:when test="${empty login_ok}">
				<nav id="include_nav_no_login"></nav>
			</c:when>
			<c:otherwise>
				<nav id="include_nav_login"></nav>
			</c:otherwise>
		</c:choose>
		<article>
			<!--                       改這裡 -->
		
			<div class="container bg-primary">
				<span>${error_model}${error_category}{error_insert}${error_show}</span>
				<div class="row">
					<c:if test="${not empty select}">
						<h2>所有車型清單</h2>
						<table class="table">
							<thead>
								<tr>
									<td>編號</td>
									<td>車種</td>
									<td>名稱</td>
									<td>CC數</td>
									<td>尺寸(長/寬/高)</td>
									<td>可乘人數</td>
									<td>可容納行李(大/小)</td>
									<td>圖片</td>
									<td>敘述</td>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="row" items="${select}">
									<tr>
										<td>${row.id}</td>
										<td>${row.category.name}</td>
										<td>${row.name}</td>
										<td>${row.cc}</td>
										<td>${row.size_l}/${row.size_w}/${row.size_h}</td>
										<td>${row.seat}</td>
										<td>${row.box_big}/${row.box_small}</td>
										<td>${row.photo}</td>
										<td>${row.description}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
				<!-- row -->
				<div class="row">
					<form class="form" action="NewModel.controller" method="GET">
						<div class="form-group">
							<label for="category">category:</label> 
							<select class="custom-select" id="category" name="category">
								<option selected>Choose...</option>
								<c:forEach var="bean" items="${category}">
									<option value="${bean.id}">${bean.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="name">name:</label> 
							<input type="text" class="form-control" id="name" name="name">
						</div>
						<div class="form-group">
							<label for="cc">cc:</label> 
							<input type="text" class="form-control" id="cc" name="cc">
						</div>
						<div class="form-group">
							<label for="size_l">長:</label> 
							<input type="text" class="form-control" id="size_l" name="size_l">
						</div>
						<div class="form-group">
							<label for="size_w">寬:</label> 
							<input type="text" class="form-control" id="size_w" name="size_w">
						</div>
						<div class="form-group">
							<label for="size_h">高:</label> 
							<input type="text" class="form-control" id="size_h" name="size_h">
						</div>
						<div class="form-group">
							<label for="seat">seat:</label> 
							<input type="text" class="form-control" id="seat" name="seat">
						</div>
						<div class="form-group">
							<label for="box_big">box大:</label> 
							<input type="text" class="form-control" id="box_big" name="box_big">
						</div>
						<div class="form-group">
							<label for="box_small">box小:</label> 
							<input type="text" class="form-control" id="box_small" name="box_small">
						</div>
						<textarea rows=4 cols=54 name="description">
如果還有額外需要注意的地方，請您告訴我們，謝謝！ 
						</textarea>
						<input type="submit" class="btn btn-default">Submit</input>
					</form>




				</div>
			</div>
			
			<!-- container -->
			<!--                       改這裡 -->
		</article>
	</div>
 		<%@ include file='/shared/footer.jsp'%> 
</body>
</html>
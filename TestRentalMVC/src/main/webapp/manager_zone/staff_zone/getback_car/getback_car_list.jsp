<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty staff_login_ok}">
<c:redirect url="/manager_zone/manager_login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>歡迎來到ProjectRental</title>
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
        #manager{background: rgba(255%,18%,18%,0.3);width:1500px;height:700px;margin:auto;color:white;}
        #title{height:100px;text-align:center;font-size:4em;}
        .box{background-color:khaki;height:550px;width:450px;display:inline-block;margin:20px;;float:left;color:black;}
        .boxTitle{background-color:chartreuse;display:block;font-size:3em;text-align:center;color:black;}
        table,tr,th,td{Border:solid black 2px;Border-collapse:collapse;}
        table{margin:auto;}
/*         改這個地方 */
    </style>
    <script>
	    $(document).ready(function(){
			$("#futureSubmit").click(function(event){
				event.preventDefault();
				var b=confirm("這不是今天的訂單，確定要現在處理嗎？(價錢維持不變)");
				if(b==true){
					$("#futureForm").submit();
				}else if(b==false){
					
				}
			});
			
			$("#todaySubmit").click(function(){
				alert("已完成還車手續");
			});
		});
    </script>
</head>
<body>
    <div>
    <header>
			還車頁面
			<div>
				<a href="/TestRentalMVC/manager_zone/manager_zone.jsp"><img
					src="/TestRentalMVC/images/home160x160.png"></a> <span><a
					href="/TestRentalMVC/index.jsp"><img
						src="/TestRentalMVC/images/logout180x130.png"></a></span>
			</div>
		</header>
        <nav> </nav>
        <article>
<!--                       改這裡 -->
		<div id="manager">
                <div id="title"><a href="/TestRentalMVC/manager_zone/staff_zone/staff_zone.jsp">主選單</a>>>${staff_login_ok.branch_name}門市還車頁面</div>
                <div class="box"><span class="boxTitle">未處理的訂單</span>
                <c:choose>
                	<c:when test="${empty futureList}">
                	<h1>${no_order}</h1>
                	</c:when>
                	<c:when test="${not empty futureList}">
                		<table>
                			<tr><th>訂單編號</th><th>取車據點</th><th>還車據點</th><th>還車時間</th><th>訂單狀態</th></tr>
                			<c:forEach var="future" items="${futureList}">
                				<tr><td>${future.id}</td><td>${future.start_branch_name}</td><td>${future.end_branch_name}</td>
                					<td>${future.end_date}</td><td>${future.order_state}</td>
                					<td>
                					<form id="futureForm" action="dealOrderback.controller" method="post">
                					<input type="hidden" value="${future.id}" name="id">
                					<input id="futureSubmit" type="submit" value="處理還車">
                					</form>
                					</td></tr>
                			</c:forEach>
                		</table>
                	</c:when>
                </c:choose>

                </div>
                <div class="box"><span class="boxTitle">今日待處理的訂單</span>
                <c:choose>
                	<c:when test="${empty todayList}">
                	<h1>${no_order}</h1>
                	</c:when>
                	<c:when test="${not empty todayList}">
                		<table>
                			<tr><th>訂單編號</th><th>取車據點</th><th>還車據點</th><th>還車時間</th><th>訂單狀態</th></tr>
                			<c:forEach var="today" items="${todayList}">
                				<tr><td>${today.id}</td><td>${today.start_branch_name}</td><td>${today.end_branch_name}</td>
                					<td>${today.end_date}</td><td>${today.order_state}</td>
                					<td>
                					<form action="dealOrderback.controller" method="post">
                					<input type="hidden" value="${today.id}" name="id">
                					<input id="todaySubmit" type="submit" value="處理還車">
                					</form>
                					</td></tr>
                			</c:forEach>
                		</table>
                	</c:when>
                </c:choose>

                </div>
                <div class="box"><span class="boxTitle">逾期的訂單</span>
				<c:choose>
                	<c:when test="${empty oldList}">
                	<h1>${no_order}</h1>
                	</c:when>
                	<c:when test="${not empty oldList}">
                		<table>
                			<tr><th>訂單編號</th><th>取車據點</th><th>還車據點</th><th>還車時間</th><th>訂單狀態</th></tr>
                			<c:forEach var="old" items="${oldList}">
                				<tr><td>${old.id}</td><td>${old.start_branch_name}</td><td>${old.end_branch_name}</td>
                					<td>${old.end_date}</td><td>${old.order_state}</td>
                					<td>
                					<form action="dealOrderBackWithFine.controller" method="post">
                					<input type="hidden" value="${old.id}" name="id">
                					<input id="oldSubmit" type="submit" value="還車+罰錢">
                					</form>
                					</td></tr>
                			</c:forEach>
                		</table>
                	</c:when>
                </c:choose>
                </div>
            </div>
		
<!--                       改這裡 -->
        </article>
    </div>
</body>
</html>
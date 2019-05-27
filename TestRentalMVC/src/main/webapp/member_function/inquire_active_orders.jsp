<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        div#inquire{background-color:blanchedalmond;width:1000px;height:800px;margin:auto;}
        div#top{height:150px;text-align:center}
        div#now{background-color:palevioletred;width:300px;height:300px;position:relative;top:0px;left:0px;display:inline-block;text-align:center;float:left;}
        #title{display:inline-block;position:relative;top:50px;font-size:3em;}
        span.text{display:inline-block;font-size:2em;margin-top:50px;}

        #active_order{background-color:yellow;width:600px;height:300px;display:inline-block;float:right;}
        table,tr,th,td{border:solid black 2px;}
        button{float:right;margin-top:10px}
        #bottom{float:right;margin-right:20px;clear:both;}
/*         改這個地方 */
    </style>
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
      });
    
    function cancelOrder(event){
    	var r=confirm("確定要取消這筆訂單嗎？");
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
			<div id="inquire">
                <div id="top">
                    <span id="title">查詢訂單</span>
                </div>
                <a href="#">
                    <div id="now">
                        <span class="text">查詢目前訂單狀況</span>
                    </div>
                </a>
                <div id="active_order">
                	<c:choose>
                		<c:when test="${not empty no_order}">
                		<h1>${no_order}</h1>
                		</c:when>
                		<c:when test="${not empty deleteOk}">
                		<h1>${deleteOk}</h1>
                		</c:when>
                		<c:when test="${not empty active_order}">
                		<table>
                			<tr><th>您目前的訂單</th></tr>
                			<tr><td>訂單編號</td><td>${active_order.id}</td></tr>
                			<tr><td>租借車號</td><td>${active_order.car_num}</td></tr>
                			<tr><td>借車據點</td><td>${active_order.start_branch_name}</td></tr>
                			<tr><td>還車據點</td><td>${active_order.end_branch_name}</td></tr>
                			<tr><td>起始日期</td><td><fmt:formatDate type = "date" value = "${active_order.start_date}" /></td></tr>
                			<tr><td>還車日期</td><td><fmt:formatDate type = "date" value = "${active_order.end_date}" /></td></tr>
                			<tr><td>價錢</td><td>${active_order.price}</td></tr>
                			<tr><td>訂單狀態</td><td>${active_order.order_state}</td></tr>
                			<tr><td>下單日期</td><td>${active_order.order_date}</td></tr>
                			<tr><td>付款方式</td><td>${active_order.payment}</td></tr>
                		</table>
                		<c:choose>
                			<c:when test="${active_order.order_state=='已預約'}">
                				<a href="cancelCurrentOrder.controller" onclick="cancelOrder(event)"><button>取消訂單</button></a>
<!--                 				<a href="#"><button>修改訂單</button></a> -->
                			</c:when>
                			<c:when test="${active_order.order_state=='已取車'}">
                				<h3>您已經取車，不可再取消訂單</h3>
                			</c:when>
                		</c:choose>
                		
                		</c:when>
                	</c:choose>
                </div>
            </div>


			<div id="bottom">
				<a href="/TestRentalMVC/member_function/inquire_orders.jsp"><img
					src="/TestRentalMVC/images/backpage120x70.png"></a>
			</div>
		</article>
    </div>
  <%@ include file='/shared/footer.jsp'%> 
</body>
</html>
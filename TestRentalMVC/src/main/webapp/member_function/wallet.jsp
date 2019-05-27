<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.top{height:850px;}
.CardNumbersize {
	height: 20px;
	width: 50px;
}

.CardBackNumbersize {
	height: 20px;
	width: 45px;
}

.red {
	color: red;
	margin: auto
}

div#wallet {
	background-color:#FFF3DE;
        height:500px;width:500px;overflow:auto;margin-left:300px;margin-bottom:-100px;margin-top:50px;
}
#bottom{float:right;margin-right:200px;clear:both;}
/*         改這個地方 */
</style>
<script src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script>
$(function(){
    $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
    $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
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
			<div id="wallet">
				<h1 class="red">電子錢包</h1><br>
				<p>您的餘額：${login_ok.wallet}$</p>
				<form action="addWallet.controller" method="post">
					請輸入信用卡號: <input class="CardNumbersize" type="text"
						name="creditcard01" maxlength="4" value="${param.creditcard01}">-
					    <input class="CardNumbersize" type="text" name="creditcard02"
						maxlength="4" value="${param.creditcard02}">- 
						<input class="CardNumbersize" type="text" name="creditcard03"
						maxlength="4" value="${param.creditcard03}">- 
						<input class="CardNumbersize" type="text" name="creditcard04"
						maxlength="4" value="${param.creditcard04}">${lengthcheck01}<br>
					<br> 卡號後三碼:<input class="CardBackNumbersize" type="text"
						name="creditcard05" maxlength="3" value="${param.creditcard05}">${lengthcheck02}
					<br> <br> 加值金額：<input class="CardNumbersize" type="text" name="credit" maxlength="5" >元
					${lengthcheck03}<br> <br> <input type="submit" value="確認儲值"><span class="red">${ok}</span>
					<p class="red"></p>
				</form>
				
				<form action="WalletHistory.controller" method="post">
                <input type="submit" value="歷史紀錄">
				<div>
				<!--  <p class="red">${history}</p><br>-->    				                   		    
				    <c:forEach var="history02" items="${history02}">
				    	您在 ${history02.thedate} 儲值了 ${history02.credit}元<br>	
				    </c:forEach>
				</div>    
				</form>   
				    </div>
                
			</div>

			<!--                       改這裡 -->
		</article>
		
	</div>
	
	<div id="bottom"><a href="/TestRentalMVC/member_function/member_zone.jsp">
                <img src="/TestRentalMVC/images/backpage120x70.png"></a></div>
                
                
	<%@ include file='/shared/footer.jsp'%>  
</body>
</html>
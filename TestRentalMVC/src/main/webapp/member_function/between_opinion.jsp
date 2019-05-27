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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>轉址中</title>
<script src="/TestRentalMVC/assets/js/jquery.min.js"></script>
<script>
$(document).ready(function(){
	location.href="showOpinionsAndReplys.controller";
});
</script>
</head>
<body>
</body>
</html>
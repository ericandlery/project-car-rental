<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>歡迎來到ProjectRental</title>
    <link rel="shortcut icon" href="../images/logo16x16.ico">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="/TestRentalMVC/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body{background-color:aqua;margin:0px;}
        header{height:100px;background-color:blue;font-size:3em;}
        nav{background-color:antiquewhite;height:40px;}
        nav span{float:right;margin-right:100px;font-size:2em;border-left:solid black 40px;}

        footer{background-color:darkorchid;height:50px;text-align:center;font-size:2em}
        .dodo{width:300px;height:215px;}
    </style>
</head>
<body>
    <div>
        <nav>
        	<a href="/TestRentalMVC/index.jsp"><span>回首頁</span></a>
            <span>會員登入</span>
            <a href="/TestRentalMVC/member_registry/member_registry.jsp"><span>會員註冊</span></a>
        </nav>
        <article>
<div class="dodo"><iframe  src="https://www.youtube.com/watch?v=gj5yzlP61Bs" frameborder="0" allowfullscreen></iframe></div>
                <iframe width="200"height="200" src="https://www.youtube.com/watch?v=gj5yzlP61Bs" frameborder="0" allowfullscreen></iframe>
        </article>
<%--         <%@ include file='/shared/footer.jsp'%> --%>
    </div>
</body>
</html>
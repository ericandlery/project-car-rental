<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty login_ok}">
<c:redirect url="/member_function/login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<!-- <<<<<<< HEAD -->
<!-- <title>歡迎來到ProjectRental</title> -->
<!-- <link rel="shortcut icon" href="../images/logo16x16.ico"> -->
<!-- <meta charset="utf-8" /> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script> -->
<!-- <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/header_footer.css"> -->
<!-- ======= -->
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
<!-- >>>>>>> branch 'master' of https://github.com/EEIT96003/ProjectRental.git -->
    <style>
    	article{
    		text-align:center;
    	}
    	#divA{
    		padding-bottom:30px;
    		margin:0 auto;
    		width:1000px;
    	}
    	#tableA{
    		margin-left:auto; 
			margin-right:auto;
    	}
    	
    	#tableA td{
    		padding:15px;
    	}
    	#t2{
    		width:350px;
    	}
/*         #tableA{ */
/*              background: rgba(100%,100%,100%,0.5); */
/* /*              float:left; */ */
/* /*              margin-left:30px; */ */
/* 			 line-height:20px; */
/* 			 margin-top:auto; */
/* 			 margin:50px; */
/* 		} */
		#tableA td{
			width:100px;
			padding:15px;
		}
		#tableA input{
			width:210px;
			padding:5px;
			border:1px solid #C5C1B1;
		}
		#mem{
			width:30px;
			margin-right:15px;
		}
		#bottomA{
			margin-top:30px;
			width:350px;
			height:30px;
			color:white;
			background-color:#1C1CFF;
			font-family:fantasy;
			font-size:1em;
		}
		#Error{
			color:red;
			font-size:small;
		}
		#eye{
			width:20px;
		}
        input:-webkit-autofill {
		    -webkit-box-shadow: 0 0 0px 1000px white inset;
		}
		#bottom{float:right;margin-right:-200px;clear:both;}
    </style>
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
      });
    </script>
</head>
<body>
    <div class="">
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
<!-- 	divA -->
        <div id="divA">
			<h1>修改會員資料</h1>
			<form action="updateMember.controller" method="post">
			<div>
				<img id="memphoto" style="margin-left:30px;width:150px;height:200px; float:left;" onclick="changimg()" src="/TestRentalMVC/member_photo/${login_ok.mem_photo}">
			</div>
			<input id="memphoto2" type="hidden" name="mem_photo" value="${login_ok.mem_photo}">
			<table id="tableA">
				<tr>
					<td align="right">信箱:</td>
					<td id="t2" align="left"><input type="text" name="email" value="${login_ok.email}" readonly></td>
				</tr>
				<tr>
					<td align="right">密碼:</td>
					<td align="left">
						<input type="password" id="password" name="password" maxlength="12" value="${pw}">
						<img id="eye" src=/TestRentalMVC/resources/images/images.png>
						<span id="Error"></span>
					</td>
				</tr>
				<tr>
					<td align="right">姓名:</td>
					<td align="left">
						<input type="text" name="name" value="${login_ok.name}">
						<span id="Error"></span>
					</td>
				</tr>
				<tr>
					<td align="right">身分證字號:</td>
					<td align="left">
						<input type="text" name="id_card" maxlength="10" value="${login_ok.id_card}">
						<span id="Error"></span>
					</td>
				</tr>
				<tr>
					<td align="right">地址:</td>
					<td align="left">
						<input type="text" name="address" value="${login_ok.address}">
						<span id="Error"></span>
					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td align="right">生日:</td> -->
<!-- 					<td align="left"> -->
<%-- 						<input type="date" name="tempBirth" value="${login_ok.birth}"> --%>
<!-- 						<span id="Error"></span> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<td align="right">手機:</td>
					<td align="left">
						<input type="text" name="phone" value="${login_ok.phone}">
						<span id="Error"></span>
					</td>
				</tr>
				<tr>
					<td align="right">家電:</td>
					<td align="left">
						<input type="text" name="tel" value="${login_ok.tel}">
						<span id="Error"></span>
					</td>
				</tr>
				<tr>
					<td align="right">紅利點數:</td>
					<td align="left">
						<input type="text" name="bonuspoint" value="${login_ok.bonuspoint}" readonly>
						<span id="Error"></span>
					</td>
				</tr>
			</table>
			<input id="bottomA" type="submit" value="更          新">
			<input type="hidden" name="id" value="${login_ok.id}">
			<input type="hidden" name="wallet" value="${login_ok.wallet}">
			<input type="hidden" name="mem_state" value="${login_ok.mem_state}">
			<input type="hidden" name="license_num" value="${login_ok.license_num}">
			<input type="hidden" name="license_leval" value="${login_ok.license_leval}">
			<input type="hidden" name="license_photo" value="${login_ok.license_photo}">
			<input type="hidden" name="subscription" value="${login_ok.subscription}">
			<input type="hidden" name="tempBirth" value="${login_ok.birth}">
			</form>
<!-- 			點選圖片後,會轉點擊到這裡,再自動送出 -->
			<form action="memberphotochange.controller" method="post" enctype="multipart/form-data" id="hiddenform">	
				<input type="file" id="theFileInput" name="file" style="display:none;" accept="image/*" onchange="sentcontroller()"/>
				<input id="sent" type = "submit" value="上傳" style="display:none;">
			</form>
			<div id="bottom"><a href="/TestRentalMVC/member_function/member_zone.jsp">
            <img src="/TestRentalMVC/images/backpage120x70.png"></a>
		</div>
        </article>
    </div>

    <script src="/TestRentalMVC/js/jquery-3.2.1.min.js"></script>
	<script>
	$('input:eq(1)').css({'background':'#E9E9E4'});
	$('input:eq(8)').css({'background':'#E9E9E4'});
	$("input:eq(2)").change(checkpassword);
	function checkpassword(){
		var password = $("input:eq(2)").val();
		if(password.length==0 || password==null){
			$('span[id*="Error"]:eq(0)').html('欄位不可空白');
		}else if(password.length<8){
			$('span[id*="Error"]:eq(0)').html('長度必須大於8碼');
		}else{
			$('span[id*="Error"]:eq(0)').html('');
		}
		for(var i=0;i<password.length;i++){
			var test=password.charCodeAt(i);
			if(test>10000){
				$('span[id*="Error"]:eq(0)').html('只能包含數字或英文字母');
			}
		}
	}
	$("input:eq(3)").change(checkname);
	function checkname(){
		var name = $("input:eq(3)").val();
		if(name.length==0 || name==null){
			$('span[id*="Error"]:eq(1)').html('欄位不可空白');
		}else if(name.length>10){
			$('span[id*="Error"]:eq(1)').html('長度過於冗長,不可超過10個字符');
		}else{
			$('span[id*="Error"]:eq(1)').html('');
		}
	}
	$("input:eq(4)").change(checkid_card);
	function checkid_card(){
		var id_card = $("input:eq(4)").val();
		if(id_card.length==0 || id_card==null){
			$('span[id*="Error"]:eq(2)').html('欄位不可空白');
		}else if(id_card.length>10){
			$('span[id*="Error"]:eq(2)').html('格式不符');
		}else{
			$('span[id*="Error"]:eq(2)').html('');
		}
	}
	$("input:eq(5)").change(checkaddress);
	function checkaddress(){
		var id_card = $("input:eq(5)").val();
		if(id_card.length==0 || id_card==null){
			$('span[id*="Error"]:eq(3)').html('欄位不可空白');
		}else{
			$('span[id*="Error"]:eq(3)').html('');
		}
	}
	$("input:eq(7)").change(checkphone);
	function checkphone(){
		var id_card = $("input:eq(6)").val();
		if(id_card.length==0 || id_card==null){
			$('span[id*="Error"]:eq(5)').html('欄位不可空白');
		}else{
			$('span[id*="Error"]:eq(5)').html('');
		}
		for(var i=0;i<password.length;i++){
			var test=password.charCodeAt(i);
			if(test>10000){
				$('span[id*="Error"]:eq(5)').html('只能包含數字或英文字母');
			}
		}
	}
	$("input:eq(8)").change(checktel);
	function checktel(){
		var id_card = $("input:eq(8)").val();
		if(id_card.length==0 || id_card==null){
			$('span[id*="Error"]:eq(6)').html('欄位不可空白');
		}else{
			$('span[id*="Error"]:eq(6)').html('');
		}
	}
	$(function(){
		// 先取得 #password 及產生一個文字輸入框
		var $password = $('#password'), 
			$passwordInput = $('<input type="text" id="passwordInput" maxlength="12" name="password"/>');
	 	var lock=0;
		// 當勾選顯示密碼框時
		$('#eye').click(function(){
			if(lock==0){
				$password.replaceWith($passwordInput.val($password.val()));
				lock=1;
			}else{
				$passwordInput.replaceWith($password.val($passwordInput.val()));
				lock=0;
			}
		});
	});
	function changimg(){
		$('#theFileInput').click();
	}
	function sentcontroller(){
			$.ajax({
			url: 'memberphotochange.controller',
			type: 'POST',
			cache: false,
			data: new FormData($('#hiddenform')[0]),
			processData: false,
			contentType: false
			}).done(function(res) {
				$('#memphoto').attr("src","/TestRentalMVC/member_photo/"+res);
				$('#memphoto2').val(res);
			}).fail(function(res) {});
	}
	</script>
	<%@ include file='/shared/footer.jsp'%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:remove var="staff_login_ok" scope="session" />
<c:remove var="manager_login_ok" scope="session" />
<!-- 強制登出管理者和門市人員 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>下訂單-選擇日期</title>
<link rel="shortcut icon" href="../images/logo16x16.ico">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/TestRentalMVC/resources/css/header_footer.css">
<link rel="stylesheet" href="/TestRentalMVC/resources/css/jquery-ui.css">
<style>
/*         CSS改這個地方//////////////////////////// */
#title {
	text-align: center;
	font-size: 3em;
	background-color: darkgrey;
}

#menu {
	background-color: yellow;
	height: 700px;
	width: 300px;
	float: right;
	color: white;
	font-size: 2em;
	position: fixed;
}

#content {
	border: solid black 10px;
	width: 1300px;
	float: right;
	margin-right: 80px;
	text-align: center;
}

#list {
	margin: 60px;
}

.box {
	background-color: whitesmoke;
	height: 300px;
	width: 1200px;
	display: inline-block;
	margin-left: 20px;
	border: solid black;
	margin-top: 50px;
}

.pics {
	border: solid red 4px;
	width: 400px;
	height: 300px;
	float: left;
}

.video {
	border: solid red 4px;
	width: 400px;
	height: 300px;
	float: right;
}

.pics img {
	height: 100%;
	width: 100%;
}

.video video {
	height: 100%;
	width: 100%;
}

.txt {
	float: left;
	text-align: center;
	font-size: 20px;
}

#goBack {
	cursor: pointer;
}

table.steelBlueCols {
	border: 4px solid #555555;
	background-color: lightgreen;
	width: 100%;
	text-align: center;
	border-collapse: collapse;
}

table.steelBlueCols td, table.steelBlueCols th {
	border: 1px solid #555555;
	padding: 5px 10px;
}

table.steelBlueCols tbody td {
	font-size: 45px;
	font-weight: bold;
	color: black;
}

table.steelBlueCols td:nth-child(even) {
	background: #398AA4;
}

table.steelBlueCols thead {
	background: #398AA4;
	border-bottom: 10px solid #398AA4;
}

table.steelBlueCols thead th {
	font-size: 60px;;
	font-weight: bold;
	color: #FFFFFF;
	text-align: center;
	border-left: 2px solid #398AA4;
}

table.steelBlueCols thead th:first-child {
	border-left: none;
}

table.steelBlueCols tfoot td {
	font-size: 13px;
}

table.steelBlueCols tfoot .links {
	text-align: right;
}

table.steelBlueCols tfoot .links a {
	display: inline-block;
	background: #FFFFFF;
	color: #398AA4;
	padding: 2px 8px;
	border-radius: 5px;
}
.helpText{font-size:20px;color:yellow;font-weight:bolder;}
body{
  background: url(/TestRentalMVC/resources/background/silverstoneopacity.png) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
/*         CSS///////////// ///////////////////////*/
</style>
<script src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script src="/TestRentalMVC/resources/js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#include_nav_no_login").load(
				"/TestRentalMVC/header_footer/nav_without_login.jsp");
		$("#include_nav_login").load(
				"/TestRentalMVC/header_footer/nav_with_login.jsp");
	});
	//     	JavaScript改這個地方///////////////////////////////////////
	$(function() {
		if($("#errorPara").text().length!=0){
			alert($("#errorPara").text());
		}
		
		
		$("#datepicker1").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : +1,
			maxDate : +7
		});
		
		$("#datepicker2").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : +0,
			maxDate : +0
		});
//////////顯示所有據點名稱
		$.getJSON("getAllBranchs.controller",function(data){
			var txt="<option selected disabled>請選擇還車據點</option>";
			
			if(data.length!=0){
				for(var i=0;i<data.length;i++){
					txt=txt+"<option value='"+data[i].name+"'>"+data[i].name+"</option>"
				}
				$("#branchList").html(txt);
			}else{
				txt=txt+"<option disabled>請聯絡網站人員</option>"
				$("#branchList").html(txt);
			}
		});
		
	});
/////////選擇完借車日期後
	function getDate(e) {
		$("#datepicker2").val("");
		$("#datepicker2").prop("disabled",false);
		
		var d=(e.value).split("-");
		var yy=parseInt(d[0]);
		var mm=parseInt(d[1]);
		var dd=parseInt(d[2]);
		/////////取車日期
		var min=new Date(yy,mm-1,dd+1);
		/////////還車日期
		var max=new Date(yy,mm-1,dd+7);
		
		$("#datepicker2").datepicker("option","minDate",min);
		$("#datepicker2").datepicker("option","maxDate",max);
		
		
	}
	// 		JavaScript////////////////////////////////////////////////
</script>
</head>
<body>
	<div>
		<header> ProjectRental </header>
		<c:choose>
			<c:when test="${empty login_ok}">
				<nav id="include_nav_no_login"></nav>
			</c:when>
			<c:otherwise>
				<nav id="include_nav_login"></nav>
			</c:otherwise>
		</c:choose>
		<article>
			<!--                       HTML改這裡 ////////////////////-->
			<div id="title">
				<p>下訂單-選擇日期</p>
			</div>
			<div id="menu">
				<ul id="list">
					<li><a href="showCategoryList.controller">車種</a></li>
					<li><a href="showModelList.controller">車型</a></li>
					<!-- 					<li><a href="#">車款</a></li> -->
					<!-- 					<li><span id="goBack" onclick="goBack()"><a>回上一頁</a></span></li> -->
					<li><a href="/TestRentalMVC/index.jsp">回首頁</a></li>
				</ul>
			</div>

			<div id="content">
				<c:if test="${not empty model}">
					<div class="box">
						<div class="pics">
							<img alt="暫時沒圖片"
								src="/TestRentalMVC/resources/car_model/${model.photo}"
								width="50" height="50">
						</div>
						<div class="txt">
							車型：${model.name}<br> 廠牌：${model.brand}<br>
							座位數：${model.seat}<br> 排氣量：${model.cc}<br> <br>
							${model.description}
						</div>
						<div class="video">
							<c:choose>
								<c:when test="${model.video!=null}">
									<video width="50" height="50" controls autoplay muted loop>
										<source
											src="/TestRentalMVC/resources/car_model_video/${model.video}"
											type="video/mp4">
										Your browser does not support HTML5 video.
									</video>
								</c:when>
								<c:otherwise>
									<h1>
										試駕影片<br><img src="/TestRentalMVC/resources/smallpics/comingsoon.png">
									</h1>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:if>
				<br>
				<form action="acceptOrder.controller" method="post">
				<table class="steelBlueCols">
					<thead>
						<tr>
							<th colspan="2">請輸入借還日期、還車據點及付款方式</th>
							<!-- <th>head2</th> -->
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>您的車牌號碼</td>
							<td><p>
									<input type="text" disabled value="${order.car_num}">
								</p></td>
						</tr>
						<tr>
							<td>取車據點</td>
							<td><p>
									<input type="text" disabled value="${order.start_branch_name}">
								</p></td>
						</tr>
						<tr>
							<td>借車日期</td>
							<td><p><span class="helpText">請從隔天開始至七日內選取，以方便我們為您調用車輛</span><br>
									<input type="text" id="datepicker1" name="start_dateX" value="" onchange="getDate(this)">
								</p></td>
						</tr>
						<tr>
							<td>還車日期</td>
							<td><p><span class="helpText">最晚請於七日內歸還</span><br>
									<input type="text" id="datepicker2" name="end_dateX" value="" disabled>
								</p></td>
						</tr>
						<tr>
							<td>還車據點</td>
							<td><p>
									<select id="branchList" name="end_branch_name">
										<option selected disabled>請選擇還車據點</option>
									</select>
								</p></td>
						</tr>
						<tr>
							<td>付款方式</td>
							<td><p>
									<select name="payment">
										<option selected disabled>請選擇付款方式</option>
										<option value="現場付款">現場付款</option>
										<option value="電子錢包">電子錢包</option>
									</select>
								</p></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="確認送出">&nbsp;&nbsp;<input type="reset" value="重新選擇"></td>
						</tr>
					</tbody>
				</table>
			</form>

			</div>
			<p style="display:none;" id="errorPara">${dataError}</p>
			<!--                       HTML/////////////////////////// -->
		</article>
	</div>
<%-- 	  <%@ include file='/shared/footer.jsp'%>  --%>
</body>
</html>
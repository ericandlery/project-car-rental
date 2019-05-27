<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:remove var="staff_login_ok" scope="session" />
<c:remove var="manager_login_ok" scope="session" />
<!-- 強制登出管理者和門市人員 -->
<c:remove var="order" scope="session"/>
<!-- 清空購物車 -->
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
/*         CSS改這個地方//////////////////////////// */
.top{height:1300px;}
        #title{text-align: center;font-size: 3em;font-weight:bold;color:#636363;font-family:標楷體;}

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

table {
	margin: auto;
}

table.cinereousTable {
	font-family: Impact, Charcoal, sans-serif;
	border: 3px solid #94938D;
	background-color: #C9D0FF;
	width: 90%;
	height: 200px;
	text-align: center;
	border-collapse: collapse;
}

table.cinereousTable td, table.cinereousTable th {
	border: 1px solid #948473;
	padding: 10px 10px;
}

table.cinereousTable tbody td {
	font-size: 25px;
	color: #11215C;
}

table.cinereousTable tr:nth-child(even) {
	background: #CFE8E4;
}

table.cinereousTable thead {
	background: #403932;
	background: -moz-linear-gradient(top, #706a65 0%, #534c46 66%, #403932 100%);
	background: -webkit-linear-gradient(top, #706a65 0%, #534c46 66%, #403932 100%);
	background: linear-gradient(to bottom, #706a65 0%, #534c46 66%, #403932 100%);
	border-bottom: 0px solid #4A4A4A;
}

table.cinereousTable thead th {
	font-size: 26px;
	font-weight: bold;
	color: #F0F0F0;
	text-align: center;
	border-left: 6px solid #DEFFDE;
}

table.cinereousTable thead th:first-child {
	border-left: none;
}

table.cinereousTable tfoot {
	font-size: 16px;
	font-weight: bold;
	color: #F0F0F0;
	background: #948473;
	background: -moz-linear-gradient(top, #afa396 0%, #9e9081 66%, #948473 100%);
	background: -webkit-linear-gradient(top, #afa396 0%, #9e9081 66%, #948473 100%);
	background: linear-gradient(to bottom, #afa396 0%, #9e9081 66%, #948473 100%);
}

table.cinereousTable tfoot td {
	font-size: 16px;
}

body{
  background: url(/TestRentalMVC/resources/background/silverstoneopacity.png) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
#goBack{cursor:pointer;}
/*         CSS///////////// ///////////////////////*/
</style>
<script>
	$(function() {
		$("#include_nav_no_login").load(
				"/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
		$("#include_nav_login").load(
				"/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
	});
	//     	JavaScript改這個地方///////////////////////////////////////
	function nextStep(id,branch){
		var mem_id=$("#hiddenP").text();
		if(mem_id.length==0){
			alert("您還沒有登入喔！請先登入才能使用此服務");
			return;
		}else{
// 			alert("OKK")
			$.get("checkReviewd.controller?mem_id="+mem_id,function(data){
				if(data=="良好"){
// 					alert("可以租");
					/////////////審核過關可繼續下
					$("#formCar_num").val(id);
					$("#formBranch").val(branch);
					$("#hiddenForm").submit();
				}else{
					//////////沒過關返回
					alert("請等審核過以後才能使用此功能");
					return;
				}
			});
		}
	}
	
	function goBack(){
		window.history.back();
	}
	// 		JavaScript////////////////////////////////////////////////
</script>
</head>
<body>
	<div class="top">
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
				<p>選擇車款</p>
			</div>
			<div id="menu">
				<ul id="list">
					<li><a href="showCategoryList.controller">車種</a></li>
					<li><a href="showModelList.controller">車型</a></li>
<!-- 					<li><a href="#">車款</a></li> -->
					<li><span id="goBack" onclick="goBack()"><a>回上一頁</a></span></li>
<!-- 					<li><a href="/TestRentalMVC/index.jsp">回首頁</a></li> -->
				</ul>
			</div>

			<div id="content">
				<c:if test="${not empty nomodel}">
					<h1>${nomodel}</h1>
				</c:if>
				<c:if test="${not empty model}">
					<div class="box">
						<div class="pics">
							<img alt="暫時沒圖片"
								src="/TestRentalMVC/resources/car_model/${model.photo}"
								width="50" height="50">
						</div>
						<div class="txt">
							車型：${model.name}<br> 廠牌：${model.brand}<br>
							座位數：${model.seat}<br> 排氣量：${model.cc}<br>
							<br> ${model.description}
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
									<h1>試駕影片<br><img src="/TestRentalMVC/resources/smallpics/comingsoon.png"></h1>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:if>
				<br>
				<c:if test="${not empty no}">
					<h1>${no}</h1>
				</c:if>
				<c:if test="${not empty list}">
					<table class="cinereousTable">
						<thead>
							<tr>
								<th>車牌號碼</th>
								<th>生產年份</th>
								<th>里程數</th>
								<th>顏色</th>
								<th>單日價錢</th>
								<th>所在據點</th>
								<th>車況</th>
								<th>租借</th>
							</tr>
						<tbody>
						<c:forEach var="list" items="${list}">
							<tr>
								<td>${list.car_num}</td>
								<td><fmt:formatDate pattern = "yyyy" value = "${list.production_date}" /></td>
								<td>${list.mileage}</td>
								<td>${list.color}</td>
								<td>${list.price_day}元</td>
								<td>${list.branch_name}</td>
								<td>${list.car_state}</td>
								<td>
								<c:if test="${list.car_state=='良好'}">
								<input type="button" onclick="nextStep('${list.car_num}','${list.branch_name}')" value="我要租">
								</c:if>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
<p id="hiddenP" style="display:none;">${login_ok.id}</p>
<form id="hiddenForm" action="saveCarNum.controller" method="post" style="display:none;">
	<input type="text" id="formCar_num" name="car_num">
	<input type="number" id="formMemId" name="memid" value="${login_ok.id}">
	<input type="text" id="formBranch" name="start_branch_name">
	<input type="number" id="formModelId" name="modelId" value="${model.id}">
</form>
			<!--                       HTML/////////////////////////// -->
		</article>
	</div>
		        <%@ include file='/shared/footer.jsp'%>
</body>
</html>
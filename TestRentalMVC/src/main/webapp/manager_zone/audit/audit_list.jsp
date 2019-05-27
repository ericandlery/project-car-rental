<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty manager_login_ok}">
	<c:redirect url="/manager_zone/manager_login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>待審核會員列表</title>
<link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/TestRentalMVC/resources/css/manager_hf2.css">
<style>
/*         改這個地方 */
#manager {
	background-image:URL(/TestRentalMVC/images/mana1300x700.png);
	width: 1300px;
	height: 700px;
	margin: auto;
	margin-top:50px;
	color: white;
}

#title {
	height: 100px;
	text-align: center;
	font-size: 4em;
}

table.greenTable {
	font-family: Georgia, serif;
	border: 6px solid #24943A;
	background-color: #D4EED1;
	width: 100%;
	text-align: center;
	color: black;
}

table.greenTable td, table.greenTable th {
	border: 1px solid #24943A;
	padding: 3px 2px;
}

table.greenTable tbody td {
	font-size: 13px;
}

table.greenTable thead {
	background: #24943A;
	background: -moz-linear-gradient(top, #5baf6b 0%, #3a9e4d 66%, #24943A 100%);
	background: -webkit-linear-gradient(top, #5baf6b 0%, #3a9e4d 66%, #24943A 100%);
	background: linear-gradient(to bottom, #5baf6b 0%, #3a9e4d 66%, #24943A 100%);
	border-bottom: 0px solid #444444;
}

table.greenTable thead th {
	font-size: 19px;
	font-weight: bold;
	color: #F0F0F0;
	text-align: left;
	border-left: 2px solid #24943A;
}

table.greenTable thead th:first-child {
	border-left: none;
}

table.greenTable tfoot {
	font-size: 13px;
	font-weight: bold;
	color: #F0F0F0;
	background: #24943A;
	background: -moz-linear-gradient(top, #5baf6b 0%, #3a9e4d 66%, #24943A 100%);
	background: -webkit-linear-gradient(top, #5baf6b 0%, #3a9e4d 66%, #24943A 100%);
	background: linear-gradient(to bottom, #5baf6b 0%, #3a9e4d 66%, #24943A 100%);
	border-top: 1px solid #24943A;
}

table.greenTable tfoot td {
	font-size: 13px;
}

table.greenTable tfoot .links {
	text-align: right;
}

table.greenTable tfoot .links a {
	display: inline-block;
	background: #FFFFFF;
	color: #24943A;
	padding: 2px 8px;
	border-radius: 5px;
}

/*         改這個地方 */
</style>
<script>
	$(document).ready(function(){
		$.getJSON("getAllCategory.controller",function(data){
			var txt="<option disabled selected>請選擇</option>";
			for(var i=0;i<data.length;i++){
				txt=txt+"<option value='"+data[i]+"'>"+data[i]+"</option>"
			}
			$(".license_leval").html(txt);
		});
	});
	
	function submitForm(type,id){
		var mem_id=$("#mem_id"+id).val();
		var license_num=$("#license_num"+id).val();
		var license_leval=$("#license_leval"+id).val();
		
		$("#f1").val(mem_id);
		$("#f2").val(license_num);
		$("#f3").val(license_leval);
		$("#f4").val(type);
		
		var f1=$("#f1").val();
		var f2=$("#f2").val();
		var f3=$("#f3").val();
		var f4=$("#f4").val();
		
		
		
		var r;
		if(type==1){
			if(f1=="" || f2=="" || f3=="" || f4==""){
				alert("請確實填寫好後再送出");
				return;
			}
			
			r=confirm("確定要讓他過關嗎？");
		}else{
			r=confirm("確定退回？");
		}
		
		
		if(r==true){
			$("#form").submit();
		}else{
			return;
		}
		
	}
</script>
</head>
<body>
	<div>
		<header>
			待審核會員列表
			<div>
				<a href="/TestRentalMVC/manager_zone/manager_zone.jsp"><img
					src="/TestRentalMVC/images/home160x160.png"></a> <span><a
					href="/TestRentalMVC/index.jsp"><img
						src="/TestRentalMVC/images/logout180x130.png"></a></span>
			</div>
		</header>
		<nav></nav>
		<article>
			<!--                       改這裡 -->
			<div id="manager">
<!-- 				<div id="title"> -->
<!-- 					<a href="/TestRentalMVC/manager_zone/manager_zone.jsp">管理者頁面</a>>待審核會員列表 -->
<!-- 				</div> -->
				<c:if test="${not empty no_list}">
					<h2>${no_list}</h2>
				</c:if>
				<c:if test="${not empty list}">
					<table class="greenTable">
						<thead>
							<tr>
								<th>會員資料</th>
								<th>駕照圖片</th>
								<th>審核內容</th>
								<th>驗證</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="5">
									<!-- <div class="links"><a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a></div> -->
								</td>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>
									<td>會員名字：${list.name}<br> <input type="text"
										value="${list.id}" id="mem_id${list.id}"
										style="display: none;"> Email：${list.email}<br>
										生日：${list.birth}<br> 註冊日期：${list.registration_date}
									</td>
									<td><img src="/TestRentalMVC/resources/member_license_photo/${list.license_photo}"
									height="200" width="400"></td>
									<td>駕照號碼<br> <input type="text"
										id="license_num${list.id}"><br> <br> 駕照級別<br>
										<select id="license_leval${list.id}" class="license_leval">
											<option disabled selected>請選擇</option>
									</select></td>
									<td><input type="button" value="審核過關" onclick="submitForm(1,${list.id})"><br> <br>
										<input type="button" value="退回" onclick="submitForm(0,${list.id})"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form action="reviewOrReject.controller" method="post" id="form"
						style="display: none;">
						<input type="text" id="f1" name="mem_id" style="display: none;">
						<input type="text" id="f2" name="license_num"
							style="display: none;"> <input type="text" id="f3"
							name="license_leval" style="display: none;"> <input	type="text" id="f4" name="submitType" style="display: none;">
						<input>
					</form>
				</c:if>
			</div>

			<!--                       改這裡 -->
		</article>
	</div>
</body>
</html>
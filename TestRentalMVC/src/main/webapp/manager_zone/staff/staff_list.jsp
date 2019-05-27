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
<title>Jeams租車管理員</title>
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
article {
	
}

#manager {
	width: 1500px;
	height: 700px;
	margin: auto;
	color: white;
	overflow: auto;
}

#title {
	height: 150px;
	font-size: 3em;
	color: black;
	text-align: center;
}
#errorTitle{text-align:center;color:black;}

table {
	margin: auto;
}

table.greenTable {
	font-family: "Arial Black", Gadget, sans-serif;
	border: 6px solid #36D7D8;
	background-color: #ABD6D5;
	width: 70%;
	text-align: center;
	border-collapse: collapse;
}

table.greenTable td, table.greenTable th {
	border: 5px solid #24943A;
	padding: 7px 6px;
}

table.greenTable tbody td {
	font-size: 20px;
	color: #5F0823;
}

table.greenTable tr:nth-child(even) {
	background: #97C8AF;
}

table.greenTable thead {
	background: #0B225B;
	background: -moz-linear-gradient(top, #485984 0%, #23386b 66%, #0B225B 100%);
	background: -webkit-linear-gradient(top, #485984 0%, #23386b 66%, #0B225B 100%);
	background: linear-gradient(to bottom, #485984 0%, #23386b 66%, #0B225B 100%);
	border-bottom: 0px solid #444444;
}

table.greenTable thead th {
	font-size: 26px;
	font-weight: bold;
	color: #F8EC24;
	text-align: center;
	border-left: 7px solid #24943A;
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
#dialog{font-size:20px;}
/*         改這個地方 */
</style>
<script>
////////////////////////JAVASCRIPT
$(document).ready(function(){
	/////////////顯示錯誤訊息
	if($("#formMessage").text().length!=0){
		alert($("#formMessage").text());
	}
	
	
	$.getJSON("getAllBranchs.controller",function(data){
		var option="<option disabled selected>請選擇</option>";
		
		if(data.length==0){
			option="<option disabled selected>沒有據點，請管理員新增</option>"
		}else{
			for(var i=0;i<data.length;i++){
				option=option+"<option value='"+data[i].name+"'>"+data[i].name+"</option>";
			}
		}
		$(".branch_name").html(option);
	});
	
});

//////////type
//////////2:(新增)	1:(修改)		0:(刪除)
function submitForm(type,id){
	switch(type){
	case 2:
		$("#type").val("2");
		$("#satffForm").submit();
		break;
	case 1:
		/////清空密碼欄
		$("#updateForm input[name='password']").val("");
		
		$("#updateForm input[name='id']").val($("#list"+id+" .staffId").text());
		$("#updateForm input[name='name']").val($("#list"+id+" .staffName").text());
		$("#updateForm select[name='branch_name']").val($("#list"+id+" .staffBranch").text());
		
		$("#dialog").dialog();
		break;
	case 0:
		var r=confirm("確定要刪除嗎？");
		if(r==true){
			$("#type").val("0");
			$("#id").val(id);
			$("#satffForm").submit();
		}else{
			return;
		}
		break;
	}
}
function confirmSubmit(e){
	var r=confirm("確定要修改嗎？");
	
	if(r==true){
		return;
	}else{
		e.preventDefault();
		return;
	}
}
//////////////////////////////////
</script>
<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/datatables.css">
 
<script type="text/javascript" charset="utf8" src="/TestRentalMVC/resources/js/datatables.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/TestRentalMVC/resources/css/jquery-ui.theme.css">
</head>
<body>
	<div>
		<header>
			門市人員列表
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
				<div id="title">門市人員管理</div>
				<form action="crudStaff.controller" method="post" id="satffForm">
					<table class="greenTable">
						<thead>
							<tr>
								<th>人員編號</th>
								<th>帳號</th>
								<th>密碼</th>
								<th>所在據點</th>
								<th>修改</th>
								<th>刪除</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="6"></td>
							</tr>
						</tfoot>
						<tbody>
						<c:if test="${not empty error}">
							<tr>
								<td colspan="6">${error}</td>
							</tr>
						</c:if>
							<c:if test="${not empty list}">
								<c:forEach var="list" items="${list}">
								<tr id="list${list.id}">
									<td class="staffId">${list.id}</td>
									<td class="staffName">${list.name}</td>
									<td class="staffPassword">*****</td>
									<td class="staffBranch">${list.branch_name}</td>
									<td class="action"><input type="button" value="修改" onclick="submitForm(1,${list.id})"></td>
									<td><input type="button" value="刪除" onclick="submitForm(0,${list.id})"></td>
								</tr>
								</c:forEach>
							</c:if>
							<tr>
								<td><input type="hidden" name="id" id="id"></td>
								<td><input type="text" name="name" id="name"></td>
								<td><input type="password" name="password" id="password"></td>
								<td><select name="branch_name" class="branch_name">
										<option disabled selected>請選擇</option>
									</select></td>
								<td><input type="button" value="確認新增" onclick="submitForm(2)"></td>
								<td><input type="reset" value="重新填寫"></td>
							</tr>
						</tbody>
					</table>
					<!-- 隱藏欄位 -->
					<input type="hidden" name="type" id="type">
					<!--         -->
					</form>
			</div>
			<!-- 隱藏錯誤訊息 -->
			<p id="formMessage" hidden="true">${formMessage}</p>
			<!-- 隱藏修改區塊 -->
			<div id="dialog" title="修改門市人員資料" style="display:none;">
  				<form action="crudStaff.controller" id="updateForm" method="post">
  					&nbsp;&nbsp;編號：&nbsp;<input type="number" name="id" readonly="readonly" style="background-color:gray;"><br><br>
  					&nbsp;&nbsp;帳號：&nbsp;<input type="text" name="name"><br><br>
  					&nbsp;&nbsp;密碼：&nbsp;<input type="password" name="password"><br><br>
  					&nbsp;&nbsp;據點：&nbsp;<select name="branch_name" class="branch_name">
  												<option disabled selected>請選擇</option>
  											</select><br><br>
  					<input type="hidden" name="type" value="1">
  					<input type="submit" value="O" style="float:right;" onclick="confirmSubmit(event)">
  				</form>
			</div>
			<!--                       改這裡 -->
		</article>
	</div>
</body>
</html>
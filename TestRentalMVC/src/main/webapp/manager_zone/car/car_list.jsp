<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty manager_login_ok}">
<c:redirect url="/manager_zone/manager_login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>歡迎來到ProjectRental</title>
    <link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script 
    src="/TestRentalMVC/resources/js/jquery-tablepage-1.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/manager_hf2.css">    
<!-- 月曆--> 
<script src="http://cdn.staticfile.org/moment.js/2.2.1/moment.min.js"></script>
<link rel="stylesheet" href="http://dbushell.github.com/Pikaday/css/pikaday.css">
<script src="http://dbushell.github.com/Pikaday/pikaday.js"></script>
<!-- TABLE-->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>

<script type="text/javascript">
$(document).ready(function(){

	var i18n = { // 本地化
		previousMonth	: '上个月',
		nextMonth		: '下个月',
		months			: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
		weekdays		: ['周日','周一','周二','周三','周四','周五','周六'],
		weekdaysShort	: ['日','一','二','三','四','五','六']
	}

	var datepicker = new Pikaday({ 
		field:		jQuery('#datepicker')[0],  
		minDate:	new Date('2000-01-01'), 
		maxDate:	new Date('2020-12-31'), 
		yearRange:	[2000,2020],
		i18n: 		i18n,
		onSelect: 	function() {
			var date = document.createTextNode(this.getMoment().format('YYYY-MM-DD') + ' '); //生成的时间格式化成 2013-09-25
			$('#datepicker').appendChild(date);
		}
	});

});


function subsub(event){
	var r=confirm("確認是否刪除?");
	if(r==true){
		return;
	}else{
		event.preventDefault();
		return;
	}
}
$(document).ready( function () {
    $('#car_table').DataTable();
    
    
    $.getJSON("searchBranchSS.controller",function(data){
    	
    	var txt="<option value='noSelect'selected disabled>選擇據點</option>";
    	
    	if(data.length!=0){
    		for(var i=0;i<data.length;i++){
    			txt=txt+"<option value='"+data[i].name+"'>"+data[i].name+"</option>"
    		}
    		$("#searchBranchSS").html(txt);
    	}else{
    		txt=txt+"<option disabled>請聯絡網站人員</option>"
    		$("#searchBranchSS").html(txt);
    	}


    });
    
    $.getJSON("searchModelSS.controller",function(data){
    	
    	var txt="<option value='noSelect' selected disabled>選擇車型</option>";
    	
    	if(data.length!=0){
    		for(var i=0;i<data.length;i++){
    			txt=txt+"<option value='"+data[i].id+"'>"+data[i].name+"</option>"
    		}
    		$("#searchModelSS").html(txt);
    	}else{
    		txt=txt+"<option disabled>請聯絡網站人員</option>"
    		$("#searchModelSS").html(txt);
    	}


    });
    
  
} );




</script>
<!-- TEST --> 
   

    <style>
/*         改這個地方 */
        #out{width:1400px;height:800px;background-color:#AAAAAA;margin:auto;color:white;overflow:auto;}
/*         table,thead,tbody,tfoot,tr,th,td{border:solid white 2px;border-collapse:collapse;margin:auto;padding:10px;} */
        #menu{background-color:Highlight;width:200px;height:100px;float:right;text-align:center;padding-top:20px;font-size:2em;}
        #title{text-align:center;display:block;font-size:3em;}
        form{color:black}
        
        
/*         改這個地方 */

 .buttonmodify {
    background-color: #77DDFF;
    border: none;
    color: black;
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 10px;
}

.buttonmodify:hover {
    background-color: #CCEEFF; 
    color: white;
}
.buttondelete {
    background-color: #FFFFBB;
    border: none;
    color: black;
    padding: 12px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 12px;
}

.buttondelete:hover {
    background-color: #FF0000; 
    color: white;
}

.buttonedit {
    background-color: #FFFFBB;
    border: none;
    color: black;
    padding: 12px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 12px;
}

.buttonedit:hover {
    background-color: #D1BBFF; 
    color: white;
}        
.CarNumsize {
	height: 20px;
	width: 65px;
	color:black;
}
.CarNumsize2 {
	height: 20px;
	width: 45px;
	color:black;
}
.CarNumsize3 {
	height: 20px;
	width: 80px;
	color:black;
}
.CarNewColor {
   font-size:12px;
	color:black;
}
.CarNewColor2 {
	color:red;
	align:center;
	font-size:20px ;
	margin-left: 40%;
	margin-bottom:10px;
}

    </style>
 
</head>
<body>

 
    <div>
		<header>
			車輛列表
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
<!-- 			<div id="out"> -->
<!--                 <span id="title">所有車輛</span> -->
<!--                 <form action="selectAllCarOrder.controller" method="get"> -->
<!--                 	<select name="order"> -->
<!--                 		<option value="car_num">車牌號碼</option> -->
<!--                 		<option value="model_id">車型ID</option> -->
<!--                 		<option value="production_date">製造年份</option> -->
<!--                 		<option value="mileage">里程數</option> -->
<!--                 		<option value="color">顏色</option> -->
<!--                 		<option value="price_day">單日價錢</option> -->
<!--                 		<option value="car_photo">照片</option> -->
<!--                 		<option value="branch_name">所在據點</option> -->
<!--                 		<option value="car_state">車輛狀態</option> -->
<!--                 		<option value="rate">總評分</option> -->
<!--                 		<option value="rate_count">評分次數</option> -->
<!--                 	</select> -->
<!--                 	<select name="sort"> -->
<!--                 		<option value="asc">小到大</option> -->
<!--                 		<option value="desc">大到小</option> -->
<!--                 	</select> -->
<!--                 	<input type="submit" value="排序"> -->
                	
<!--                 </form> -->
                <c:choose>
                   
                	<c:when test="${empty car_list}">
                	<h1>${no_car}</h1>
                	</c:when>
                	<c:otherwise>
                	<hr>
                	<form action="allcarC.controller" method="post" enctype="multipart/form-data">
                	<span class="CarNewColor">車牌號碼:</span><input class="CarNumsize" maxlength="7"name="car_num" type="text" value="${CarE.car_num}">
                	<span class="CarNewColor">車型ID:</span>
<%--                 	<input class="CarNumsize" name="model_idX" type="text" value="${CarE.model_id}"> --%>
                	<select name="model_idX" id="searchModelSS">
                	       
                	</select>
                	<span class="CarNewColor">製造年份:</span><input id="datepicker" class="CarNumsize3" maxlength="10" name="production_dateB" type="text" value="${CarE.production_date}">
                	<span class="CarNewColor">里程數:</span><input class="CarNumsize" name="mileageX" type="text" value="${CarE.mileage}">
                	<span class="CarNewColor">顏色:</span><input class="CarNumsize" name="color" type="text" value="${CarE.color}">
                	<span class="CarNewColor">價錢:</span><input class="CarNumsize" name="price_dayX" type="text" value="${CarE.price_day}">                	
                	<span class="CarNewColor">所在據點:</span>
                	<select name="branch_name" id="searchBranchSS">
                	        
                	</select>
                	<span class="CarNewColor">車輛狀態:</span>
                	    <select id="car_state" name="car_state" >
						   <option value="良好" ${param.newX=='1'?'selected':''}>良好</option>
						   <option value="維修中" ${param.newX=='2'?'selected':''}>維修中</option>
						</select>
<%--                 	<input class="CarNumsize2" name="car_state" type="text" value="${CarE.car_state}"> --%>
                	<span class="CarNewColor">總評分:</span><input class="CarNumsize2" name="rateX" type="text" value="${CarE.rate}">
                	<span class="CarNewColor">評分次數:</span><input class="CarNumsize2" name="rate_countX" type="text" value="${CarE.rate_count}">
<!--                 	<span class="CarNewColor">照片:</span><input class="CarNumsize" name="car_photoX" type="file" accept="image/*" style="display:inline;"> -->
                	    
                		<select id="newX" name="newX" style="display:inline">
						   <option value="1" ${param.newX=='1'?'selected':''}>新增</option>
						   <option value="2" ${param.newX=='2'?'selected':''}>修改</option>
						</select>
					
                	<input class="buttonmodify" type="submit" value="保存"><br><div><span class="CarNewColor2">${message}</span></div>
                	</form>
                		<table id='car_table' class="display" style="background-color:red">
                		    <thead>
                			<tr><th>車牌號碼</th><th>車型ID</th><th>製造年份</th><th>里程數</th><th>顏色</th><th>單日價錢</th>
<!--                 			<th>照片</th> -->
                			<th>所在據點</th><th>車輛狀態</th>
                			<th>總評分</th><th>評分次數</th>
                			<th>操作</th></tr>
                			</thead>
                			<tbody>
                			<c:forEach var="c" items="${car_list}">
                				<tr style="color:black;background-color:#CCCCFF"><td>${c.car_num}</td><td>${c.model_id}</td><td><fmt:formatDate value="${c.production_date}" pattern="yyyy-MM-dd"/></td><td>${c.mileage}</td><td>${c.color}</td>
                				<td>${c.price_day}</td>
<%--                 				<td><img alt="沒圖片" src="/TestRentalMVC/modelimage/${c.car_photo}" height="200px" width="250px"></td> --%>
                				<td>${c.branch_name}</td><td>${c.car_state}</td>
                				<td>${c.rate}</td>
                				<td>${c.rate_count}</td>
                				<td>
                				<form action="allcarD.controller" method="get">
                				      <input name="allcarNum" type="hidden" value="${c.car_num}">
                				      <input class="buttondelete" type="submit" value="刪除" onclick="subsub(event)">
                				</form>
                				
                				<form action="allcarU.controller" method="get">
                				      <input name="allcarNumU" type="hidden" value="${c.car_num}">
                				      <input class="buttonedit" type="submit" value="編輯">
                				</form>
                	
                				</td></tr>
                			</c:forEach>
                			</tbody>
                		</table>
<!--                 	<span id='table_page'></span>顯示分頁的地方 -->
                	</c:otherwise>
                </c:choose>
                
            </div>
		 <script>
// 			$("#table_source").tablepage($("#table_page"), 8); //8代表每頁顯示8筆
	     </script>
<!--                       改這裡 -->

        </article>
<%--        <%@ include file='/shared/footer.jsp'%> --%>
    </div>
</body>
</html>
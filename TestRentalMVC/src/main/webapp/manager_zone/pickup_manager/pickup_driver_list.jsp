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
    <title>司機名單</title>
    <link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/manager_hf2.css">
    <style>
/*         改這個地方 */
        #manager{background: rgba(255%,18%,18%,0.3);width:1500px;height:1000px;margin:auto;color:white;overflow:auto;}
        #title{height:100px;text-align:center;font-size:4em;}
        .box{background-color:azure;width:200px;height:200px;display:inline-block;font-size:28px;margin:40px;}
        .box span{background-color:yellowgreen;display:block;height:50px;text-align:center;}
        table{margin-left:150px;font-size:2em;}
        table,tr,th,td{border:solid black 2px;border-collapse:collapse;}
        .td{background-color:#E0F8F7;height:200px;width:200px;color:black;text-align:center;}
        .schedule{background-color:#E0F8F7;height:200px;width:800px;color:black;text-align:center;}
        .photo{background-color:white;}
         #bottom{float:right;margin-right:30px;clear:both;}
/*         改這個地方 */
    </style>
    <script>
    function testClick(id){
    	var txt="<div class='schedule'>"
    	var schedule="";
    	
    	$.getJSON("showSchedule.controller?id="+id,function(data){
    		if(data.length==0){
    			/////若沒有行程
    			txt=txt+"目前沒有任何行程";
    		}else{
    			////若有行程
    			for(var i=0;i<data.length;i++){
    				txt=txt+"日期時間："+data[i].start_date+" 從"+data[i].start_location+" 到 "+data[i].end_location+"<br>";
    			}
    		}
    		
    		txt=txt+"</div>";
        	$("#test"+id).html(txt);
    		
    	});
    	
    	
    }
    
    function test2(i){
    	var txt="<div class='td'>222</div>"
    	$("#test"+i).html(txt);
    }
    </script>
</head>
<body>
    <div>
        <header>
			司機名單
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
                <c:if test="${not empty no_driver}"><h1>${no_driver}</h1></c:if>
                <c:if test="${not empty driver_list}">
                	<table>
                		<c:forEach var="driver" items="${driver_list}">
                			<tr>
                				<td><div class="td">司機編號：${driver.id}<br>名字：${driver.name}<br>
                					電話：${driver.phone}</div></td>
                			<td><div class="td"><br><br>
                			<input type="button" value="行程查詢" onclick="testClick(${driver.id})"><br>
                				</div></td><td id="test${driver.id}"></td>
                			</tr>
                		</c:forEach>
                	</table>
                </c:if>
            </div>
		
		
		<div id="bottom"><a href="/TestRentalMVC/manager_zone/pickup_manager/pickup_menu.jsp">
                <img src="/TestRentalMVC/images/backpage120x70.png"></a></div>
		
<!--                       改這裡 -->
        </article>
    </div>
    
</body>
</html>
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
    <title>客戶意見列表</title>
    <link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/manager_hf2.css">
    <style>
/*         改這個地方 */
        #manager{background: rgba(255%,18%,18%,0.3);width:1200px;height:700px;margin:auto;color:black;text-align:center;}
        #title{height:100px;text-align:center;font-size:4em;}
        table{margin:auto;color:black;}
/*         改這個地方 */
    </style>
    <script>
    
    $(document).ready( function () {
        $('#table_id').DataTable({
        	"order":[[4,"desc"]]
        });
        
        /////////////顯示錯誤訊息
        if($("#hiddenError").text().length!=0){
        	
        	setTimeout(function(){
        		alert($("#hiddenError").text());
        	},200);

        }
        
    } );
    
    function showText(id){
    	$.getJSON("showTxt.controller?id="+id,function(data){
    		///////////先清空
    		$("#hiddenTxt").text("");
    		$("#hiddenReply").html("");
    		///////////顯示會員留言及名字
    		$("#hiddenTxt").text(data.txt);
    		$("#dialog").dialog("option","title",data.name+"的意見");
    		//////////管理員回覆(如果有的話)
    		if(data.reply!=null){
    			var reply="<legend>管理員回覆</legend>"+data.reply;
    			$("#hiddenReply").html(reply);
    		}
    	});
    	
        $( "#dialog" ).dialog();
    }
///////////////管理員回覆功能
    function reply(id){	
		$("input[id='id']").val(id);
		///////////設定預設寬度
        $( "#reply" ).dialog({
        	  width: 500
        	});
    }
    </script>
    <link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/datatables.css">
 
<script type="text/javascript" charset="utf8" src="/TestRentalMVC/resources/js/datatables.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/TestRentalMVC/resources/css/jquery-ui.theme.css">
</head>
<body>
    <div>
    <header>
			客戶意見列表
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
                <h4>請點擊標題看內文</h4>
                <c:if test="${not empty zero}">${zero}</c:if>
                <c:if test="${not empty list}">
                	<table id="table_id" class="display" width="100%">
					    <thead>
					        <tr><th>編號</th><th>客戶名字</th><th>Email</th><th>標題</th><th>發文時間</th><th>回覆</th><th>回覆時間</th></tr>
					    </thead>
					    <tbody>
					    	<c:forEach var="list" items="${list}">
					        <tr><td>${list.id}</td><td>${list.name}</td><td>${list.email}</td>
					        	<td><a style="cursor:pointer;" onclick="showText(${list.id})">${list.title}</a></td>
					        	<td><fmt:formatDate pattern = "yyyy年MM月dd號 HH時mm分" value = "${list.datetime}" /></td>
					        	<td><c:if test="${empty list.reply}"><button id="create-user" onclick="reply(${list.id})">回覆</button></c:if></td>
					        	<td><fmt:formatDate pattern = "yyyy年MM月dd號 HH時mm分" value = "${list.re_time}" /></td></tr>
					        </c:forEach>
					    </tbody>
					</table>
                </c:if>
                
            </div>
		<!--  -->
		
		
		<!-- 意見視窗 -->
		<div id="dialog" title="意見" style="display:none;">
  			<p id="hiddenTxt"></p><br><br><fieldset id="hiddenReply"></fieldset>
		</div>
		<!-- 管理員回覆視窗 -->
		<div id="reply" title="管理員回覆" style="display:none;">
		  <p>請輸入回覆</p>
		  <form action="replyOpinion.controller" method="post">
		  	<textarea rows="10" cols="50" name="reply"></textarea><br>
		  	<input id="id" type="hidden" name="id">
		  	<input type="submit" value="確認回覆"> <input type="reset" value="重寫">
		  </form>
		</div>
		
		<!-- 隱藏區塊 錯誤訊息-->
		<p hidden="true" id="hiddenError" >${error}</p>
<!--                       改這裡 -->
        </article>
    </div>
</body>
</html>
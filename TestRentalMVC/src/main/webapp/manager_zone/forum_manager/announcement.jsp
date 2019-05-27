<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty manager_login_ok}">
	<c:redirect url="/manager_zone/manager_login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>建立公告</title>
    <link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"
	href="/TestRentalMVC/resources/css/manager_hf2.css">
  <script src="/TestRentalMVC/resources/ckeditor/ckeditor.js"></script>  
    <style>
/*         CSS改這個地方//////////////////////////// */
/* 		header{height:100px;background-color:highlight;font-size:3em;} */
/* 	 	nav{background-color:antiquewhite;height:40px;}  */
/* 	 	nav span{float:right;margin-right:20px;font-size:2em;border-left:solid black 40px;}  */
		footer{background-color:darkorchid;height:50px;text-align:center;font-size:2em}
        #lefttitle{
        	padding:20px;
        	width:10%;
        	height:500px;
        	float:left;
        	font-size:larger;
        }
        #lefttitle a{
        	width:20%;
        	line-height:30px;
        }
        #midden{
        	float:right;
        	width:88%;
        	margin-right:20px;
        }
        #bigtable{
        	border:1px solid black;
        	width:100%;
        	margin-top:10px;
        }
        #bigtable td{
        	border-bottom:1px solid black;
        	padding:10px 0px 10px 30px;
        }
        #bigtable_head{
        	background-color:#33B3F3;
        	font-size:2em;
        	color:white;
        }
        #bigtable_head td{
        	padding:3px 0px 3px 20px;
        }
        
        
        
        		.button {
		  display: inline-block;
		  border-radius: 4px;
		  background-color: white;
		  border: none;
		  color: black;
		  text-align: center;
		  font-size: 12px;
		  padding: 5px;
		  width: 100px;
		  transition: all 0.5s;
		  cursor: pointer;
		  margin: 5px;
		}
		.button span {
		  cursor: pointer;
		  display: inline-block;
		  position: relative;
		  transition: 0.5s;
		}
		.button span:after {
		  content: '\00bb';
		  position: absolute;
		  opacity: 0;
		  top: 0;
		  right: -20px;
		  transition: 0.5s;
		}
		.button:hover span {
		  padding-right: 25px;
		}
		.button:hover span:after {
		  opacity: 1;
		  right: 0;
		}
		
		
		
        #goodbutton {
 		   padding: 5px 10px; 
   		   background-color: #6FAEDE;
  		   -moz-border-radius: 14px;  
  		   border-radius: 0px;  
 		   text-shadow: #140909 1px 1px 0px; 
 		   color: #EDE6E6; 
 		   font-size: 19px; 
 		   font-family: '微軟正黑體'; 
 		   font-weight: bold;
		}
		#goodbutton:active {
 		   top: 3px; 
 		   position: relative; 
		}
/*         CSS///////////// ///////////////////////*/
    </style>
    
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/nav_with_login.jsp");
      });
    <script>
   	$(function() {
   		htmlobj=$.ajax({url:"remind.controller",async:false});
   	  	var remind = htmlobj.responseText;
   	 	if(remind=='invite'){
   	 		$("#remidpic").html("<img style='width:20px;' src='/TestRentalMVC/images/remind.png'>");
   	 	}
   	});
	</script>
</head>
<body>
    <div>
    <header>
			建立公告
			<div>
				<a href="/TestRentalMVC/manager_zone/manager_zone.jsp"><img
					src="/TestRentalMVC/images/home160x160.png"></a> <span><a
					href="/TestRentalMVC/index.jsp"><img
						src="/TestRentalMVC/images/logout180x130.png"></a></span>
			</div>
		</header>
		<nav></nav>
        <article>
<!--                       HTML改這裡 ////////////////////-->
		<div id="lefttitle">
			<a href="manageArticle.controller"><strong>管理文章</strong></a><br>
			<a href="/TestRentalMVC/manager_zone/forum_manager/announcement.jsp"><strong>建立公告</strong></a><br>
			<a href="handleportmessage.controller"><strong>處理檢舉留言</strong></a><br>
		</div>
		
		<div id="midden">
			<form action="insertannouncement.controller" method="GET">
			<table id="bigtable">
				<tr id="bigtable_head"><td><strong>建立公告</strong></td></tr>
				<tr>
					<td>
						文章標題:<input type="text" name="title" style="width:1590px;">
	            	</td>
	            </tr>
				<tr>
					<td>
			            <textarea name="content" id="content" rows="10" cols="80"></textarea>
			            <script>
							CKEDITOR.replace( 'content', {width:1650,});
						</script>
			            <input id="goodbutton" type = 'submit' value = '送出'>
	            	</td>
	            </tr>
			</table>
			</form>
			<form id="uploadForm" enctype="multipart/form-data">
			<input id="file" type="file" name="file">
			<button id="upload" type="button" onclick="send()">上傳</button>
			</form>
			<div style="border:solid 1px black;width:350px;">
			<div id="bigtable_head">圖片預覽</div>
			<div id="demo" style=""></div>
			</div>
			<a href="/TestRentalMVC/manager_zone/manager_zone.jsp">回到上一頁</a>
		</div>
        </article>
    </div>
    <script>
		function send(){
			$.ajax({
			url: 'uploadavataAJAX.controller',
			type: 'POST',
			cache: false,
			data: new FormData($('#uploadForm')[0]),
			processData: false,
			contentType: false
			}).done(function(res) {
				$('#demo').html("<center><img style='width:300px;height:250px;' src='/TestRentalMVC/testtest/"+res+"'></center>");
			}).fail(function(res) {});
		}
 	</script>
</body>
</html>
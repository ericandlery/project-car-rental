<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:remove var="staff_login_ok" scope="session"/>
<c:remove var="manager_login_ok" scope="session"/>			<!-- 強制登出管理者和門市人員 -->
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
    <script src="/TestRentalMVC/resources/ckeditor/ckeditor.js"></script>
    <style>
/*         CSS改這個地方//////////////////////////// */
        #lefttitle{
        	padding:20px;
        	width:10%;
        	height:500px;
        	float:left;
        	font-size:larger;
        }
        #lefttitle a{
        	width:14%;
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
/*         	border-bottom:1px solid black; */
        	padding:3px 0px 3px 30px;
        }
        #bigtable_head{
        	background-color:#33B3F3;
        	font-size:larger;
        	color:white;
        	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#ff920a+5,ffaf4b+83 */
background: rgb(255,146,10); /* Old browsers */
background: -moz-linear-gradient(top, rgb(255,146,10) 5%, rgb(255,175,75) 83%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, rgb(255,146,10) 5%,rgb(255,175,75) 83%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, rgb(255,146,10) 5%,rgb(255,175,75) 83%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ff920a', endColorstr='#ffaf4b',GradientType=0 ); /* IE6-9 */
        	
        }
/*         #bigtable_head td{ */
/*         	padding:3px 0px 3px 20px; */
/*         } */
        #smalldiv{
        	padding:10px 0px 10px 30px;
        	border:1px solid black;
        	width:100%;
        }
        #messagediv{
        	margin-top:10px;
        	border:1px solid black;
        	width:100%;
        }
        #messagedivin{
        	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#ff920a+5,ffaf4b+83 */
background: rgb(255,146,10); /* Old browsers */
background: -moz-linear-gradient(top, rgb(255,146,10) 5%, rgb(255,175,75) 83%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, rgb(255,146,10) 5%,rgb(255,175,75) 83%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, rgb(255,146,10) 5%,rgb(255,175,75) 83%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ff920a', endColorstr='#ffaf4b',GradientType=0 ); /* IE6-9 */
         	border-bottom:1px solid black; 
        }
        #messagedivdown{
        	padding:20px;
        }
        #goodbutton {
           margin-top:5px;
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
    </style>
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
      });
    </script>
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
<!--                       HTML改這裡 ////////////////////-->
		<div id="lefttitle">
		<a href="/TestRentalMVC/forum/showhotArticle.controller"><strong>熱門文章</strong></a><br>
		<a href="/TestRentalMVC/forum/showmyArticle.controller"><strong>我的文章</strong></a><br>
		<a href="/TestRentalMVC/forum/newarticle.jsp"><strong>建立新文章</strong></a><br>	
		<a href="/TestRentalMVC/forum/showfriend.controller"><strong>好友</strong></a><br>
		<a href="/TestRentalMVC/forum/addnewfriend.jsp"><strong>新增好友</strong></a><br>
		<a href="/TestRentalMVC/forum/searchinvite.controller"><strong>邀請請求</strong></a>
		<span id="remidpic"></span><br>
		</div>
		<div id="midden">
		
		
		<table id="bigtable" border=1 RULES=ROWS>
			<tr id="bigtable_head">
			<td><img style="width:80px;" src="/TestRentalMVC/member_photo/${author.mem_photo}"></td>
				<td>${author.name}</td>
				<td>發表時間:${ab.article_datetime}</td>
			</tr>
		</table>
		<div id="smalldiv">
			<h1>${ab.title}</h1>
			${ab.content}
			<div style="text-align: right; margin-right:50px;;font-size:larger;">
				<c:choose>
					<c:when test="${ab.browse_count>=999999}">
					</c:when>
					<c:otherwise>
						瀏覽人數:${ab.browse_count}		
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>

<%-- 		${ messagelistNULL } --%>
		
		<c:forEach var="row" items="${messagelist}">
			<div id="messagediv">
						<form>
							<input id="mesid" type="hidden" name="messageid" value="${row[4]}">
							<input id="iddd${row[4]}" style="float:right;" onclick="report(${row[4]})" type="button" value="檢舉">
						</form> 
					<div id="messagedivin">
						<img style="width:80px;" src="/TestRentalMVC/member_photo/${row[0]}">
						${row[1]}              回覆時間:${row[3]} 
						
					</div>
					<div id="messagedivdown">${row[2]}</div>
			</div>
		</c:forEach>
		
		
		<table id="bigtable">
			<tr id="bigtable_head"><td>回覆</td></tr>
			<tr>
				<td style="align:center; valign:middle;">
						<form  name = 'form' action = 'addNewMessage.controller' method='post'>
				            <textarea  name="message" id="message" rows="30" cols="80"></textarea>
				            <script>
								CKEDITOR.replace( 'message', {width:1600,});
							</script>
							<input type="hidden" name="title" value="${ab.title}">
				            <input id="goodbutton" type = 'submit' value = '留 言'>
				   		</form>
	   			</td>
	   		</tr>
		</table>
		</div>
        </article>
         <%@ include file='/shared/footer.jsp'%> 
         
    <script>
    	//AJAX檢舉留言
   		function report(idd){
   			var mesid = idd;
   			$.ajax({
   			  method: "POST",
   			  url: "reportMessage.controller",
   			  data: { messageid: idd }
   			})
   			  .done(function( msg ) {
   				  $("#iddd"+mesid).attr("value", "已檢舉");
			});
   		}
   	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        	border-bottom:1px solid black;
        	padding:3px 0px 3px 30px;
        }
        #bigtable_head{
        	font-size:larger;
        	color:white;
        	
			/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#ff920a+5,ffaf4b+83 */
background: rgb(255,146,10); /* Old browsers */
background: -moz-linear-gradient(top, rgb(255,146,10) 5%, rgb(255,175,75) 83%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, rgb(255,146,10) 5%,rgb(255,175,75) 83%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, rgb(255,146,10) 5%,rgb(255,175,75) 83%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ff920a', endColorstr='#ffaf4b',GradientType=0 ); /* IE6-9 */
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
<!--    	自動跳轉頁面 -->
  <% response.setHeader("refresh","3;showhotArticle.controller") ;%>
   	
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
			<tr id="bigtable_head"><td>建立新文章</td></tr>
			<tr><td>文章已建立完成</td></tr>
			<tr><td><img src="/TestRentalMVC/images/ajaxloader1.gif">倒數<span id="totalSecond">2</span>秒後自動跳轉</td></tr>
   		</table>


		</div>
        </article>
        
<!--        倒數計時 -->
<script language="javascript" type="text/javascript">
    var second = document.getElementById('totalSecond').textContent;
    if (navigator.appName.indexOf("Explorer") > -1)
    {
        second = document.getElementById('totalSecond').innerText;
    } else
    {
        second = document.getElementById('totalSecond').textContent;
    }
    setInterval("redirect()", 1000);
    function redirect()
    {
        if (second < 0)
        {
//             location.href = 'http://www.baidu.com';
        } else
        {
            if (navigator.appName.indexOf("Explorer") > -1)
            {
                document.getElementById('totalSecond').innerText = second--;
            } else
            {
                document.getElementById('totalSecond').textContent = second--;
            }
        }
    }
</script>
 <%@ include file='/shared/footer.jsp'%>
</body>
</html>
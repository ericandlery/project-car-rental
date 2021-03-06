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
    <title>管理文章</title>
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
        #lefttitle{
        	padding:20px;
        	width:10%;
        	height:500px;
        	float:left;
        	font-size:larger;
        	color:#545454;
        	font-weight:bold;
        	margin-top:30px;
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
//     	JavaScript改這個地方///////////////////////////////////////


// 		JavaScript////////////////////////////////////////////////
    </script>
</head>
<body>
    <div>
    <header>
                管理文章
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
			<table id="bigtable">
				<tr id="bigtable_head"><td><strong>熱門文章</strong></td></tr>
				<c:choose>
		     		<c:when test="${hotarticlelistNULL=='暫無資料'}">
				        	<tr><td>${ hotarticlelistNULL }</td></tr>
				    </c:when>
				</c:choose>
				<c:forEach var="data" items="${hotarticlelist}">
					<tr>
						<td>
							<form id="formA${data.title}" action="/TestRentalMVC/manager_zone/forum_manager/manageshowArticle.controller" method="post">
								${data.title}
								<input type="hidden" name="title" value="${data.title}">
								<button class="button" style="vertical-align:middle" type="submit" form="formA${data.title}"><span>詳細內容</span></button>
							</form>
							<form style="float:right;" action="/TestRentalMVC/manager_zone/forum_manager/deletethisarticle.controller" method="post">
								<input type="hidden" name="title" value="${data.title}">
								<input id="goodbutton" type="submit" value="刪除文章">
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
			<a href="/TestRentalMVC/manager_zone/manager_zone.jsp">回到上一頁</a>
		</div>
<!--                       HTML/////////////////////////// -->
        </article>
<%-- <%@ include file='/shared/footer.jsp'%> --%>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Upload</title>
<script
	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#image").click(function(){
		$("#image").attr("name","pic");
		$("#video").attr("name","");
		$("#video").val("");
	});
	
	$("#video").click(function(){
		$("#video").attr("name","pic");
		$("#image").attr("name","");
		$("#image").val("");
	});
});

function waitforpic(){
	$("#wait").text("請等候圖片上傳完畢");
}
</script>
</head>
<body>
<h1>測試Spring MVC上傳功能</h1>

<div>
<iframe src="https://www.youtube.com/watch?v=EdQ5PuKfHpI"width="300" height="215" frameborder="0" style="border:0" allowfullscreen></iframe></div>
     </div>           


	<form action="UploadPic.controller" method="post" enctype="multipart/form-data">
		圖檔<input id="image" type="file" name="pic" accept="image/*"><br>
		影片<input id="video" type="file" name="" accept="video/*"><br>
		<input type="submit" value="上傳" onclick="waitforpic()"><br>
		${empty_file}<span id="wait"></span>
	</form><hr>
	<img src="/TestRentalMVC/resources/test_upload/${pic}">
<!-- 	<video width="320" height="240" controls> -->
<%-- 	  <source src="/TestRentalMVC/resources/test_upload/${pic}" type="video/mp4"> --%>
<!-- 	  No Support -->
<!-- 	</video> -->
</body>
</html>
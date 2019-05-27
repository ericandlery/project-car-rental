<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	

</head>
<body>
	<form id="uploadForm" enctype="multipart/form-data">
		<input id="file" type="file" name="file">
		<button id="upload" type="button" onclick="send()">upload</button>
	</form>
	<input type="text">
		<script>
		function send(){
			alert("test");
			$.ajax({
			url: 'uploadavataAJAX.controller',
			type: 'POST',
			cache: false,
			data: new FormData($('#uploadForm')[0]),
			processData: false,
			contentType: false
			}).done(function(res) {
			}).fail(function(res) {});
		}
 	</script>
</body>
</html>
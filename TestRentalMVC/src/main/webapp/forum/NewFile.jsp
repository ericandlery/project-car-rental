<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	照片上傳:
		    <form action="addpicture.controller" method="post" enctype="multipart/form-data">
			上傳檔案名：<input type="text" name="picture_name"><br>
			插入要上傳的圖片：<input type="file" name="file">
			<input type = "submit" value="上傳">
			</form>
			
			<img src='/TestRentalMVC/controller/readpicture.controller?picture_name=images.png'>
			
			
			
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		제목 : ${title}<br>
		<!-- jsp에서는 c드라이브로 직접접근이 불가능하다, 웹컨텐트 안에 있는 폴더에는 접근이 가능-->
		<img src="upload/${filename}" width = "200">
	</body>
</html>
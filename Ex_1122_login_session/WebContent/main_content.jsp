<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--로그인 성공시 전환되는 페이지  -->
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!--외부에 있는 jsp를 현재페이지에 갔다 붙인다.  -->
		<!--메인페이지에 들어오기 전에  check_login.jsp가 먼저 실행된다. -->
		<jsp:include page="check_login.jsp"/>	
		<!--해당 페이지 실행 전에 "jsp:include page="check_login.jsp" 먼저 실행된다  -->	
		메인페이지 <br>
		${user.name}님 환영합니다.
		<input type = "button" value = "로그 아웃" onclick = "location.href='logout.do'">
	</body>
</html>
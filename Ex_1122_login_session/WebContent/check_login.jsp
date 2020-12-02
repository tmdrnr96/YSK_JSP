<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--session영역에 user라는 데이터가 없을 때, 실행되는 if문  -->
<c:if test="${empty sessionScope.user }">
	<script>
		/*로그인이 되어 있지 않으면  login_form.jsp로 페이지가 전환된다. */
		alert("로그인 후 이용 가능한 페이지 입니다.");
		location.href = "login_form.jsp";
	</script>
</c:if>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");	
   	int dan = Integer.parseInt(request.getParameter("dan"));
    
   	String str = "";
   	
   	for(int i = 1; i <= 9; i++){
   		str += String.format("%d * %d = %d<br>", dan, i, dan*i);	
   	}
   	
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<!--전체 데이터가 콜백메서드로 넘어간다.  -->
		<%= str %>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String[] fruit_array = {"사과","배","참외","수박","바나나"};

%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>
	
	<body>
		<!--스크립트릿에 정의한 fruit_array배열을 for문을 사용하여 ul로 표기  -->
			<ul>
				<%for(int i = 0; i < fruit_array.length; i++){%>
				
					<li><%=fruit_array[i]%></li>
					
				<%}%>
			</ul>				
	</body>
</html>
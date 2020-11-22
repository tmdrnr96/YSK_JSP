<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//전송타입이 Post인 경우, 수신된 값의 한글이 포함되어 있다면 모두 깨져서 표시
	//이를 해결하기 위해 수신시 utf-8인코딩 처리를 해줘야한다.
	request.setCharacterEncoding("utf-8");//post로 파라미터를 넘겨줄 때, 써준다..
	
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String tel = request.getParameter("tel");
	
	//이름  홍길동
	//나이 30
	//전화 010-111-1111
%>
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>
	
	<body>
		<table border = "1" style ="border-collapse: collapse;">
			<tr>
				<th>이름</th>
				<td><%=name %></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><%=age %></td>
			</tr>
			<tr>
				<th>전화</th>
				<td><%=tel %></td>
			</tr>
		
		</table>
	
	</body>
</html>
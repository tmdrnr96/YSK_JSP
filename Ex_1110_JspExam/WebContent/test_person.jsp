<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//생성자 객체 생성	
	PersonVO p1 = new PersonVO("홍길동",20,"010-1111-1111");
	PersonVO p2 = new PersonVO("독고길동",30,"010-2222-2222");
	PersonVO p3 = new PersonVO("고길동",25,"010-3333-3333");
	
	//List -> java.util 로 임포트
	List<PersonVO> list = new ArrayList<>(); 
	//ArrayList<PersonVO> list = new ArrayList<>(); 아래보다 위쪽 코드가 속도적으로 더 이득이다.. 
	
	list.add(p1);
	list.add(p2);
	list.add(p3);
	
	//테이블을 만들어서 
	// 이름    나이   전화번호
	//홍길돌     20    010-111...
	//독고길동  30    010-222...
	//고길동     25    010-333...
	
	
	
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>
	
	<body>
		<table border = "1">
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>전화번호</th>
			</tr>
			
			<%for(int i = 0; i < list.size(); i++){%>
			<tr>
				<td><%= list.get(i).getName() %></td>
				<td><%= list.get(i).getAge() %></td>	
				<td><%= list.get(i).getTel() %></td>						
			</tr>		
			<%} %>
		</table>
	</body>
</html>









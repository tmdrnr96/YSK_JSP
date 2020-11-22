<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	//선언영역(선언부) : 변수 또는 메서드를 정의하는 영역(전역변수)
	//전역변수는 브라우저를 새로고침 해도 초기화되지 않는다.
	int n = 0;
	
	Random rnd = new Random();
	
	public int plus(int a, int b){
		
		return a + b;
	}
%>
    
<%
	//스크립트 릿 : 지역변수 개념
	//지역변수는 브라우저를 새로고침 할 때마다 초기화된다.
	int random = rnd.nextInt(10)+1;
	
	System.out.println(random);
	
	int n2 = 0;
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>
	
	<body>
		<!-- 출력코드에서는 세미콜론을 찍지 않는다(;) -->
		<p><%="n++ : " + n++ %></p>
		<p><%="n2++ : " + n2++ %></p>
		<p><%=plus(random,random)%></p>
		
		<!--전역변수는 브라우져가 완전히 끝날 때까지 값이 남아있지만,
			지역변수는 브라우져가 새로고침 할 때마다, 기본값으로 초기화된다.   -->
	</body>
</html>































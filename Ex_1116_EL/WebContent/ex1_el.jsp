<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	//EL(Expression Language) : JSP에서 사용하는 표현식을 더 간결하게 사용하기 위한 표현 언어
	//EL 표기법을 사용하려면 jsp의 내장객체인 4개의 영역(page, request. session, application)
	//에 존재하는 데이터만 EL로써 사용이 가능
	
	//--jsp의 내장영역들
	//1) pageScope : (자바에서 private과 같이 사용됨..(활용빈도 낮음))
	//  - pageScope에 저장된 값은 현재 페이지에서만 EL표기법으로 사용이 가능하다 
	//2) requestScope : 지역변수 개념으로 페이지가 닫히면 종료된다.
	//	- requestScope에 저장된 값은 최대 두개의 페이지에서 값을 공유
	//3) sessionScope : 전역변수 개념으로 브라우져가 완전히 종료되기 전까지 데이터가 유지된다.
	//	- 하나의 웹 브라우저 내에서 값을 공유할 수 있다.
	//	 session을 많이 사용하면 불러온 값이 많아지므로 컴퓨터가 느려지고 메모리낭비가 심하다.
	//	 (메모리 측면에서 static과 비슷함..))
	//4) applicationScope : 하나의 웹 프로젝트에서 값을 공유할 수 있는 구조
	//	(session과 메모리차이가 별로 없으므로  application보다 session을 더 많이씀)
	
	String msg = "안녕";
	
	//jsp의 내장영역인 pageScope에 값을 저장
	// 첫번째 파라미터는 무조건 String타입!
	pageContext.setAttribute("msg", msg);
	//pageScope 안에 있는 msg라는 키값을 가진 값을 출력할 수 있음.
	
	//jsp의 내장영역인 requestScope에 값을 저장(실무에서 가장 많이 쓰는 영역)
	request.setAttribute("msg", "request에 저장된 값");
	//requestScope안에 저장된 값을 출력
	
	//jsp의 내장영역인 sessionScope에 값을 저장(두 번째로 많이 사용하는 영역)
	session.setAttribute("msg2", "세션에 저장된 값");

	
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		JSP표현식: <%= msg %><br>
		EL표현식(pageScope) : ${ pageScope.msg }<br>
		EL표현식(requestScope) : ${ requestScope.msg }<br>
		EL표현식(sessionScope) : ${ sessionScope.msg2 }<br>
		EL표현식(생략식) : ${ msg2 }<br>
		EL표현식(생략식) : ${ msg }<br>
		
	<!-- 생략식의 영역참조 순서  -->
	<!-- 1. pageScope
		 2. requestScope	
		 3. sessionScope
		 4. applicationScope -->
		 
		 <!-- aaa.jsp?age=20 url에 파라미터 이름을 검색하여 해당 값을 가져옴  -->
		 <!--param.age : 파라미터에서 age라는 값을 가져온다.  -->
		 <!--param을 붙이지 않으면, Scope의 값을 가져오려고 하기 때문에 
		 파라미터의 값을 불러오려면 반드시 param을 써줘야한다.  -->
		 EL표현식(파라미터) : ${ param.age }

	
		 
	</body>
</html>













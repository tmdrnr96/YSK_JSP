<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<%
	List<String> sido = new ArrayList<>();
	sido.add("서울");
	sido.add("인천");
	sido.add("광주");
	sido.add("부산");
	sido.add("제주");
	
	request.setAttribute("sido", sido);
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<ul>
		<!--varStatus="cnt" : 0번부터 인덱스가 나온다.  -->
		<!-- count:${cnt.count} : for문이 회전한 횟수 , 1번부터 출력!  -->
		<!--  cnt.index는 index번호 (0번 부터) 
			  cnt.count는 순번(1번 부터)--><!-- varStatus=> cnt가 원래부터 가지고 있던 속성  -->
			<c:forEach var="v" items="${sido}" varStatus="cnt">
				<li>cnt:${cnt.index} / count:${cnt.count} / ${v}</li>			
			</c:forEach>
		
		</ul>	
	</body>
</html>
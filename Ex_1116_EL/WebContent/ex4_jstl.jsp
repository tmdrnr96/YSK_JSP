<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//JSTL (JSP Standard Tag Libray) :
	//연산이나 조건식인 if,for등을 jsp에서 간편하게 사용할 수 있도록 제공되는 라이브러리
%>
     <!-- core라는 라이브러리를 c라는 명칭을 준다. -->
     <!-- core라는 라이브러리 : if문과 forEach 등과 같은 제어문을 사용 가능하게 하는 라이브러리 -->
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <!-- 날짜형식이나 숫자형식을 교정해 주는 라이브러리  --> 
    <!-- fmt(format) 라이브러리: 날짜는 숫자형식의 포멧을 변경하는 라이브러리  -->
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<%

	String[] array = {"사과", "배", "포도", "참외"};
	
	//requestScope영역에 array를 담아준다.
	request.setAttribute("array", array);
	
	Date today = new Date();

	request.setAttribute("today", today);
	
	int money = 1000000000;
	request.setAttribute("money", money);
	
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
		JSTL의 fmt<br>
		<fmt:formatDate value="${today}"/><br>
		<fmt:formatDate value="${today}" pattern="YYYY년 MM월 dd일 hh:mm:ss"/><br>
		잔고 : &#8361;<fmt:formatNumber value="${money}"/>원
		<hr>
	
		JSTL의 forEach문<br>
			<!--향상된 for문 형식이 아닌 일반 자바의for문과 같은 형식  -->
			<!--var : 한바퀴 반복할때마다 변화되는 begin값을 갱신 
				begin : 시작 값 
				end : 끝 값
				step : 증가값-->
			
			<!-- var = "i" begin ="1" : int i = 1; -->
			<!-- end ="5" : 5까지 반복한것인지 -->
			<!-- step="1" : 값을 1개씩 증가시키며 for문을 돌린다.-->

		<ul>
			<c:forEach var = "i" begin ="1" end ="5" step="1">
				<!-- if문안에는 EL표기법으로만 넣을 수 있다.  -->
				<c:if test="${ i mod 2 eq 1 }"><!--홀수만 출력!  -->
					<li>
						<font color = red>안녕(${ i })</font>
					</li>
				</c:if>
				<!-- EL if문은 else가 없다.. 다시 if문을 만들어서 조건을줘야함..-->
				<c:if test="${i mod 2 eq 0 }">
					<font color=blue>안녕(${ i })</font>
				</c:if>
			</c:forEach>
		</ul>
	
		<c:forEach var = "fruit" items="${array}" ><!--Scope에 담겨져 있는 키값!  -->
		<!-- forEach의 var와 Scope영역의 명칭이 같으면 안된다..  -->
			${fruit}<br>
		</c:forEach>
	</body>
</html>



















<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		EL산술연산자<br>
		\${1 + 1} = ${1 + 1}<br>
		\${2 - 1} = ${2 - 1}<br>
		\${10 / 3} = ${10 div 3}<br>	
		\${10 % 3} = ${10 mod 3}<br>	
		<hr>
		
		EL비교 연산자<br>
		
		\${3 > 2 } = ${3 gt 2 }<br>
		\${3 < 2 } = ${3 lt 2 }<br>
		\${3 >= 2 } = ${3 ge 2 }<br>
		\${3 <= 2 } = ${3 le 2 }<br>
		\${3 == 2 } = ${3 eq 2 }<br>
		\${3 != 2 } = ${3 ne 2 }<br>
		<hr>
		
		EL삼항연산자<br>
		<!-- msg라는 파라미터에 값이 비어있나요?  -->
		파라미터 값 : ${empty param.msg ? '1' : '2' }<br>
		<hr>
		
		EL논리연산자<br>
		- and연산자<br>
		\${ 10 > 1 && 2 > 1} : ${ 10 > 1 && 2 > 1 }<br>
		\${ 10 > 1 && 2 > 1} : ${ 10 gt 1 and 2 gt 1 }<br>
		
		- or연산자<br>
		\${ 10 > 1 || 2 < 2} : ${ 10 gt 1 or 2 lt 2 }<br>
		
		\${!true } = ${!true }<br>
		\${!true } = ${not true}<br>
		
	</body>
</html>
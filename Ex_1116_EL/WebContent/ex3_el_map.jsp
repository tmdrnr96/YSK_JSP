<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//EL표기법을 통한 map구조 출력
	HashMap<String, Integer> map = new HashMap<>();
	map.put("k1",20);
	map.put("k2",30);
	map.put("k3",50);
	map.put("k4",100);

	//map은 Scope영역 중 한군데는 담겨져 있어야 EL을 통해 body영역에서 사용이 가능
	//키값은 반드시 String으로만 저장이 가능하고 두번째 파라미터는 오브젝트로 모든값을 다 저장할 수 있다.
	request.setAttribute("myMap", map);
	
	//VO에 담긴 값을 EL을 통해 출력하기
	PersonVO vo1 = new PersonVO("홍길동", 20);
	PersonVO vo2 = new PersonVO("박길동", 25);
	
	request.setAttribute("vo1", vo1);

		List<PersonVO> arr = new ArrayList<>();
		arr.add(vo1);
		arr.add(vo2);
		
		request.setAttribute("list", arr);
		
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		k1 : ${requestScope.myMap.get("k1")}<br>
		k2 : ${myMap.get("k2")}<br>
		k3 : ${myMap["k3"]}<br>
		k3 : ${myMap['k3']}<br><!--쌍따옴표 홑따옴표 같음..  -->
		k4 : ${ myMap.k4 }<br><!-- 가장 많이 쓰임.. -->
		
		<hr>
		<!--vo1.name : 이 코드를 쓰기 위해서는 vo에서 name이라는 변수에 getter가 있어야한다.  -->
		이름 : ${vo1.name}<br><!--gettrt가 없으면 호출할 수 없다..  -->
		나이 : ${vo1.age }<br>
		
		<hr>
		<%= arr.get(0).getName() %><br>
		${ list[0].name }<br>
		${ list[0].age }<br>
	</body>
</html>












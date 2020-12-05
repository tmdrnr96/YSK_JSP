<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		function find() {
			//선택상자 검색!
			var deptno = document.getElementById("deptno").value;
			location.href ="sawonlist.do?deptno="+deptno;
		}
		
		</script>
	</head>
	<body>
		<div align = "center">
			부서명
			<select id = "deptno">
				<option value = "0">부서를 선택하십시오</option>
				<option value = "10">총무부</option>
				<option value = "20">영업부</option>
				<option value = "30">전산부</option>
				<option value = "40">관리부</option>
				<option value = "50">경리부</option>				
			</select>
			
			<input type = "button" value= "검색" onclick = "find();">	
		</div>
		
		<hr>
		
		<table border="1" align = "center">
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>성별</th>
				<th>부서번호</th>
				<th>직책</th>
				<th>입사일</th>
				<th>상사번호</th>
				<th>급여</th>		
			</tr>
			<c:if test = "${!empty list}">
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.sabun}</td>
						<td>${list.saname}</td>
						<td>${list.sagen}</td>
						<td>${list.deptno}</td>
						<td>${list.sajob}</td>
						<td>${list.sahire}</td>
						<td>${list.samgr}</td>
						<td>${list.sapay}</td>
					</tr>			
				</c:forEach>
			</c:if>
		</table>
	</body>
</html>
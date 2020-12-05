<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib  prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		function search() {
			
			if(search == ''){
				search = "all";
			}

			var search = document.getElementById("search").value.trim();	
			location.href = "gogeklist.do?search="+search;
			
		}
		</script>
		
	</head>
	<body>
	<div align = "center">
		지역
		<input id = "search">
		<input type = "button" value = "검색" onclick = "search();">
	</div>
	
	<hr>
	
		<table border = "1" align = "center">
			<tr>
				<th>고객번호</th>
				<th>담당자</th>
				<th>이름</th>
				<th>주소</th>
				<th>주민번호</th>
			</tr>
			<c:if test="${!empty list}">
				<c:forEach var = "list" items="${list}">
					<tr>
						<td>${list.gobun}</td>
						<td>${list.godam}</td>
						<td>${list.goname}</td>
						<td>${list.goaddr}</td>
						<td>${list.gojumin}</td>					
					</tr>			
				</c:forEach>
			</c:if>
			
		</table>
	</body>
</html>
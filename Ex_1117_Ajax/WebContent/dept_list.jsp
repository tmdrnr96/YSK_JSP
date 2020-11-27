<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

    <% 

    DeptDAO dao = DeptDAO.getInstance();//객체 생성
    List<DeptVO> list = dao.selectList();
    
    request.setAttribute("list", list);
    
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
				<th>부서번호</th>
				<th>부서명</th>
				<th>부서지역</th>
			</tr>
			<c:forEach var = "vo" items="${list}"><!--request.setAttribute("list", list); 첫번째 파라미터의 list가 넘어온다.  -->
				<tr>
					<td>${vo.deptno}</td>
					<td>${vo.dname}</td>
					<td>${vo.loc}</td>				
				</tr>
			</c:forEach>
		</table>
	</body>
</html>
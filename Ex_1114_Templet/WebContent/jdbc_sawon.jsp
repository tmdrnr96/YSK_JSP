<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <% 
   	SawonDAO dao = SawonDAO.getInstance();
   List<SawonVO> sawon_list = dao.selectList();
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
				<th>사번</th>
				<th>직책</th>
				<th>이름</th>
			</tr>
			<%
				for(int i = 0; i < sawon_list.size(); i++){
				SawonVO vo = sawon_list.get(i);
			%>
				<tr>
					<td><%= vo.getDeptno()%></td>
					<td><%= vo.getSabun()%></td>
					<td><%= vo.getSajob()%></td>
					<td><%= vo.getSaname()%></td>
				</tr>
			<%} %>
		
		</table>
	
	</body>
</html>
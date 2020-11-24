<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DeptDAO dao = DeptDAO.getInstance();//싱글톤으로 생성!
	List<DeptVO> dept_list = dao.selectList();//DB연결까지 끝!
	
%>
	<!--부서번호 부서명 부서위치  -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border = "1" style = "border-collapse: collapse;">
			<tr>
				<th>부서번호</th>
				<th>부서명</th>
				<th>부서위치</th>
			</tr>
			<%
				for(int i = 0; i < dept_list.size(); i++){
				DeptVO vo = dept_list.get(i); 
			%>
			<tr>
				<td><%=vo.getDeptno() %></td>
				<td><%=vo.getDname() %></td>
				<td><%=vo.getLoc() %></td>
			</tr>				
			<%} %>
			
		</table>
	</body>
</html>
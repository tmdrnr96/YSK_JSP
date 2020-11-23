<%@page import="java.util.List"%>
<%@page import="dao.SungjuckDAO"%>
<%@page import="vo.SungjuckVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    SungjuckDAO dao = SungjuckDAO.getInstance();
    List<SungjuckVO> list = dao.selectList();
    %>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<table border = "1">
		<caption>학생 성적 테이블</caption>
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>총점</th>
			<th>평균</th>
		</tr>
		
		<%for(int i = 0; i < list.size(); i++ ){
			SungjuckVO vo = list.get(i);
			
			int sum = vo.getKor() + vo.getEng() + vo.getMat();
			float avg = (float)sum/3;
		%>
			<tr>
				<td><%=vo.getName() %></td>
				<td><%=vo.getKor() %></td>
				<td><%=vo.getEng() %></td>
				<td><%=vo.getMat() %></td>
				<td><%= sum %></td>
				<td><%= avg %></td>
							
			</tr>
			
			
		<%} %>
		
		</table>
	
	</body>
</html>
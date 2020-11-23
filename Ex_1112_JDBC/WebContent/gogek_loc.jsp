<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.GogekVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	String loc = request.getParameter("loc");
		
	InitialContext ic = new InitialContext();
		
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	DataSource datasource = (DataSource)ctx.lookup("jdbc/oracle_test");

	Connection conn = datasource.getConnection();
	
	String sql = "select * from gogek where goaddr like "+"'%"+loc+"%'";

/* 	System.out.println(sql); */

	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	List<GogekVO> gogek_list = new ArrayList<>();
	
	while(rs.next()){
	
		GogekVO vo = new GogekVO();
		
		vo.setGobun(rs.getInt("gobun"));
		vo.setGoname(rs.getString("goname"));
		vo.setGoaddr(rs.getString("goaddr"));
		vo.setGojumin(rs.getString("gojumin"));
		vo.setGodam(rs.getInt("godam"));
		
		gogek_list.add(vo);
	}
	
	rs.close();
	pstmt.close();
	conn.close();
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border = "1" style = "border-collapse: collapse;">
			<tr>
				<th>고객 번호</th>
				<th>고객명</th>
				<th>주소</th>
				<th>주민번호</th>
				<th>담당자번호</th>
			</tr>
			<%
				for(int i = 0; i < gogek_list.size(); i++){
				GogekVO v = gogek_list.get(i);
			%>
				<tr>
					<td><%=v.getGobun() %></td>
					<td><%=v.getGoname() %></td>
					<td><%=v.getGoaddr() %></td>
					<td><%=v.getGojumin() %></td>
					<td><%=v.getGodam() %></td>
				</tr>
				
			<%} %>
		
		</table>
	<input type ="button" value ="다시 검색" onclick = "history.go(-1)"> 
	<!-- history.go(-1) : 이전 페이지로 돌아가는 메서드 -->
	
	
	</body>
</html>
<%@page import="vo.GogekVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<% 

	InitialContext ic = new InitialContext();

	Context ctx = (Context)ic.lookup("java:comp/env");
	
	DataSource ds = (DataSource)ctx.lookup("jdbc/oracle_test");

	Connection conn = ds.getConnection();
	
	String sql = "select * from gogek";
	
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
		<script type="text/javascript">
		function send(f) {
			
			var loc = f.loc.value;
			
			if(loc==''){
				alert("전송할 지역을 써주세요\n (서울,경기,인천,대구...)");
				f.loc.focus();
				return;
			}

			f.action = "gogek_loc.jsp";
			f.method = "get";
			f.submit();
		}
		
		</script>
		
		</head>
		<body>
		<form> 
			<table border = "1" style = "border-collapse: collapse;">
			<tr>
				<th>고객 번호</th>
				<th>고객명</th>
				<th>주소</th>
				<th>주민번호</th>
				<th>담당자 번호</th>
			</tr>
			<%
			for(int i = 0; i < gogek_list.size(); i++){
				GogekVO v = gogek_list.get(i);
			%>
				<tr>
					<td><%= v.getGobun()%></td>
					<td><%= v.getGoname()%></td>
					<td><%= v.getGoaddr()%></td>
					<td><%= v.getGojumin()%></td>
					<td><%= v.getGodam()%></td>				
				</tr>
			
			<%} %>
	
			</table>	
			<input name ="loc">
			<input type ="button" value = "전송" onclick = "send(this.form)">
		</form>
	</body>
</html>
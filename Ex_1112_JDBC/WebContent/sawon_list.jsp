<%@page import="java.util.ArrayList"%>
<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!-- ?deptno=10 
    	사번 이름 성별 부서번호 직책 입사일 상사번호 연봉 순으로 출력 (테이블로!)-->
    	
<% 
	request.setCharacterEncoding("utf-8");	

	/* String deptno = request.getParameter("deptno"); */
	int deptno =Integer.parseInt(request.getParameter("deptno"));
	
	InitialContext ic = new InitialContext();
	Context ctx = (Context)ic.lookup("java:comp/env");

	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	String sql = "select * from sawon where deptno="+deptno;
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	List<SawonVO> sawon_list = new ArrayList<>();

	while(rs.next()){
		
		SawonVO vo = new SawonVO();
		
		vo.setSabun(rs.getInt("sabun"));
		vo.setSaname(rs.getString("saname"));
		vo.setSagen(rs.getString("sagen"));
		vo.setDeptno(rs.getInt("deptno"));
		vo.setSajob(rs.getString("sajob"));
		vo.setSahire(rs.getString("sahire"));
		vo.setSamgr(rs.getInt("samgr"));
		vo.setSapay(rs.getInt("sapay"));
		
		sawon_list.add(vo);
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
		<table border = "">
		<caption>사원목록</caption>

		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>성별</th>
			<th>부서번호</th>
			<th>직책</th>
			<th>입사일</th>
			<th>상사번호</th>
			<th>연봉</th>
		</tr>
		<%for(int i = 0; i < sawon_list.size(); i++){
			SawonVO sv = sawon_list.get(i);%>
		<tr>
			<td><%= sv.getSabun() %></td>
			<td><%= sv.getSaname() %></td>
			<td><%= sv.getSagen() %></td>
			<td><%= sv.getDeptno() %></td>
			<td><%= sv.getSajob() %></td>
			<td><%= sv.getSahire() %></td>
			<td><%= sv.getSamgr() %></td>
			<td><%= sv.getSapay() %></td>			
		</tr>
		<%}%>
		
		</table>	
	</body>
</html>









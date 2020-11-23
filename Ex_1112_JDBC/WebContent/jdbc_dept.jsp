<%@page import="vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	//모델 1
	//톰캣이 참조할 자원(JNDI 검색)를 가져와야한다.
	InitialContext ic = new InitialContext(); //Context의 참조데이터를 검색할 수 있음.
	Context ctx = (Context)ic.lookup("java:comp/env");//Context의 주소를 넘긴다 
	//ctx는 Context안에 있는  참조 데이터(Resource)를 가져온다.
	
	//검색된 Context에 존재하는  Resource중에 원하는  name값을 검색!
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");//ctx 안에 lookup(name)에 접근한다. 
	//dataSource라는 객체에 이제 연결정보를 가진다. DB의 id와 pwd 등...
	
	//DB연결하기
	Connection conn = dataSource.getConnection();//dataSource의 DB정보를 가지고 DB에 연결한다.
	
	//DB에서 데이터 가져오기
	String sql = "select * from dept"; //DB를 연결한 conn에서 연결할 sql쿼리문
	
	PreparedStatement pstmt = conn.prepareStatement(sql);//해당 sql문장을 실행한다.
	
	//pstmt가 수행한 sql 결과를 가지고 행 단위로 데이터를 불러오기 위한 인터페이스
	ResultSet rs = pstmt.executeQuery();
	
	//부서목록을 저장할 ArrayList를 생성
	List<DeptVO> dept_list = new ArrayList<>(); 
	
	//rs이 next라는 메서드를 만나면 테이블에서 한 행씩 아래로 내려간다
	//while문이 돌아가면서 DB에 있는 데이터를 하나씩 출력하며 (true)
	//더 이상 출력할 내용이 없다면 빠져나온다.(false)
	while( rs.next() == true ){
		
		DeptVO vo = new DeptVO();
		
		vo.setDeptno(rs.getInt("deptno")); //rs에서 int 정수 타입인 "deptno"라는 컬럼의 값을 가져온다.
		vo.setDname(rs.getString("dname"));//rs에서 String 타입인 "dname"이라는 컬럼의 값을 가져와서 vo에 저장한다.
		vo.setLoc(rs.getString("loc"));
	
		dept_list.add(vo);
	}
	
	//DB사용을 완료했다면 DB사용을 완료한 클라이언트의 통로(스트림)를 역순으로 닫아준다.	
	rs.close();
	pstmt.close();
	conn.close();//DB사용을 완료하고 DB를 빠져나간다.
	
/* 	System.out.println("--- 연결성공 ---"); */


	
%>    
    
<!DOCTYPE html>

<!-- 테이블로 DB의 정보를 출력한다.  -->
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		function send(data) {
			
			var f = document.f;
			
			var deptno = f.deptno; //input을 불러오기
			deptno.value = data;//input의 value 값을 data으로 변경
				
			f.action="sawon_list.jsp";
			f.submit();
			
			/* alert(data); */
		}	
		
			
		</script>
	</head>
	<body>
		<form name ="f">
			<table border = "1" style = "border-collapse: collapse;">
				<caption>부서 목록</capction>
				<tr>
					<th>부서번호</th>
					<th>부서이름</th>
					<th>부서위치</th>
				</tr>
				<%
				for(int i = 0; i < dept_list.size(); i++ ){
					DeptVO dv = dept_list.get(i);
				%>				
				<tr>		
					<td><%= dv.getDeptno() %></td>
					<td>
						<!--a태그나 다른 태그에 메서드를 호출하기 위해서는 'javascript:메서드명'을 써줘야한다.  -->
						<a href = "javascript:send('<%=dv.getDeptno() %>');" 
						   style = "text-decoration: none;">
						<%= dv.getDname() %>
						</a>
					</td>
					<td><%= dv.getLoc() %></td>		
							
			   <%-- <td><%=dept_list.get(i).getDeptno() %></td>
					<td><%=dept_list.get(i).getDname() %></td>
					<td><%=dept_list.get(i).getLoc() %></td>	 --%>		
				</tr>		
				<%} %>
			</table>
			
			<input type = "hidden" name = "deptno" > <!--해당 태그가 존재는 하지만 숨겨져 있다.(파라미터를 보내기 위한 용도!)  -->
			
		</form>
	</body>
</html>










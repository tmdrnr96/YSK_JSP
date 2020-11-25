<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    	MemberDAO dao = MemberDAO.getInstance();
    	List<MemberVO> list = dao.selectList();
    
    %>
    
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		
		function del(idx) {
			if(!confirm("삭제하시겠습니까?")){
				return;				
			}
			
			location.href ="member_del.jsp?idx="+idx;
		}
		
		function show_form() {
			
			var disp = document.getElementById("disp");		
			disp.style.display = "block";			
		}
		
		function cancel() {
			var disp = document.getElementById("disp");	
			var disp2 = document.getElementById("disp2");	
			
			disp.style.display = "none";
			disp2.style.display = "none";
			
			document.getElementById("m_name").value ="";
			document.getElementById("m_id").value ="";
			document.getElementById("m_pwd").value ="";
			document.getElementById("m_email").value ="";
			document.getElementById("m_addr").value ="";
			
		}
		
		function send(f) {
			
			var name = f.name.value.trim();
			var id = f.id.value.trim();
			var pwd = f.pwd.value.trim();
			var email = f.email.value.trim();
			var addr = f.addr.value.trim();
			
			if(name == ""){
				alert("이름은 필수 입력사항입니다.");
				return;
			}
			
			if(id == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			
			if(pwd == ""){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			var parttern =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if(!parttern.test(email)){
				alert("이메일을 바르게 입력해주세요");
				return;
			}
			
		
			f.method = "post";
			f.action = "member_register.jsp";
			f.submit();
		}
		
		function update(idx, name, id, pwd, email, addr) {
	
			document.getElementById("u_idx").value = idx;
			document.getElementById("u_name").value = name;
			document.getElementById("u_id").value = id;
			document.getElementById("u_pwd").value = pwd;
			document.getElementById("u_email").value = email;
			document.getElementById("u_addr").value = addr;
			
			var disp2 = document.getElementById("disp2");

			disp2.style.display = "block";
			
		}
		
		function send2(f) {
			
			
			f.action = "member_update.jsp";
			f.method = "post";
			f.submit();
			
		}
		
		</script>
	</head>
	<body>
		<table border = "1" align = "center">
		<caption>:::회원 목록:::</caption>
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th colspan = "32">주소</th>
					
			</tr>	
				<%
				for(int i = 0; i <list.size(); i++  ){
					MemberVO vo = list.get(i);	
				%>
			<tr>
				<td><%=vo.getIdx() %></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getId() %></td>
				<td><%=vo.getPwd() %></td>
				<td><%=vo.getEmail() %></td>
				<td><%=vo.getAddr() %></td>
				<td>
				<input type = "button" value = "삭제" onclick = "del(<%=vo.getIdx()%>);">
				<input type = "button" value = "수정" onclick = "update('<%=vo.getIdx()%>',
																		'<%= vo.getName()%>', 
																		'<%= vo.getId()%>',
																		'<%= vo.getPwd()%>',
																		'<%= vo.getEmail()%>',
																		'<%=vo.getAddr()%>');">
				</td>
			</tr>	
				<%} %>
			<tr>
				<td colspan = "7" align = "center">
					<input type = "button" value = "추가" onclick = "show_form();">
				</td>
			</tr>										
				
		</table>	
			
			<div id = "disp" style = "display: none;" align = "center">	
			<form>	
				<table border = "1">
					<caption>::: 회원 정보 추가:::</caption>
					<tr>
						<th>이름</th>
						<td><input id = "m_name" name = "name"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input id = "m_id" name = "id"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type = "password" id = "m_pwd" name = "pwd"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input id = "m_email" name = "email"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input id = "m_addr" name = "addr"></td>
					</tr>
					<tr>
						<td colspan = "2" align="center">
							<input type = "button" value = "등록" onclick = "send(this.form);">
							<input type = "button" value = "취소" onclick = "cancel();">
						</td>						
					</tr>
				</table>
			</form>	
		</div>
		
		<div id = "disp2" style = "display: none;" align = "center">	
			<form>	
					<input type ="hidden" id = "u_idx" name = "idx">
				
				<table border = "1">
				
					<caption>::: 회원 정보 수정:::</caption>										
					<tr>
						<th>이름</th>
						<td><input id = "u_name" name = "name"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input id = "u_id" name = "id" value= "111"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type = "password" id = "u_pwd" name = "pwd"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input id = "u_email" name = "email"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input id = "u_addr" name = "addr"></td>
					</tr>
					<tr>
						<td colspan = "2" align="center">
							<input type = "button" value = "수정" onclick = "send2(this.form);">
							<input type = "button" value = "취소" onclick = "cancel();">
						</td>						
					</tr>
				</table>
			</form>	
		</div>
	</body>
</html>
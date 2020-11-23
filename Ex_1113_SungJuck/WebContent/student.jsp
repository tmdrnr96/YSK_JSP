<%@page import="vo.SjVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
/*view를 이용한 조회!  */
	SjDAO dao = SjDAO.getInstance();
	List<SjVO> list = dao.selectList();

/* 	int total;
	float avg; */
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function del(no) {
					
			if(!confirm("정말 삭제하시겠습니까?")){
				return;
			}
			
			//페이지 전환(GET방식으로만 전달이 가능!)
			//form태그 없이 다른 JSP파일로 값 보내기!
			location.href = "sung_del.jsp?no="+no;
		}//del
	
		//입력창 보여주기
		function show_form() {
			
			var disp = document.getElementById("disp"); 
			disp.style.display = "block";	
			
		}//show_form
		
		//입력창 숨기기
		function cancel() {
			
			var disp = document.getElementById("disp");
			var disp2 = document.getElementById("disp2");
			
			disp.style.display = "none";
			disp2.style.display = "none";
			
			//취소를 누를시 입력상자 안에 입력했던 데이터를 날린다.
			var m_name = document.getElementById("m_name").value = "";
			var m_kor = document.getElementById("m_kor").value = "";
			var m_eng = document.getElementById("m_eng").value = "";
			var m_mat = document.getElementById("m_mat").value = "";
			
		}//cancel
		
		//학생등록하기
		function send(f) {
			
			var name = f.name.value.trim();
			var kor = f.kor.value.trim();
			var eng = f.eng.value.trim();
			var mat = f.mat.value.trim();
			
			//유효성 체크!		
			var num = /^[0-9]{1,3}$/;
			
			if(!num.test(kor) || kor < 0 || kor > 100){
				alert("성적은 0 ~ 100점까지만 입력이 가능합니다.");
				return;
			}
			
			if(!num.test(eng) || eng < 0 || eng > 100){
				alert("성적은 0 ~ 100점까지만 입력이 가능합니다.");
				return;
			}
			
			if(!num.test(mat) || mat < 0 || mat > 100){
				alert("성적은 0 ~ 100점까지만 입력이 가능합니다.");
				return;
			}
			
			if(name == ""){
				alert("이름을 입력하세요");
				return;
			}
			
			f.action = "sung_register.jsp";
			f.method = "post";
			f.submit();
			
		}//send
		
		//학생정보 수정 폼 띄우기
		function update(no, name, kor, eng, mat) {
		
			
			var disp2 = document.getElementById("disp2");
			disp2.style.display = "block";	
		
			document.getElementById("u_no").value = no;
			document.getElementById("u_name").value = name;
			document.getElementById("u_kor").value = kor;
			document.getElementById("u_eng").value = eng;
			document.getElementById("u_mat").value = mat;
			
			
		}
		
		//학생정보 수정!!
		function send2(f) {
			
			//유효성체크!
			
			f.action = "sung_update.jsp";
			f.submit();
		}
		
	</script>
	</head>
	<body>
		<table border = "1" align = "center">
		<caption>:::학생정보:::</caption>
			<tr>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>총점</th>
				<th>평균</th>
				<th>등수</th>
				<th colspan="2">비고</th>	
			</tr>
			<%for(int i = 0; i < list.size(); i++){
				SjVO vo = list.get(i);
			%>
			<tr>
				<td><%= vo.getName() %></td>
				<td><%= vo.getKor() %></td>
				<td><%= vo.getEng() %></td>
				<td><%= vo.getMat() %></td>
				<td><%= vo.getTotal() %></td>
				<td><%= vo.getAvg()%></td>
				<td><%= vo.getRank() %></td>
				<td>
					<input type = "button" value="삭제" onclick = "del('<%=vo.getNo()%>');">
					<input type = "button" value ="수정" onclick = "update('<%=vo.getNo()%>',
																		  '<%=vo.getName()%>',
																		  '<%=vo.getKor() %>',
																		  '<%=vo.getEng()%>', 
																		  '<%=vo.getMat()%>');">
				</td>
			</tr>
			<%} %>
				<tr>
					<td colspan="8">
						<input type = "button" value ="추가" id= "bt_append"
							onclick = "show_form();">
					</td>
				</tr>	
		</table>
		
		<!-- 학생정보 입력 폼 -->
		<!-- style = "display: none; -> div 자체가 숨겨진다.  -->
		<div id = "disp" style = "display: none;">
			<form>
				<table border = "1" align = "center">
					<caption>:::성적 추가하기:::</caption>
					
					<tr>
						<th>이름</th>
						<th><input name = "name" id = "m_name"></th>
					</tr>
					<tr>
						<th>국어</th>
						<th><input name = "kor" id = "m_kor"></th>
					</tr>
					<tr>
						<th>영어</th>
						<th><input name = "eng" id = "m_eng"></th>
					</tr>
					<tr>
						<th>수학</th>
						<th><input name = "mat" id = "m_mat"></th>
					</tr>
					
					<tr>
						<td colspan = "2" align = "center">
							<input type = "button" value = "추가" onclick="send(this.form);">
							<input type = "button" value = "취소" onclick="cancel();">
						</td>
					</tr>
				</table>
			</form>		
		</div>
		
		<!-- 학생정보 수정  폼-->

		<!-- style = "display: none; -> div 자체가 숨겨진다.  -->
		<div>
		<div id = "disp2" style = "display: none;">
			<form>
				<!-- 인덱스를 이용해 수정할 행을 알아내기 떄문에 index는 필요히다.  -->
				<input type = "hidden" name = "no" id ="u_no">
				
				<table border = "1" align = "center">
					<caption>:::학생정보를 수정하세요:::</caption>
					
					<tr>
						<th>이름</th>
						<td><input name = "name2" id = "u_name"></td>
					</tr>
					
					<tr>
						<th>국어</th>
						<td><input name = "kor2" id = "u_kor"></td>
					</tr>
					
					<tr>
						<th>영어</th>
						<td><input name = "eng2" id = "u_eng"></td>
					</tr>
					
					<tr>
						<th>수학</th>
						<td><input name = "mat2" id = "u_mat"></td>
					</tr>
					
					<tr>
						<td colspan = "2" align = "center">
						<input type = "button" value = "수정" onclick = "send2(this.form);">
						<input type = "button" value = "취소" onclick = "cancel();">
					</td>
					</tr>
				</table>
			</form>		
		</div>
		</div>
	</body>
</html>
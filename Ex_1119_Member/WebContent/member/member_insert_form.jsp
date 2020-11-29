<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>		
		<!--ajax사용을 위한 준비 단계  -->
		<!-- member파일에서 나와서 js파일로! ../위의 파일로.. -->
		<script src="../js/httpRequest.js"></script>
		<script type="text/javascript">
		
		//아이디 중복여부 체크
		
		var b_idCheck = false;
		
		function check_id() {
			
			
			var id = document.getElementById("id").value.trim();
			
			if(id == ""){
				alert("아이디를 입력하세요");
				return;
			}
			//id를 Ajax를 통해서 서버로 전송
			var url = "check_id.do";
			//encodeURIComponent : id에 !, @, #와 같은 특수문자가 들어가 있을 경우 정상 전송을 위한 메서드
			var param = "id=" + encodeURIComponent(id);
			
			sendRequest(url,param,myFunc,"post");
		}
		
		function myFunc() {
			
			if(xhr.readyState == 4 && xhr.status == 200){				
				var data = xhr.responseText;
				/* alert(data); */
				/*넘어온 data는 문자열 형식이지 실제 제이슨 데이터가 아니다.  */
				var json = eval(data); //data를 실제json타입으로 변경!
				
				//JSON타입의 배열로 넘어온 res값이 'no'인 경우!				
				if(json[0].res == 'no'){
					alert("이미 사용중인 아이디입니다.");
					return;
				}
				alert("사용 가능한 아이디 입니다.");
				//send버튼 클릭시 insert가 가능하도록! true로 값 변경
				b_idCheck = true;
				
				//사용가능한 아이디라면 input을 readOnly처리
				document.getElementById("id").readOnly = true;
			}
		}
		
		
		function send(f) {
			//유효성체크
			if(!b_idCheck){
				alert("아이디 중복체크를 하세요");
				return;
			}
			
			f.action = "insert.do;"
			f.method = "post";
			f.submit();
			
		}//send()
		
		</script>
	</head>
	<body>
		<form>
			<table border = "1" align = "center"> 
				<caption>:::회원가입:::</caption>
				<tr>
					<th>이름</th>
					<td><input name="name"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input name = "id" id="id">
						<input type = "button" value = "중복체크" onclick = "check_id();">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type = "password" name = "pwd"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name = "email"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name = "addr"></td>
				</tr>	
				<tr>
					<td colspan = "2" align = "center">
						<input type = "button" value ="가입" onclick = "send(this.form);">
						<input type = "button" value ="취소" onclick = "location.href='member_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
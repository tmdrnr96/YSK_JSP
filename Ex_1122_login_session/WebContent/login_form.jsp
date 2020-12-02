<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="js/httpRequest.js"></script>
		<script type="text/javascript">
		function send(f) {
			
			var id = f.id.value.trim();
			var pwd = f.pwd.value.trim();
			
			if(id == ""){
				alert("아이디는 필수입니다.");
				return;
			}
			
			if(pwd == ""){
				alert("비밀번호를 입력해주세요");
				return;
			}
			
			/*로그인 실패했을 때, 로그인 안에있는 값이 날아가지 않게!! 만들기 위해 AJAX로 만든다.  */
			var url ="login.do";
			/*특수문자가 입력이 될 수 있기 때문에 encodeURIComponent()로 입력해준다.  */
			var param ="id="+encodeURIComponent(id)+"&pwd="+encodeURIComponent(pwd);
				
			sendRequest(url,param,resultFn,"post");
			
		}
		
		function resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
			
				var data = xhr.responseText;
				var json = eval(data);
				
				if(json[0].param == "no_id"){
					alert("아이디가 존재하지 않습니다.");
					
				}else if(json[0].param == "no_pwd"){
					alert("비밀번호가 일치하지 않습니다.");
					
				}else{
					location.href="clear.do";
				}
			}
		}
		
		</script>
	</head>
	<body>
		<form>
			<table border = "1" align = "center">
				<caption>:::로그인:::</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input name="id">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd">
					</td>
				</tr>				
				<tr>
					<td colspan = "2" align = "center">
						<!--this.form을 보내 수 있는 것은 input태그 뿐이다!!  -->
						<input type="button" value="로그인" onclick="send(this.form);">
						<!-- type="reset" : input의 입력값을 모두 지워주는 역할을 한다.. -->
						<input type="reset" value="취소">			
					</td>
				</tr>				
				
			</table>
		</form>
	</body>
</html>
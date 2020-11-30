<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script type="text/javascript">
		
		function send( f ) {
			
			var title = f.title.value.trim();
			var pwd = f.pwd.value;
			var photo = f.photo.value;
			
			//유효성체크
			if(title == ''){
				alert("제목을 입력하세요!");
				return;
			}
			
			if(pwd == ''){
				alert("비밀번호를 입력하세요");
				return;
			}
	
			if(photo == ''){
				alert("사진은 반드시 선택해야 합니다.");
				return;
			}
			
			f.submit();
		}		
		</script>
		
	</head>
	<body>
		<form action = "insert.do"
				method ="post"
				enctype = "multipart/form-data">
				<!--	method ="post"
						enctype = "multipart/form-data"  
						파일을 파라미터로 보내고자 할 때, 이 두가지는 반드시 필수!!-->
				<table border = "1" align = "center">
					<caption>::: 사진 등록 :::</caption>
					<tr>
						<th>제목</th>
						<td><input name = "title"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input name = "pwd" type = "password"></td>
					</tr>
					<tr>
						<th>업로드 사진</th>
						<td><input type = "file" name = "photo"></td>
					</tr>
					<tr>
						<td colspan ="2" align ="center">
							<input type = "button" value = "등록하기" onclick="send(this.form);">
							<input type = "button" value = "목록으로" onclick="location.href='list.do'">
						</td>
					</tr>
				</table>		
		
		</form>
	</body>
</html>
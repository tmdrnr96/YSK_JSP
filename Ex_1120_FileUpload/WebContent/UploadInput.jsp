<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		function send( f ) {
			
			//유효성체크(무결성 체크)
			var title = f.title.value.trim();
			var photo = f.photo.value; //파일이 선택되어 있을때는 사진의 정보가 파라미터로 넘어온다.
			
			if(title == ''){
				alert("제목을 입력하세요");
				return;
			}
			
			//photp에 사진이 선택되지 않았다면..
			if(photo == ''){
				alert("파일을 선택해야 합니다.");
				return;
			}
			
			f.action = "upload.do";
			f.submit();			
		}	
		
		</script>
	</head>
	<body>
		<!-- file을 업로드하기 위한 form태그에 필요한 두 가지 속성
		method(전송방식) : post (get으로 넘길시 오류..) 
		enctype(폼 전송시 사용할 인코딩 타입 ) : multipart/form-data -->
		<!--file을 파라미터로 보내기 위함..(form태그로 보내기 위함..)  -->
		<form method = "post"
				enctype="multipart/form-data">
				
			제목 : <input name = "title"><br>
			첨부 : <input type = "file" name = "photo"><br>
			<input type = "button" value="업로드" onclick="send(this.form);">
		</form>	
	</body>
</html>
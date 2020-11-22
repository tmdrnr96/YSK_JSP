<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function send(f){
				
				var name = f.name.value.trim();
				var age = f.age.value.trim();
				var tel = f.tel.value.trim();

				//유효성체크
				if(name == ''){
					alert("이름을 입력해주세요!");
					f.name.focus();
					return; //return이 없으면 alert을 실행하고 아래로 내려간다.
				}
				
				var age_pattern = /^[0-9]{1,3}$/; // 1~3자리 수까지 정수로 입력 가능
				if(!age_pattern.test(age)){
					alert("나이는 정수로 입력해주세요!");
					return;
				}
				
				var tel_pattern = /^\d{3}-\d{3,4}-\d{4}$/;
				
			 	if(!tel_pattern.test(tel)){
					alert("전화번호는 -를 포함해 12 ~ 13자리여야 합니다.");
					return;
				}
				 
				
				
				f.action="param_out.jsp";//해당 jsp파일로!
				f.method = "post";
				f.submit();
			}
		
		</script>		
	</head>
	<body>
		<form>
			이름 : <input name="name"><br>
			나이 : <input name = "age"><br>
			전화 : <input name = "tel"><br>
			
			<input type = "button" value = "파라미터 전달" onclick = "send(this.form)">
		</form>
	</body>
</html>
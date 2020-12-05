<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		function send_check() {
			//input을 제외하고는 파라미터로 보낼 수 없기 때문에 document로 받아준다.
			var f = document.f;
			
			if(f.subject.value == ""){
				alert("제목을 입력하세요!");
				return;
			}
			
			if(f.name.value == ""){
				alert("작성자를 입력하세요");
				return;
			}
			
			if(f.content.value.trim() == ""){
				alert("내용은 한 글자 이상 입력해야 합니다.");
				return;
			}
			
			if(f.pwd.value.trim() == ""){
				alert("비밀번호를 입력하세요!");
				return;
			}
			
			f.submit();
			
		}
		</script>
	
	</head>
	<body>
		<table border = "1" align = "center">
			<caption><h2>::: 답변 등록 :::</h2></caption>
			<form name = "f" method = "post" action="reply.do">
							<!--${param.idx} : 넘어온 파라미터 중에서  idx의 값! -->
				<input type = "hidden" name = "idx" value="${param.idx}">
				<tr>
					<th width = "120">제목</th>
					<td>
						<input name = "subject" style = "width:250px;">
					</td>
				</tr>
				
				<tr>
					<th width = "120">작성자</th>
					<td>
						<input name = "name" style = "width:250px;">
					</td>
				</tr>
				
				<tr>
					<th width = "120">내용</th>
					<td>						<!--세로 10 (엔터로 10번), 가로는 70글지가 들어갈정도  -->
						<textarea name = "content" rows="10" cols="70"></textarea>
					</td>
				</tr>
				
				<tr>
					<th width = "120">비밀번호</th>
					<td>
						<input name = "pwd" type = "password" style = "width:250px;">
					</td>
				</tr>
				
				<tr>
					<td align = "center" colspan = "2">								<!-- style="cursor:pointer ==> 커서가 손가락 모양으로 바뀜 -->
						<img src="../img/btn_reg.gif" onclick = "send_check();" style="cursor:pointer;">
						<img src="../img/btn_back.gif " onclick="location.href = 'boardList.do'" style = "cursor:pointer;">
					</td>
				</tr>
				
			</form>
		</table>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="../js/httpRequest.js"></script>
		<script type="text/javascript">
		function del(f) {
			
			var idx = f.idx.value; //삭제하고자하는 이미지의 일렬번호
			var pwd = f.pwd.value; //등록할때 써놓은 원본 비밀번호
			var pwd2 = f.pwd2.value; //삭제하기 위해 사용자가 입력한 비밀번호
			var filename = f.filename.value;
			
		if(pwd != pwd2){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}	
		
		if(!confirm("정말로 삭제하시겠습니까?")){
			return;
		}
		
		var url = "photo_del.do";
		var param = "idx="+idx+"&filename="+encodeURIComponent(filename);
		
		sendRequest(url,param,resultFuncion,"post");
		
		}
		
		function resultFuncion() {
			
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var data = xhr.responseText;
				//json형태의 data를 실제 JSON타입으로 바꿔준다.
				var json = eval(data);
				//json = [{'param':'yes'}]
				
				if(json[0].param == 'yes'){
					alert("삭제 성공");
				}else{
					alert("삭제실패, 관리자에게 문의하세요");
				}
					location.href = "list.do";
			}
		}
		</script>
		<!--외부 스타일 시트 참조 하기!  -->
		<link rel = "stylesheet" href = "../css/photo.css">
		
	</head>
	<body>
		<div id = main_box>
			
			<h1 align = "center">:::PhotoGalley:::</h1>
			
			<div align = "center" style = "margin:10px;">
				<input type = "button" value = "사진등록" onclick = "location.href='insert_form.do'">
			</div>		
			<div id = photo_box>
				
				<!-- requestScop에서 가져온 값이 빈값이라면.. -->
				<c:if test="${empty list}">
					<div align = "center">등록된 사진이 없습니다.</div>
				</c:if>
			
				<c:forEach var = "vo" items = "${list}">
				
					<div class = "photo_type">
						<img src = "../upload/${vo.filename }">
						
						<div class = title>${vo.title}</div>						
						<form>
							<div align = "center">
								<input type = "hidden" name = "idx" value = "${vo.idx}"><!--일련번호-->
								<input type = "hidden" name = "pwd" value = "${vo.pwd}">
								<input type = "hidden" name = "filename" value = "${vo.filename}">
								
								<input type= "password" name ="pwd2" size = "10">
								<input type = "button" value = "삭제" onclick = "del(this.form);">
							</div>
						</form>
					</div>
				</c:forEach>
			</div>				
		</div>	
	</body>
</html>
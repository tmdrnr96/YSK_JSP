<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!--../ : 한단계 밖으로 나간다.  -->
		<!-- js/httpRequest.js 이렇게 써주면 현재 페이지가 위치하는 member폴더 안에! 있다고 생각하기 떄문에 한단계 밖으로 경로를 잡아준다. -->
		<script src= "../js/httpRequest.js"></script>
		<script type="text/javascript">
		
		function del(idx) {
			
			if(!confirm("정말 삭제하시겠습니까?")){
				return; //지우지 않는다.
			}	
			
			//지우고자하는 멤버의 idx를 Ajax를 통해 member_del.do로 전달하여
			//'삭제성공' 혹은 '삭제실패'라는 경고창을 띄워주세요.
			
			var url ="member_del.do";
			var param = "idx="+idx;
			
			sendRequest(url,param,resultFn,"get");
			
		}
		
		function resultFn() {
			
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var data = xhr.responseText;//서블릿에서 도착한 데이터를 받는다			
				//콜백 메서드로  돌아온 값을 xhr.responseText를 통해 data에 담아줌
				
				//"[{'res':'yes'}]"와 같은 문자열로 넘어오기 때문에 eval로 
				//완전한 JSON타입으로 만들어준다.
				
				var json = eval(data);
				//문자열타입으로 있는 data를 실제 Json타입으로 바꿔준다.
				
				//배열 타입으로 넘어온 json의 0번째 index에 있는 res값을 불러온다.
				/* if(json[0].res == 'no'){
					alert("삭제 실패");
					return;
				}
				
				alert("삭제 성공");
				
				location.href="member_list.do"; */
				
				if(json[0].res == 'yes'){
					alert("삭제 성공");				
					location.href="member_list.do"; 					
				}else{
					alert("삭제 실패");
				}
				
				
			}
		}
		
		
		</script>
	</head>
	<body>
		<table border = "1" align = "center">
			<caption>:::회원목록:::</caption>
		<tr>
			<td colspan = "7">
				<input type = "button" value = "회원가입" onclick = "location.href='member_insert_form.jsp'">
			</td>
		</tr>
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th colspan ="2">주소</th>
						
			</tr>

			<c:forEach var = "vo" items = "${list}">
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.name}</td>
					<td>${vo.id}</td>
					<td>${vo.pwd}</td>
					<td>${vo.email}</td>
					<td>${vo.addr}</td>
					<td>
						<input type = "button" value = "삭제" onclick = "del('${vo.idx}');">
					</td>
				</tr>	
			</c:forEach>
		
		</talble>
	</body>
</html>



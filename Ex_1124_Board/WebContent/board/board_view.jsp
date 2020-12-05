<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="../js/httpRequest.js"></script>
		
		<script type="text/javascript">
		
		function reply() {
			
			//해당인덱스의 게시글에 댓글을 단다.
			location.href ="reply_form.do?idx=${vo.idx}"
		}
		
		function del() {
			if(confirm("정말 삭제하시겠습니까?")){
				var pwd = document.getElementById("c_pwd").value.trim();
			
				if(pwd != "${vo.pwd}"){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
			
				var url = "del.do";
				var param = "idx=${vo.idx}";
				
				sendRequest(url, param, resultFn, "post");
			}		
		}//del
		
		function resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var data = xhr.responseText;
				if(data == 'yes'){
					alert("글을 삭제했습니다.");
					location.href="boardList.do"
				}
			}
		}
		
		</script>
		
	</head>
	<body>
		<form name = "f" method ="post">
			<table border = "1" align = "center">
			<caption><h2>::: 게시글 상세보기 :::</h2></caption>
				<tr>
					<th width ="120" height="25">제목</th>
					<td width = "250">${vo.subject}</td>
				</tr>
				
				<tr>
					<th width ="120" height="25">작성자</th>
					<td width = "250">${vo.name}</td>
				</tr>
				
				<tr>
					<th width ="120" height="25">작성일</th>
					<td width = "250">${vo.regdate}</td>
				</tr>

				<tr>
					<th width ="120" height="25">ip</th>
					<td width = "250">${vo.ip}</td>
				</tr>
				
				<tr>
					<th width ="120">내용</th>		<!--\<pre> 엔터값 포함..  -->
					<td width = "250" height = "250"><pre>${vo.content}</pre></td>
				</tr>
				
				<tr>
					<th width ="120">비밀번호</th>
					<td width = "250">
						<input type = "password" id = "c_pwd">
					</td>
				</tr>
				
				<tr>
					<td colspan = "2" align ="center">
						<!--목록으로 돌아가기  -->
						<img src = "../img/btn_list.gif" onclick = "location.href ='boardList.do'">
						
						<!-- depth가 0일 경우 허용! 대댓글은 답글을 남기지 못한다.   -->
						<c:if test = "${vo.depth lt 1}">
						<!--답글  -->
							<img src = "../img/btn_reply.gif" onclick = "reply();">
						</c:if>
						
						<!--수정  -->
						<img src = "../img/btn_modify.gif" onclick = "modify();">
						
						<!--삭제  -->
						<img src = "../img/btn_delete.gif" onclick = "del();">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>
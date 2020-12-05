<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border = "1" width = "700" align = "center">
			<tr>
				<td colspan ="5">
					<img alt="" src="../img/title_04.gif">
				</td>
			</tr>
			<tr>
				<th width = "10%">번호</th>
				<th >제목</th>
				<th width = "15%">작성자</th>
				<th width = "25%">작성일</th>
				<th width = "10%">조회수</th>
			</tr>
			<c:forEach var = "list" items = "${list}">
				<tr>
					<td align = "center">${list.idx}</td>
			
					
					<td>
						<!--댓글일 경우에 들여쓰기  -->
						<c:forEach begin = "1" end = "${list.depth}">
							<!--띄어쓰기 엔티티 코드  -->
							<!--depth가 0d이면 띄어쓰기를 안함, depth의 수만큼 띄어쓰기  -->
							&nbsp;
						</c:forEach>
						
						<!--댓글 기호  -->
						<!--depth가 0이 아니라면..ㄴ을 넣는다.  -->
						<c:if test="${list.depth ne 0 }">
							ㄴ
						</c:if>
						<!--삭제된 글은 클릭이 불가  -->
						<c:if test ="${list.del_info eq -1}">
							<span style="color:gray;">
								${list.subject}
							</span>
						</c:if>
						
						<!--삭제되지 않은 글은 클릭가능  -->
						<c:if test ="${list.del_info ne -1}">
							<a href="view.do?idx=${list.idx}">
								${list.subject}
							</a>
						</c:if>
					</td>
					<td align = "center">${list.name}</td>
					<td align = "center">${list.regdate}</td>
					<td align = "center">${list.readhit}</td>
				</tr>
			</c:forEach>
		
			<!--게시판 페이지 갯수 표시  -->
			<tr>
				<td colspan = "5" align = "center">
					◀ 1 2 3  ▶
				</td>
			</tr>
			
			<tr>
				<td colspan = "5" align = "right">
					<img src="../img/btn_reg.gif" onclick = "location.href='insert_form.do'" style="cursor:pointer">
				</td>
			</tr>
			<!--게시판에 게시글이 한개도 없는 경우  -->
			<c:if test="${empty list}">
				<tr>
					<td colspan = "5" align = "center">
						현재 등록된 게시글이 없습니다.
					</td>
				</tr>
			</c:if>
		</table>
	</body>
</html>
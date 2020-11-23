<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    //한글 깨짐 방지
    request.setCharacterEncoding("utf-8");
    
    //sung_del.jsp?no=1
    int no = Integer.parseInt(request.getParameter("no"));
    
    //해당 번호의 학생의 data를 지우고 싶을 때! 학생번호를 파라미터로 보내준다.
    int res = SjDAO.getInstance().delete(no);
     
    //res != 0 삭제 성공
     if(res != 0){
    	 //student.jsp를 호출하여 전체학생 목록을 다시 로드
    	 /* location.href = "student.jsp"; */ //자바 스크립트 코드이기때문에 사용 못함..
    	
    	 //student.jsp로 화면전환
    	 //sendRedirect : 자바코드를 통한 화면 전환
    	 //location.href : 스크립트 코드를 통한 화면 전환
    	 //기능은 같음, 다만 자바에서 쓰느냐 스크립트에서 쓰느냐의 차이!
    	 response.sendRedirect("student.jsp");
     } 
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	</body>
</html>
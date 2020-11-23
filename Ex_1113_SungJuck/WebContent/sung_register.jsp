<%@page import="vo.SjVO"%>
<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //sung_register.jsp?name=이만기&kor=77&eng=55&mat=66
    request.setCharacterEncoding("utf-8");//한글 깨짐 방지
	
    String name = request.getParameter("name");
    int kor = Integer.parseInt(request.getParameter("kor"));
    int eng = Integer.parseInt(request.getParameter("eng"));
    int mat = Integer.parseInt(request.getParameter("mat"));
  
    SjVO vo = new SjVO();
    
    vo.setName(name);
    vo.setKor(kor);
    vo.setEng(eng);
    vo.setMat(mat);   
    
    int res = SjDAO.getInstance().insert(vo);
   		
	response.sendRedirect("student.jsp");
    
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
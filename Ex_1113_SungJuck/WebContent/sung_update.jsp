<%@page import="dao.SjDAO"%>
<%@page import="vo.SjVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    request.setCharacterEncoding("utf-8");
    
    //input의 name으로 값이 넘어간다.
    int no = Integer.parseInt(request.getParameter("no"));   
    String name = request.getParameter("name2");
    int kor = Integer.parseInt(request.getParameter("kor2"));
    int eng = Integer.parseInt(request.getParameter("eng2"));
    int mat = Integer.parseInt(request.getParameter("mat2"));
    	
    SjVO vo = new SjVO();
    
    vo.setNo(no);
    vo.setName(name);
    vo.setKor(kor);
    vo.setEng(eng);
    vo.setMat(mat);

    int res = SjDAO.getInstance().update(vo);    
    
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
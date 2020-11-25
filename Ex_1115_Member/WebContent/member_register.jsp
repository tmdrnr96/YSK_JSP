<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.sun.webkit.ContextMenu.ShowContext"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //전송방식이 post일 때는 한글이 깨질 수 있기 때문에
    //한글깨짐을 방지하기 위해서 써주는 코드(get방식에서는 안써도 됨..)
    request.setCharacterEncoding("utf-8");
   
    MemberDAO dao = MemberDAO.getInstance();
    
    MemberVO vo = new MemberVO();
    
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String email = request.getParameter("email");
    String addr = request.getParameter("addr");
    
    vo.setName(name);
    vo.setId(id);
    vo.setPwd(pwd);
    vo.setEmail(email);
    vo.setAddr(addr);
    
    int res = dao.insert(vo);
    
    if(res == 1){
    	//JOptionPane.showMessageDialog(null, "회원정보 추가 완료");
    	
    	response.sendRedirect("member_list.jsp");
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
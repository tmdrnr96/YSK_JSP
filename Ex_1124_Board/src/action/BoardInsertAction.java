package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

@WebServlet("/board/insert.do")
public class BoardInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		//파라미터 수신
		String subject = request.getParameter("subject");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		
		//접속자의  ip
		String ip = request.getRemoteAddr();
				
		//DAO로 전달할 파라미터들을 vo에 포장
		BoardVO vo = new BoardVO();
		
		vo.setSubject(subject);
		vo.setName(name);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		int res = BoardDAO.getInstance().insert(vo); 
		
		response.sendRedirect("boardList.do");
		
	}
	
	

}

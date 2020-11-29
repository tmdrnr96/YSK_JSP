package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;


@WebServlet("/member/member_del.do")
public class MemberDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
	
		int n = MemberDAO.getInstance().delete(idx);
		
		String res = "no";
		
		if(n > 0) {//삭제성공
			res = "yes";
		}
		//넘어가기전에 json타입으로  정확하게 기재되어 있어야한다.
		String result = String.format("[{'res':'%s'}]",res);
		
		//콜백메서드로 응답하기!
		response.getWriter().print(result);
		
	}
	

}

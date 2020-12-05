package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;

@WebServlet("/board/view.do")
public class BoardViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//view.do=?idx=41
		int idx = Integer.parseInt(request.getParameter("idx"));
	
		//idx에 해당하는 게시글 정보 1건 얻어오기..(selectone으로 vo가 리턴된다.)
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//idx에 해당하는 게시글 정보 한건 얻어오기 (vo로 받기)
		
		BoardVO vo = dao.selectOne(idx);
		
		//세션에 저장된 값이 있는지 조회
		HttpSession session = request.getSession();
		
		String show = (String)session.getAttribute("show");
		
		//처음에는 show에 저장된 값이 없기 때문에 조회수를 증가 시킨다.
		if(show == null) {
			//idx에 해당하는 게시글의 조회수를 증가
			dao.update_readhit(idx);
			session.setAttribute("show", "a");
		}
		request.setAttribute("vo", vo);
		
		RequestDispatcher disp = request.getRequestDispatcher("board_view.jsp");
		disp.forward(request, response);
	
	}

}

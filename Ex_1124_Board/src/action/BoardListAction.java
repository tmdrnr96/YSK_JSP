package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

@WebServlet("/board/boardList.do")
public class BoardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<BoardVO> list = BoardDAO.getInstance().selectList();
		
		request.setAttribute("list", list);
		
		//조회수 증가를 위해 세션에 저장해뒀던 데이터를 삭제
		//(view.do에서 session으로 저장했던 session값을 없앤다.)
		request.getSession().removeAttribute("show");
		
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);
		
			
	}

}

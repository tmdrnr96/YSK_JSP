package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

@WebServlet("/board/del.do")
public class BoardDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//삭제를 위한 게시글의 idx를 파라미터로 받는다.
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//삭제를 위한 게시글의 정보를 얻어온다.
		BoardVO baseVO = dao.selectOne(idx);
		
		baseVO.setSubject("이미 삭제된 게시글입니다.");
		baseVO.setName("nuknown");
		
		//게시글이 삭제된 것처럼 업데이트
		int res = dao.del_update(baseVO);
		
		String result = "no";
		
		if(res == 1) {
			
			result = "yes";
			
		}
		
		response.getWriter().print(result);
		
	}

}

package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

@WebServlet("/board/reply.do")
public class BoardReplyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip =request.getRemoteAddr();
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//댓글을 달고 싶은idx에 해당하는 원본 게시글의 정보를 얻어오기
		//baseVO 해당 idx의 정보가 담긴다
		BoardVO baseVO = dao.selectOne(idx);
		
		//댓글을 달기 전에 이전에 있던 게시글의 step을 하나씩 늘려주고
		//이후에 들어올 게시글의 step을 1로 만든다.
		
		//기준글의 step보다 큰값은 step + 1처리 (공간확보!)
		int res = dao.update_step(baseVO);
		
		//댓글을 VO로 포장
		
		BoardVO vo = new BoardVO();
		
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep()+1);
		vo.setDepth(baseVO.getDepth()+1);
	
	//댓글등록
		res = dao.reply(vo);
		
		response.sendRedirect("boardList.do");
		
	}

}

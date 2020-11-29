package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/member/member_list.do")
public class MemberListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* @WebServlet("/member/member_list.do") */
		/* member폴더에 있는 jsp파일 만을 실행할 것이다 라는 얘기와 같다! */
		/*
		 * Model2(MVC패턴) 나눠서 처리..
		 * M(Model) : DAO(DB연결 객체, DB정보를 가져온다.)
		 * V(View) : JSP(눈에 보이는 UI)
		 * C(Controller) : Servlet(중간 연결 객체)
		 */		
		
		//회원목록 가져오기
		 MemberDAO dao= MemberDAO.getInstance();
		List<MemberVO> list = dao.selectList();
		 
		//바인딩 : 저장
		//포워딩 : 저장된 데이터를 쓰는 페이지
		
		//requestScope영역에 list객체를 '바인딩'
		request.setAttribute("list", list);
		
		//리퀘스트 영역에 바인딩 되어 있는 list는 어떤 jsp에서 사용할 것인지를 알려준다(포워딩)
		//반드시 지정해 놓은 "member_list.jsp"에서 쓸수 있다. 
		// 해당 서블릿의 맵핑을 실행하면 
		//주소는 http://localhost:9090/Ex_1120_Member/member/member_list.do 뜨지만,
		//결론적으로 http://localhost:9090/Ex_1120_Member/member/member_list.jsp인거나 다름 없음..
		
		RequestDispatcher disp = request.getRequestDispatcher("member_list.jsp");
		disp.forward(request, response); //list객체와 같이 보낸다.
	}

}

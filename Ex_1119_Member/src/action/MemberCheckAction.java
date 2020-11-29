package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;


@WebServlet("/member/check_id.do")
public class MemberCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		//selectOne은 vo로 받는다..
		//해당하는 id가 없다면.. null값이 넘어간다.
		MemberVO vo = dao.selectOne(id);
		
		String res ="no";
		
		if(vo == null) {
			//아이디 검색에 실패하여 회원가입이 가능한 상태
			res = "yes";
		}
		
		//JSON으로 결과를 돌려줄 때 한글이 포함되어 있으면 오류가 발생하므로
		//request.setContentType을 명시해줘야한다.
		response.setContentType("text/plain;charset=utf-8");
		
		//모든 서블릿은 제이슨을 이렇게 보내주면 된다..
		//배열로 값을 넘겨주는 것이 훨씬 더 안전함.. 아무리 하나라도..배열로 묶기
		String resultStr = String.format("[{'res':'%s'}]",res);
		
		//콜백메서드로 resultStr 응답하기
		//"[{'res':'no'}]", "[{'res':'yes'}]" 둘 중 하나로 응답한다.
		response.getWriter().print(resultStr);
	
	}

}

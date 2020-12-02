package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//파라미터로 받은 id에 해당하는 유저가 존재하는지 검색
		MemberVO user = MemberDAO.getInstance().selectOne(id);
		
		String param ="";
		String resultStr="";
		
		//파라미터로 넘어온 id와 일치하는 데이터가 DB에 없는 경우
		
		//아이디가 존재하지 않는 경우
		if(user == null) {
			param="no_id";
			//해당 아이디가 존재하지 않는다면 비밀번호를 확인할 필요없이 콜백메서드로 JSON전달
			resultStr = String.format("[{'param':'%s'}]", param);
			response.getWriter().print(resultStr);
		}
		
		//아이디가 존재할 경우 비밀번호 확인
		//DAO에서 vo에 저장했던 pwd와 페이지에서 입력한 pwd를 비교한다.
		if(!user.getPwd().equals(pwd)){
			param = "no_pwd";
			resultStr = String.format("[{'param':'%s'}]", param);
			response.getWriter().print(resultStr);
			return;
		}
		
		//아이디와 비밀번호 체크에 문제가 없다면
		//세션에 user객체를 저장한다. (단, 세션은 서버의 메모리(ram)를 사용하기 때문에
		//세션에 너무 많이 데이터를 저장하면 브라우저를 느리게 만들수 있다.)
		
		HttpSession session = request.getSession();
		
		//바인딩
		session.setAttribute("user", user);
		
		//세션스코프는 어느영역에서든 다 쓸수 있기때문에 포워딩이 필요없음..
		
		//대신 세션은 일정시간을 유지할 수 있다. 기본이 30분!!
		//세션 유지시간 1시간 (3600초)
		session.setMaxInactiveInterval(60 * 60);//초 단위
		
		resultStr = "[{'param':'clear'}]";
		response.getWriter().print(resultStr);
	}

}

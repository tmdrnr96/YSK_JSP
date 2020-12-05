package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.spi.protocol.RequestDispatcherRegistry;

import dao.GogekDAO;
import vo.GogekVO;


@WebServlet("/gogek/gogeklist.do")
public class GogekListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<GogekVO> list = null;

		String search = request.getParameter("search");
		System.out.println(search);		
		if(search == null) {
			search = "all";
		}

		if(!search.equals("all")) {
			//고객 지역 조회
			list= GogekDAO.getInstance().select(search);
			
		}else {
			//고객 목록 조회
			list= GogekDAO.getInstance().select();			
		}
		
		//바인딩
		request.setAttribute("list", list);

		RequestDispatcher disp = request.getRequestDispatcher("gogek_list.jsp");

		//포워딩
		disp.forward(request, response);

	}
}

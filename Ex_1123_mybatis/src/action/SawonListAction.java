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

import dao.SawonDAO;
import vo.SawonVO;


@WebServlet("/sawon/sawonlist.do")
public class SawonListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//sawonlist.do          --->deptno가 null인 상태
 		//sawonlist.do?deptno=  --->deptno가 empty인 상태(equals(""))
		//sawonlist.do?deptno=10--->
		//때문에 파라미터를 받기 전에 처리를 해줘야한다.
		int deptno = 0;
		//메모리를 할당 받지 못하면 null(hip에 공간을 할당받지 못하면 null)
		//기본자료형은 null체크를 확인할 수 없기 때문에 String(클래스타입)으로 받아준다.
		//(클래스 타입만이 null체크를 확인 할 수 있다.)
		String str_deptno = request.getParameter("deptno");

		//str_deptno가 null도 아니고 비어있지도 않을 때 if문을 들어온다.
		if(str_deptno != null && !str_deptno.isEmpty()){
			deptno = Integer.parseInt(str_deptno);
		}
		
		//사원목록 조회
		List<SawonVO> list = null;
		
		if(deptno == 0) {
			list = SawonDAO.getInstance().select();
		}else {
			list = SawonDAO.getInstance().select(deptno);
		}
		
		request.setAttribute("list", list);
		
		RequestDispatcher disp = request.getRequestDispatcher("sawon_list.jsp");
		disp.forward(request, response);
	}

}

package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/photo/insert_form.do")
public class PhotoinsertFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//화면 전환을 할 때, 이후에 갑작스럽게 DB를 사용하거나, 파라미터를 보내줘야하는 상황이 일어날수 있기 때문에,
		//이러한 일에 대해 대비하고 자 페이지 전환시 서블릿을 거치는 것이 안전하다.
		RequestDispatcher disp = request.getRequestDispatcher("photo_insert_form.jsp");
		disp.forward(request, response);
		
	}

}

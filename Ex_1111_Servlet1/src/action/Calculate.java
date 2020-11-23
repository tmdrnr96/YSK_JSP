package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calculate
 */
@WebServlet("/calc.do")
public class Calculate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));

		
		response.setContentType("text/HTML; charset=utf-8;");//request에서 넘겨온 값을 HTML형식의utf-8형식으로 만든다.
		
		PrintWriter out = response.getWriter();//response에서 읽어온 값을 out변수에 담는다.
		
		out.print("<html>");
		out.print("<head>");
		out.print("<body>");
		out.print("+결과 : " + (su1+su2)+ "<br>");
		out.print("-결과 : " + (su1-su2)+ "<br>");
		out.print("*결과 : " + (su1*su2)+ "<br>");
		out.print("/결과 : " + (su1/su2)+ "<br>");
		out.print("<a href ='calc.html'>다시하기</a>");
		out.print("</body>");
		
		out.print("</head>");
		
		out.print("</html>");
		
	}

}

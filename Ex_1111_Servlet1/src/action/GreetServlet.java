package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GreetServlet
 */
@WebServlet("/greet.do")
public class GreetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//greet.do?nat=kor
		//클라이언트가 넘겨준 파라미터 정보를 request를 통해서 받아야한다.
		
		//클라이언트에서 전송된 파라미터 값은 대부분 String으로 수신된다.
		//파일전송등의 특이사항을 제외하고는 반드시 String 타입으로 넘어오며,
		//int, char등의 기본자료형으로 수신되는 경우는 아예 없다.
		String result = request.getParameter("nat");
		
		//파라미터 전달의 잘못된 예시
		//1) greet.do?nation=          <-- result가 " "비어있는 상태
		//2) greet.do?                 <-- result가 null인 상태
		
		if(result == null){
			result = "kor"; //오류를 방지하기 위해 임의로 값을 넣어준다.
		}
		
//		System.out.println("요청한 언어 : " + result);
		
		String msg = "";
		
		switch(result) {
		case "kor":
			msg = "안녕하세요";
			break;
		case "eng":
			msg="헬로우";
			break;
		case "jpn":
			msg="고니찌와";
			break;
		case "chn":
			msg="니하오";
			break;
		}//switch
		
		//응답처리
		response.setContentType("text/HTML; charset=utf-8");//request에서 넘겨온 값을 HTML형식의utf-8형식으로 만든다.
		
		PrintWriter out = response.getWriter();//response에서 읽어온 값을 out변수에 담는다.
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("각 나라 인사말");
		
		out.print("</title>");
		out.print("<body>");
		out.print(msg);
		
		out.print("</body>");
		
		out.print("</head>");
		
		out.print("</html>");
		
	}

}

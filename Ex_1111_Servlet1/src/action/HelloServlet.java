package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
//@WebServlet("/hello.do") -> 맵핑은 URL의 식별자
//URL 맵핑은 중복이 되면 안된다.

//hello.do - ULR Mapping : 특정 서블릿을 실행시키기 위한 식별자
//URL Mapping은 다른 서블릿과 '절대' 중복되면 안된다.
//주의! 서블릿 클래스를 복사하는 것은 비추...

@WebServlet("/hello.do")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 서블릿(server + let)
	 - 서버에 요청되는 사용자(클라이언트)의 요구사항을 제공해주는 객체
	 - 웹 응용프로그램을 만드는 자바기술이며, 실행 결과값을 HTML형식으로 돌려준다.
	 - HTML의 정적인 문제를 해결할 수 있는 동적인 특징을 가지고 있다.
	 - 자바언어로 작성되어 있어 자바의 일반적인 특징을 모두 갖는다.
	 - 객체지향적
	 - 스레드로 처리된다(동시다발적인 사용자의 요청에 대한 응답이 용이하다.)
	 */

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//request : 요청처리객체(클라이언트(사용자)가 보낸 요청을 받기위한 객체) ex) 사용자가 로그인을 할 때,ID, PWD를 서블릿으로 넘긴다. 
		//response : 응답처리객체(요청받은 데이터를 가공하여 HTML, JSP형식으로 돌려주는 객체)
		//웹프로그래밍은 기본적으로 요청->응답이라는 단계를 반드시 거쳐야 하나의 사이클이 완성

		String ip = request.getRemoteAddr();//ip를 가져와서 변수 ip에 저장
		System.out.println(ip + "님 환영합니다.");
		//		System.out.println("---첫 Servlet예제야---");

		//접속한 사용자에게 응답처리
		response.setContentType("text/html; charset=utf-8;"); // html형식으로 반환, utf-8 :한글형식

		PrintWriter out = response.getWriter();//내가 가져온 정보를 PrintWriter의 변수인 out에 담는다.

		out.print("<html>");

		out.print("<head>");
		out.print("<style> h1{color:red;} </style>");
		out.print("</head>");
		out.print("<body>");

		out.printf("<h1>[%s]님 방문을 환영합니다.</h1>",ip); //out에 담긴 내용을 화면에 출력!

		out.print("</body>");
		

		out.print("</html>");



	}

}

package action;

import java.io.File;
import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/upload.do")
public class FilrUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//임시로 저장하기 위한 경로
	    // String path = "c:/upload/";
		 	
		//경로 설정!
		String web_path = "/upload/";
		//현재 WebApplication(프로젝트)을 관리하는 객체
		ServletContext application = request.getServletContext();
		
		//웹상의 '상대 경로'를 '절대 경로'로 변환
		//우리 프로젝트 내에 web_path의 절대적 인위치를 가져온다.
		String path = application.getRealPath(web_path);
		
		//상대경로와 절대경로는 연결이 되어있음을 알 수 있다.
		System.out.println(path);		
		
		//최대 업로드 용량을 버퍼영역을 사용하여 업로드 시에만 공간을 확보하기 떄문에
		//크게 잡아도 메모리 낭비는 없다.
		int max_size = 1024 * 1024 * 100;//최대 업로드 용량 100mb (업로드 용량 지정)
		
		//file타입을 포함한 파라미터를 받기위한 객체
		//lib에 있는 파일이 있기에 MultipartRequest 생성할 수 있다.
		//MultipartRequest
		//form태그에서 multipart/form-data로 넘겼다면 필수!!
		MultipartRequest mr = 
				new MultipartRequest(request,//request 위임
	   								 path,//업로드 경로
									 max_size, //최대용량
									 "utf-8",//수신 인코딩 타입
									 new DefaultFileRenamePolicy());//파일명 중복시 넘버링 처리(중복방지)
		//업로드 된 파일정보 얻어오기
		String filename = "";
		//type이 file인 파라미터를 file로 받아준다.
		//mr에서 photo라는 name을 가진 파일 객체의 정보를 가져온다.
		File f = mr.getFile("photo");//c:/upload/파일명.jpg
		
		
		//사진이 정상적으로 넘어왔을 경우
		if(f != null) {//정상적으로 파일이 업로드 되었다면..
			filename=f.getName();
			//객체 f에 저장된 정보, 업로드된 파일명을 filename에 저장한다.
			//이후에 DB에는 파일의 이름만 저장된다(파일이 저장되는 것이 아님!)
			//System.out.println(filename);
		}
		
		//파일클래스 이외의 일반적인 파라미터 수신
		//MultipartRequest로 request를 위임했기 때문에 
		//일반적인 파라미터라고 할지라도 무조건 
		//MultipartRequest로 파라미터를 받아줘야한다.
		String title = mr.getParameter("title");
		
		//파일정보 바인딩
		request.setAttribute("title",title);
		request.setAttribute("filename", filename);
		
		//포워딩
		RequestDispatcher disp = 
				request.getRequestDispatcher("result.jsp");
		
		disp.forward(request, response);
	
	}

}

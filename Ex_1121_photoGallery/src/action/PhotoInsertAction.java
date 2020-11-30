package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PhotoDAO;
import vo.PhotoVO;


@WebServlet("/photo/insert.do")
public class PhotoInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String web_path ="/upload/";
		
		ServletContext sc = request.getServletContext();
		
		//web상대경로를 절대경로로 변환 
		String path = sc.getRealPath(web_path);
		
		//경로가 바뀌는 경우가 있기 때문에 반드시 !!
		System.out.println(path);
		
		int max_size = 1024 * 1024 * 100; // 100mb
		
		//cos.jar 라이브러리 파일에서 온 객체!
		//파일을 포함하고 있는 파라미터를 받기위한 객체
		MultipartRequest mr = new MultipartRequest(request,
													path,
													max_size,
													"utf-8",
													new DefaultFileRenamePolicy());
	
	String filename = "";
	//input과 output을 관리하는 file클래스
	File f = mr.getFile("photo");
	
	if(f != null) {
		//업로드된 파일(이미지)의 이름을 가져온다.
		filename = f.getName();
	}
		
	String title = mr.getParameter("title");
	String pwd = mr.getParameter("pwd");
	
	String ip = request.getRemoteAddr();//ip주소 가져오기
	//사용자의 ip를 가져온다.(ip mr로 가져오지 않음..)
	
	//받아온 파라미터를 vo에 저장
	PhotoVO vo = new PhotoVO();
	
	vo.setFilename(filename);
	vo.setTitle(title);
	vo.setPwd(pwd);
	vo.setIp(ip);
		
	int n = PhotoDAO.getInstance().insert(vo);	
	
	//사진 데이터를 정상적으로 받았을 경우..
	if(n > 0) {
	
		request.setAttribute("vo", vo);
	
		RequestDispatcher disp = request.getRequestDispatcher("list.do");
		disp.forward(request, response);
		
	}
	
	}

}

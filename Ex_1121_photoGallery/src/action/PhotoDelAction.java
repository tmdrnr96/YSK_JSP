package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;
import vo.PhotoVO;

@WebServlet("/photo/photo_del.do")
public class PhotoDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String filename = request.getParameter("filename");
		
		String web_path = "/upload/";
		
		ServletContext application = request.getServletContext();
		
		//상대경로 upload를 절대경로로 변환
		String path = application.getRealPath(web_path);
	
		int res = PhotoDAO.getInstance().delete(idx);
		
		//DB에서 지우는 것을 성공적으로 마쳤다면..
		if(res > 0) {
			File f = new File(path, filename);
			
			//해당 파일이 존재한다면...
			if(f.exists()) {
				f.delete();//path경로의 이미지를 제거한다.
			}
		}
		
		//결과처리
		String param = "no";
		//파일을 잘 지웠으면 yes 아니면 no
		if(res > 0) {
			param = "yes";
		}
		
		//결과값 yes, no를 json으로 포장하여 콜백메서드로 전달
		String resStr = String.format("[{'param':'%s'}]",param);
		response.getWriter().print(resStr);
	}

}

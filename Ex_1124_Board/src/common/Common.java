package common;

public class Common {
//객체관리를 편하게 하기 위한 클래스 
	//클래스 안에 클래스 내부 클래스!
	//static으로 만들었기때문에 Common.Board.BLOCKLIST 게시물을 10개 씩 보일 수 있음 
	public static class Board{
		//한 페이지에 보여줄 게시글의 수
		public final static int BLOCKLIST = 10; 
	
		//현재 페이지에 보여줄 최대 페이지 메뉴 수
		//< 1 2 3 >
		public final static int BLOCKPAGE = 5;
	}
	
	//공지사항 게시판
	//static으로 만들었기때문에 Common.Notice.BLOCKLIST 게시물을 5개씩 보이게 할 수 있음
	public static class Notice{
		//한 페이지에 보여줄 게시글의 수
		public final static int BLOCKLIST = 5; 
	}
	
}

package service;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자

	static DBService single = null;

	DataSource ds;
	
	private DBService() {
	//DB에 연결하기 위한 준비 작업.
		try {
			InitialContext ic = new InitialContext();
			
			//Context ctx = (Context)ic.lookup("java:comp/env");
			//DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
			
			//위의 두줄을 한줄로 끝냄..
			//JNDI를 검색과 동시에 해당name을 가진  참조 데이터를 가져온다.
			ds = (DataSource)ic.lookup("java:comp/env/jdbc/oracle_test");//JNID 검색과 ID,PWD가져오기
		
		} catch (NamingException e) {//NamingException : JNID의naming을 찾았을 때, 찾지 못했을 때 발생!
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//처음생성될 때만 메모리에 할당되고, 두번째 부터는
	//기존에 만들어진 주소값이 같은 객체를 쓴다.
	//(필요할 때마다 매번 객체를 생성하지 않고 기존의 객체를 쓴다.)
	//(최초 딱 한번만 만든다..(메모리에 효율적!))
	public static DBService getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DBService();
		//생성된 객체정보를 반환
		return single;
	}
	
	public Connection getConnection(){
		Connection conn = null;
		
		try {
			//DB연결!
			conn = ds.getConnection();
			
		} catch (Exception e) {
			
		}
			return conn;
	}//DB접속!
}





















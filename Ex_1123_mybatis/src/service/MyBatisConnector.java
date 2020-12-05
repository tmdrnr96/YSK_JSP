package service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnector {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static MyBatisConnector single = null;

	public static MyBatisConnector getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new MyBatisConnector();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory = null;	
	
	//생성사 생성시 DB연결!
	public MyBatisConnector() {
		try {
			//sqlMapConfig.xml파일을 읽어온다.
			//Resources : ibatis로 임포트!
			//sqlMapConfig.xml 내용을 읽어올 reader
			//어떤 DB를 연결할지 찾는다.(어떤 JNDI를 사용하면 되는지..)
			Reader reader = Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");//참조파일을 읽어온다.
			
			//어떤 JNDI를 쓰면 되는지 factory가 받는다.
			//factory가 sqlMapConfig.xml의 정보를 가지고 있다.
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();//factory에 정보를 주고 스트림(통로)을 닫는다.
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public SqlSessionFactory getFactory() {
		return factory;
	}
	
}

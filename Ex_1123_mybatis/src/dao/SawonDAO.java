package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVO;

public class SawonDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;//팩토리가 있어야 어떤 DB에 대한 정보를 알 수 있음..
	public SawonDAO() {
		//MyBatisConnector.java에서 설정해준 factory를 가져온다.
		//factory : 어떤 DB를 쓸것인가, mapper로 누구를 사용할 것인가... 등의 정보를 담고 있는 클래스
		factory = MyBatisConnector.getInstance().getFactory(); 
	}
	
	//사원목록 가져오기
	public List<SawonVO> select(){
		
		List<SawonVO> list = null;
		//DB로 접근하여 sql문장을 실행시켜줄 객체
		//sql문장을 읽어 줄 객체(prepareStatement와 같은 역할을 한다.)
		SqlSession sqlSession = factory.openSession();//factory에 담긴 정보를 sqlsession에게 알려준다.
		//selectList라는 정해진 메서드를 사용해야함..
		
		//sql맵퍼를 통해 실행된 sql문장을 통해 얻어진 VO들을 알아서 list에 저장(resultSet과 같은 역할을 한다.)
		//sawon이라는 이름을 가진 namespace를 찾아서 id가 sawon_list라고 하는 select문을 수행한다.
		list = sqlSession.selectList("sawon.sawon_list");//이외의 모든 역할을 list가 다한다.
		System.out.println(list.size());
		
		sqlSession.close();//DB에 필요한 모든 것들이 닫힌다.(close -> 필수!!)
		
		return list;
	}
	
	//부서별 사원 목록 조회
	
	public List<SawonVO> select(int deptno){
		
		List<SawonVO> list = null;
		SqlSession sqlSession = factory.openSession();
		
		//맵핑으로 파라미터를 전다할 때 경로 옆에 넣어주는데, 
		//단, 파라미터는 반드시 하나만 넣어줘야한다.
		list = sqlSession.selectList("sawon.sawon_list_deptno",deptno);
		sqlSession.close();
		
		return list;
	}
}

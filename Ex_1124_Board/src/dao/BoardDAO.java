package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVO;

public class BoardDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static BoardDAO single = null;

	public static BoardDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new BoardDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	public BoardDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	//전체게시물 조회
	public List<BoardVO> selectList(){
		List<BoardVO> list = null;
		SqlSession sqlsession = factory.openSession();
		list = sqlsession.selectList("b.board_list");
		sqlsession.close();		
		return list;
		
	}
	
	//새글 추가
		public int insert(BoardVO vo) {
			
			//SqlSession sqlSession = factory.openSession(true); ture : 오토 커밋
			//ture를 안 넣고 sqlSession.commit();으로 대신할 수 있음..
			SqlSession sqlSession = factory.openSession(true);
			int res = sqlSession.insert("b.board_insert", vo);
			//sqlSession.commit();//select를 제외하고 commit을 해줘야한다.
			
			//sqlSession.commit();-->
			//factory.openSession(true); 이 코드로 대체 가능!!
			
			sqlSession.close();
			
			return res;
		}
	//상세보기를 위한 게시물 조회
		public BoardVO selectOne(int idx){
			BoardVO vo = null;
			SqlSession sqlsession = factory.openSession();
			vo = sqlsession.selectOne("b.board_one",idx);				
			sqlsession.close();					
			return vo;
			
		}
	//조회수 증가
			public int update_readhit(int idx) {
				
			SqlSession sqlsession = factory.openSession(true);//오토 커밋!
			int res = sqlsession.update("b.board_update_readhit",idx);
			sqlsession.close();
			return res;
		
			}
	//댓글처리를 위한 step값 증가
			public int update_step(BoardVO baseVO) {
				
				SqlSession sqlSession = factory.openSession(true);
				int res = sqlSession.update("b.board_update_step", baseVO);
				sqlSession.close();
				return res;
			}
		
			//댓글달기
			public int reply(BoardVO vo) {
				SqlSession sqlSession = factory.openSession(true);
				int res = sqlSession.insert("b.board_reply",vo); 
				sqlSession.close();
				return res;
			}
			
			//게시글 삭제
			public int del_update(BoardVO baseVO){
				
				SqlSession sqlSession = factory.openSession(true);
				int res = sqlSession.update("b.board_del",baseVO); 
				sqlSession.close();
				return res;
			}
			
}

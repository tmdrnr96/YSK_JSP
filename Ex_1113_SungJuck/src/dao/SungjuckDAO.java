package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.SungjuckVO;

public class SungjuckDAO {

	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SungjuckDAO single = null;

	public static SungjuckDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SungjuckDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public List<SungjuckVO> selectList() {

		List<SungjuckVO> list = new ArrayList<SungjuckVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from sungtb";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SungjuckVO vo = new SungjuckVO();
				//현재레코드값=>Vo저장
				
				vo.setName(rs.getString("name"));
				vo.setKor(rs.getInt("kor"));
				vo.setEng(rs.getInt("eng"));
				vo.setMat(rs.getInt("mat"));
				
				//ArrayList추가
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
}

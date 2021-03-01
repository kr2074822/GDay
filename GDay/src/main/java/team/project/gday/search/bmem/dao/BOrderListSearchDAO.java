package team.project.gday.search.bmem.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BOrderListSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 DAO
	public int getOdlListCount(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getOdlListCount", map);
	}

}

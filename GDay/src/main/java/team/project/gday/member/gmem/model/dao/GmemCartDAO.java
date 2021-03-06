package team.project.gday.member.gmem.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GmemCartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 클래스 장바구니에 추가 DAO
	public int insertClassCart(Map<String, Object> map) {
		return sqlSession.insert("cartMapper.insertClassCart", map);
	}

}

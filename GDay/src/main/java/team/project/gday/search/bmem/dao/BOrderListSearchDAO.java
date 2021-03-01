package team.project.gday.search.bmem.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BOrderListSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getOdlListCount(Map<String, Object> map) {
		return sqlSession.selectOne("bMemMapper.getGiftListCount", map);
	}

}

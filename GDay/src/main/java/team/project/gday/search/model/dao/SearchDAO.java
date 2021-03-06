package team.project.gday.search.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.search.model.vo.Search;

@Repository
public class SearchDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int getSearchListCount(Search search) {
		return sqlSession.selectOne("boardMapper.getSearchListCount", search);
	}

}

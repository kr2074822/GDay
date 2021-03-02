package team.project.gday.gClass.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GClassDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}

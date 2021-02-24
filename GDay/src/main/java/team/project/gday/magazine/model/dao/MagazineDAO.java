package team.project.gday.magazine.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MagazineDAO {
	
	@Autowired
	private SqlSession sqlSession;
}

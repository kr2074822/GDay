package team.project.gday.search.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.GClass;
import team.project.gday.gift.model.vo.Gift;
import team.project.gday.search.model.vo.PageInfoMain;
import team.project.gday.search.model.vo.Search;

@Repository
public class SearchDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	/**메인 검색결과 선물 10개 보여주기
	 * @param search
	 * @param pInfo
	 * @return gList
	 */
	public List<Gift> selectGiftSearchList(Search search, PageInfoMain pInfo) {
		int offset = (pInfo.getCurrentPage() -1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("searchMapper.selectGiftSearchList", search, rowBounds);
	}

	/**메인 검색결과 선물 10개 보여주기
	 * @param search
	 * @param pInfo
	 * @return cList
	 */
	public List<GClass> selectClassSearchList(Search search, PageInfoMain pInfo) {
		int offset = (pInfo.getCurrentPage() -1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("searchMapper.selectClassSearchList", search, rowBounds);
	}
	


}

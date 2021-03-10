package team.project.gday.search.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.gift.model.vo.Gift;
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
	public List<team.project.gday.Product.model.vo.Gift> selectGiftSearchList(Search search) {
		RowBounds rowBounds = new RowBounds(0, 10);
		return sqlSession.selectList("giftMapper.selectSearchList", search, rowBounds);
	}

	/**메인 검색결과 클래스 10개 보여주기
	 * @param search
	 * @param pInfo
	 * @return cList
	 */
	public List<GClass> selectClassSearchList(Search search) {
		RowBounds rowBounds = new RowBounds(0, 10);
		return sqlSession.selectList("classMapper.selectSearchList", search, rowBounds);
	}

	/** 카테고리가 없을 때 검색 조건이 포함된 선물 목록 조회 DAO
	 * @param search
	 * @return
	 */
	public List<team.project.gday.Product.model.vo.Gift> selectGiftListAll(Search search) {
		RowBounds rowBounds = new RowBounds(0, 10);
		return sqlSession.selectList("giftMapper.selectGiftListAll", search, rowBounds);
	}
	
	/** 카테고리가 없을 때 검색 조건이 포함된 클래스 목록 조회 DAO
	 * @return
	 */
	public List<GClass> selectClassListAll(Search search) {
		RowBounds rowBounds = new RowBounds(0, 10);
		return sqlSession.selectList("classMapper.selectClassListAll", search, rowBounds);
	}

	/**썸네일 목록 조회 DAO
	 * @param gCList
	 * @return
	 */
	public List<Attachment> selectThumbnailList(List<GClass> gCList) {
		return sqlSession.selectList("classMapper.selectThumbnailList", gCList);
	}

}

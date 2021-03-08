package team.project.gday.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Order;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.review.model.vo.Review;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**후기 텍스트 삽입dao
	 * @param review
	 * @return result
	 */
	public int insertReview(Review review) {
		return sqlSession.insert("reviewMapper.insertReview", review);
	}

	/** 후기 사진 삽입 dao
	 * @param review
	 * @return result
	 */
	public int insertRvImg(Review review) {
		return sqlSession.insert("reviewMapper.insertRvImg", review);
	}

	/**후기 목록 listCount
	 * @param map
	 * @return
	 */
	public int reviewListCount(Map<String, Object> map) {
		return sqlSession.selectOne("reviewMapper.reviewListCount", map);
	}

	
	/**후기 목록 조회
	 * @param pInfo
	 * @param map
	 * @return
	 */
	public List<Review> selectReviewList(PageInfo9 pInfo, Map<String, Object> map) {
		
		int offset = (pInfo.getCurrentPage()-1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("reviewMapper.selectReviewList", map, rowBounds);
	}

	/**후기 조회 시 알맞은 값 조회를 위한 조회
	 * @param rList
	 * @return
	 */
	public List<Order> selectOList(List<Review> rList) {
		return sqlSession.selectList("reviewMapper.selectOList", rList);
	}

	/** 후기 조회(G) 옵션 조회
	 * @param rList
	 * @return
	 */
	public List<GOption> selectOptList(List<Review> rList) {
		return sqlSession.selectList("reviewMapper.selectOptList", rList);
	}

	/**후기 조회(C) 클래스 조회
	 * @param rList
	 * @return
	 */
	public List<GClass> selectCList(List<Review> rList) {
		return sqlSession.selectList("reviewMapper.selectCList", rList);
	}
	
	
	
}

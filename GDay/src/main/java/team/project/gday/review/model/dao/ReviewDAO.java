package team.project.gday.review.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	
	
}

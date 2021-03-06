package team.project.gday.gift.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;

@Repository
public class GiftDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	/** 다음 상품 번호 조회
	 * @return
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("giftMapper.selectNextNo");
	}
	
	/** 상품 테이블에 삽입
	 * @param map
	 * @return
	 */
	public int insertProduct(Map<String, Object> map) {
		return sqlSession.insert("giftMapper.insertProduct", map);
	}

	/** 선물 테이블에 삽입
	 * @param map
	 * @return
	 */
	public int insertGift(Map<String, Object> map) {
		return sqlSession.insert("giftMapper.insertGift", map);
	}

	/** 선물 태그 테이블에 삽입
	 * @param map
	 * @return
	 */
	public int insertTag(Map<String, Object> map) {
		return sqlSession.insert("giftMapper.insertTag", map);
	}
	
	/** 파일 정보 삽입
	 * @param uploadImages
	 * @return
	 */
	public int insertAttachmentList(List<Attachment> uploadImages) {
		return sqlSession.insert("giftMapper.insertAttachmentList");
	}

	/** 선물 옵션 추가
	 * @param map
	 * @return
	 */
	public int insertGiftOption(Map<String, Object> map) {
		return sqlSession.insert("giftMapper.insertGiftOption", map);
	}

	public int insertGiftOption2(Map<String, Object> map) {
		return sqlSession.insert("giftMapper.insertGiftOption2", map);
	}
	
	
	
	
	
	
	
	
}

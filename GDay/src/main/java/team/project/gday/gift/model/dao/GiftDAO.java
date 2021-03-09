package team.project.gday.gift.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.Product.model.vo.ProductCTag;
import team.project.gday.Product.model.vo.ProductStar;
import team.project.gday.member.bmem.model.vo.PageInfo10;
import team.project.gday.member.model.vo.Member;

/**
 * @author YJ
 *
 */
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

	/** 선물 옵션 색상 추가
	 * @param map
	 * @return
	 */
	public int insertGiftOption(Map<String, Object> map) {
		return sqlSession.insert("giftMapper.insertGiftOption", map);
	}

	/** 선물 옵션 사이즈 추가
	 * @param map
	 * @return
	 */
	public int insertGiftOption2(Map<String, Object> map) {
		return sqlSession.insert("giftMapper.insertGiftOption2", map);
	}

	/** 선물 상세 조회
	 * @param temp
	 * @return
	 */
	public Gift selectGift(Gift temp) {
		return sqlSession.selectOne("giftMapper.selectGift", temp);
	}

	/** 조회수 증가
	 * @param prdtNo
	 * @return
	 */
	public int increaseReadCount(int prdtNo) {
		return sqlSession.update("giftMapper.increaseReadCount", prdtNo);
	}

	/** 이미지 조회
	 * @param prdtNo
	 * @return
	 */
	public List<Attachment> selectAttachmentList(int prdtNo) {
		return sqlSession.selectList("giftMapper.selectAttachmentList", prdtNo);
	}

	/** 판매자 정보 조회
	 * @param memNo
	 * @return
	 */
	public Member selectMember(int memNo) {
		return sqlSession.selectOne("giftMapper.selectMember", memNo);
	}

	/** 썸네일 가져오기
	 * @param prdtNo
	 * @return
	 */
	public Attachment selectThumbnail(int prdtNo) {
		return sqlSession.selectOne("giftMapper.selectThumbnail", prdtNo);
	}

	/** 상품옵션 가져오기
	 * @param prdtNo
	 * @return
	 */
	public List<GOption> selectGoption(int prdtNo) {
		return sqlSession.selectList("giftMapper.selectGoption", prdtNo);
	}

	/** 상품별 해시태그 조회
	 * @param prdtNo
	 * @return
	 */
	public List<ProductCTag> selectPrdtTagList(int prdtNo) {
		return sqlSession.selectList("giftMapper.selectPrdtTagList", prdtNo);
	}

	/** 상품 업데이트
	 * @param map
	 * @return
	 */
	public int updateProduct(Map<String, Object> map) {
		return sqlSession.update("giftMapper.updateProduct", map);
	}

	/** 선물 업데이트
	 * @param map
	 * @return
	 */
	public int updateGift(Map<String, Object> map) {
		return sqlSession.update("giftMapper.updateGift", map);
	}

	/** 상품 태그 상제
	 * @param prdtNo
	 * @return
	 */
	public int deletePrdtTag(int prdtNo) {
		return sqlSession.delete("giftMapper.deletePrdtTag", prdtNo);
	}

	/** 파일 정보 수정
	 * @param at
	 * @return
	 */
	public int updateAttachment(Attachment at) {
		return sqlSession.update("giftMapper.updateAttachment", at);
	}

	/** 파일 정보 삭제
	 * @param deleteFileNoList
	 * @return
	 */
	public int deleteAttachmentList(List<Integer> deleteFileNoList) {
		return sqlSession.delete("giftMapper.deleteAttachmentList", deleteFileNoList);
	}

	/** 옵션 색 수정
	 * @param map
	 * @return
	 */
	public int updateOption(Map<String, Object> map) {
		return sqlSession.update("giftMapper.updateOption", map);
	}
	
	/** 옵션 사이즈 수정
	 * @param map
	 * @return
	 */
	public int updateOption2(Map<String, Object> map) {
		return sqlSession.update("giftMapper.updateOption", map);
	}

	/** 전체 선물 수 조회 DAO
	 * @return
	 */
	public int getGiftCount() {
		return sqlSession.selectOne("giftMapper.getGiftCount");
	}

	/** 선물 목록 조회
	 * @param pInfo
	 * @return
	 */
	public List<Gift> selectList(PageInfo10 pInfo) {
		int offset = (pInfo.getCurrentPage() -1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("giftMapper.selectList", null, rowBounds);
	}

	public List<Attachment> selectThumbnailList(List<Gift> gift) {
		System.out.println(gift);
		return sqlSession.selectList("giftMapper.selectThumbnailList", gift);
	}

	public List<ProductStar> selectStarList(List<Gift> gift) {
		return sqlSession.selectList("giftMapper.selectStarList", gift);
	}
	
}

package team.project.gday.gClass.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.ProductCTag;
import team.project.gday.Product.model.vo.ProductStar;
import team.project.gday.member.bmem.model.vo.PageInfo10;
import team.project.gday.member.model.vo.Member;

/**
 * @author hy
 *
 */
@Repository
public class GClassDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**전체 클래스 수 조회 DAO
	 * @return classCount
	 */
	public int getClassCount() {
		return sqlSession.selectOne("classMapper.getClassCount");
	}
	
	/**클래스 목록 조회 DAO
	 * @param pInfo
	 * @return
	 */
	public List<GClass> selectList(PageInfo10 pInfo) {
		int offset = (pInfo.getCurrentPage() -1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("classMapper.selectList", null, rowBounds);
	}

	/**썸네일 목록 조회 DAO
	 * @param gCList
	 * @return thList
	 */
	public List<Attachment> selectThumbnailList(List<GClass> gCList) {
		return sqlSession.selectList("classMapper.selectThumbnailList", gCList);
	}

	/**클래스 상세 조회 DAO 
	 * @param temp
	 * @return gClass
	 */
	public GClass selectGClass(GClass temp) {
		return sqlSession.selectOne("classMapper.selectGClass", temp);
	}
	
	/**클래스 상세 페이지의 판매자 정보 가져오기 DAO
	 * @param memNo
	 * @return memName
	 */
	public Member selectMember(int memNo) {
		return sqlSession.selectOne("classMapper.selectMember", memNo);
	}

	/**클래스 조회수 증가 DAO
	 * @param prdtNo
	 * @return
	 */
	public int increaseReadCount(int prdtNo) {
		return sqlSession.update("classMapper.increaseReadCount", prdtNo);
	}

	/** 클래스에 포함된 이미지 목록 조회 DAO
	 * @param prdtNo
	 * @return
	 */
	public List<Attachment> selectAttachmentList(int prdtNo) {
		return sqlSession.selectList("classMapper.selectAttachmentList", prdtNo);
	}

	/**클래스 상세 페이지의 썸네일 조회 DAO
	 * @param prdtNo
	 * @return attachment
	 */
	public Attachment selectThumbnail(int prdtNo) {
		return sqlSession.selectOne("classMapper.selectThumbnail", prdtNo);
	}

	/**상품별 해시태그 조회 DAO
	 * @param prdtNo
	 * @return List
	 */
	public List<ProductCTag> selectPrdtTagList(int prdtNo) {
		return sqlSession.selectList("classMapper.selectPrdtTagList", prdtNo);
	}

	/** 상품 테이블 수정 DAO
	 * @param updateClass
	 * @return result
	 */
	public int updateProduct(Map<String, Object> map) {
		return sqlSession.update("classMapper.updateProduct", map);
	}

	/** 클래스 테이블 수정 DAO
	 * @param updateClass
	 * @return result
	 */
	public int updateClass(Map<String, Object> map) {
		return sqlSession.update("classMapper.updateClass", map);
	}

	/**상품-태그 테이블 삭제 DAO
	 * @param updateClass
	 * @return result
	 */
	public int deletePrdtTag(int prdtNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("classMapper.deletePrdtTag", prdtNo);
	}

	/**상품-태그 테이블 입력 DAO
	 * @param map
	 * @return result
	 */
	public int insertTag(Map<String, Object> map) {
		return sqlSession.insert("classMapper.insertTag", map);
	}

	/**파일 정보 수정 DAO
	 * @param at
	 * @return result
	 */
	public int updateAttachment(Attachment at) {
		return sqlSession.update("classMapper.updateAttachment", at);
	}

	/**파일 정보 삽입 DAO
	 * @param newAttachmentList
	 * @return result(성공한 행의 개수)
	 */
	public int insertAttachmentList(List<Attachment> newAttachmentList) {
		return sqlSession.insert("classMapper.insertAttachmentList", newAttachmentList);
	}

	/**파일 정보 삭제 DAO
	 * @param deleteFileNoList
	 * @return 
	 */
	public int deleteAttachmentList(List<Integer> deleteFileNoList) {
		return sqlSession.delete("classMapper.deleteAttachmentList", deleteFileNoList);
	}

	/**클래스 마감하기 DAO
	 * @param prdtNo
	 * @return result
	 */
	public int pauseAction(int prdtNo) {
		return sqlSession.update("classMapper.pauseAction", prdtNo);
	}

	/**평균 별점 가져오기 DAO
	 * @param gCList
	 * @return List
	 */
	public List<ProductStar> selectStarList(List<GClass> gCList) {
		return sqlSession.selectList("classMapper.selectStarList", gCList);
	}


	
	

}

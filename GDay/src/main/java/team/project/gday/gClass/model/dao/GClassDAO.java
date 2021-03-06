package team.project.gday.gClass.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
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


	
	

}

package team.project.gday.magazine.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.magazine.model.vo.Magazine;
import team.project.gday.magazine.model.vo.MagazineImg;
import team.project.gday.magazine.model.vo.MagazinePageInfo;

@Repository
public class MagazineDAO {
	
	@Autowired
	private SqlSession sqlSession;


	/** 매거진 목록 갯수
	 * @return
	 */
	public int getListCount() {
		return sqlSession.selectOne("magazineMapper.getListCount");
	}

	/** 매거진 목록 조회
	 * @param pInfo
	 * @return
	 */
	public List<Magazine> selectList(MagazinePageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1 ) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("magazineMapper.selectList", pInfo.getBoardType(), rowBounds);
	}

	/** 매거진 썸네일 목록 조회
	 * @param mList
	 * @return
	 */
	public List<Magazine> selectThumbnailList(List<Magazine> mList) {
		return sqlSession.selectList("magazineMapper.selectThumbnailList", mList);
	}

	/** 다음 매거진번호 조회
	 * @return
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("magazineMapper.selectNextNo");
	}

	/** 매거진 등록
	 * @param map
	 * @return
	 */
	public int insertMagazine(Map<String, Object> map) {
		return sqlSession.insert("magazineMapper.insertMagazine", map);
	}

	/** 파일 정보 삽입
	 * @param uploadImages
	 * @return
	 */
	public int insertAttachmentList(List<MagazineImg> uploadImages) {
		return sqlSession.insert("magazineMapper.insertAttachmentList", uploadImages);
	}

	/** 매거진 상세 조회
	 * @param temp
	 * @return
	 */
	public Magazine selectMagazine(Magazine temp) {
		return sqlSession.selectOne("magazineMapper.selectMagazine", temp);
	}

	/** 조회수 증가
	 * @param no
	 * @return
	 */
	public int increaseReadCount(int no) {
		return sqlSession.update("magazineMapper.increaseReadCount", no);
	}

	/** 매거진 이미지 가져오기
	 * @param no
	 * @return
	 */
	public List<MagazineImg> selectMimgList(int no) {
		return sqlSession.selectList("magazineMapper.selectMimgList", no);
	}

	/** 썸네일 조회
	 * @param no
	 * @return
	 */
	public MagazineImg selectThumbnail(int no) {
		return sqlSession.selectOne("magazineMapper.selectThumbnail", no);
	}

	/** 매거진 수정
	 * @param map
	 * @return
	 */
	public int updateMagazine(Map<String, Object> map) {
		return sqlSession.update("magazineMapper.updateMagazine", map);
	}

	/** 매거진 사진 수정
	 * @param at
	 * @return
	 */
	public int updateMagazineImg(MagazineImg at) {
		return sqlSession.update("magazineMapper.updateMagazineImg", at);
	}

	/** 이미지 정보 삭제
	 * @param deleteFileNoList
	 * @return
	 */
	public int deleteMagazineImg(List<Integer> deleteFileNoList) {
		return sqlSession.delete("magazineMapper.deleteMagazineImg", deleteFileNoList);
	}
}

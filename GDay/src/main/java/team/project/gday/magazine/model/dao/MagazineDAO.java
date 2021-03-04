package team.project.gday.magazine.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.magazine.model.vo.Magazine;
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
}

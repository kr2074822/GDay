package team.project.gday.gClass.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.member.bmem.model.vo.PageInfo10;

@Repository
public class GClassDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**전체 클래스 수 조회 DAO
	 * @return listCount
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
		
		return sqlSession.selectList("classMapper.selectList", rowBounds);
	}

	/**썸네일 목록 조회 DAO
	 * @param gCList
	 * @return thList
	 */
	public List<Attachment> selectThumbnailList(List<GClass> gCList) {
		return sqlSession.selectList("classMapper.selectThumbnailList", gCList);
	}
}

package team.project.gday.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Product;
import team.project.gday.admin.model.vo.Customor;
import team.project.gday.admin.model.vo.adminPageInfo;
import team.project.gday.magazine.model.vo.Magazine;
import team.project.gday.member.model.vo.Member;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	/** 회원 전체조회 페이징
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("adminMapper.getListCount");
	}
	
	/** 회원 전체조회하기
	 * @param pInfo
	 * @return mList
	 */
	public List<Member> adminMember(adminPageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.adminMember", null, rowBounds);
	}

	/** 회원 등급 변경하기
	 * @param memNo
	 * @param memberGrade
	 * @return result
	 */
	public int updateMemberGrade(Map<String, Object> map) {
		return sqlSession.update("adminMapper.updateMemberGrade", map);
	}

	// ----------------------------------------------------------------------------
	
	/** 블랙리스트 회원 조회 페이징
	 * @return
	 */
	public int getBmListCount() {
		return sqlSession.selectOne("adminMapper.getBmListCount");
	}

	/** 블랙리스트 회원 조회
	 * @param pInfo
	 * @return bmList
	 */
	public List<Member> adminBlackMem(adminPageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.adminBlackMem", null, rowBounds);
	}

	// -----------------------------------------------------------------------------
	
	/** 전체 게시글 조회 페이징
	 * @return listBdCount
	 */
	public int getListBdCount() {
		return sqlSession.selectOne("adminMapper.getListBdCount");
	}

	/** 게시글 전체조회 
	 * @param pInfo
	 * @return product
	 */
	public List<Product> productBoard(adminPageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());		
		return sqlSession.selectList("adminMapper.productBoard", null, rowBounds);
	}

	// ------------------------------------------------------------------------------
	
	/** 매거진 게시글 조회 페이징
	 * @return listMzCount
	 */
	public int getListMzCount() {
		return sqlSession.selectOne("adminMapper.getListMzCount");
	}

	/** 매거진 게시글 조회
	 * @param pInfo
	 * @return mzList
	 */
	public List<Magazine> adminMagazine(adminPageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());	
		return sqlSession.selectList("adminMapper.adminMagazine", null, rowBounds);
	}

	// ----------------------------------------------------------------------------------
	
	/** 관리자 고객센터 게시글 조회 페이징
	 * @return listAcCount
	 */
	public int getListAcCount() {
		return sqlSession.selectOne("adminMapper.getListAcCount");
	}

	/** 관리자 고객센터 게시글 목록 조회
	 * @param pInfo
	 * @return cList
	 */
	public List<Customor> adminCustomor(adminPageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());	
		return sqlSession.selectList("adminMapper.adminCustomor", null, rowBounds);
	}




}

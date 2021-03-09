package team.project.gday.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Product;
import team.project.gday.admin.model.vo.Customor;
import team.project.gday.admin.model.vo.Report;
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
	
	/** 게시글 상태 변경
	 * @param map
	 * @return result
	 */
	public int boardUpdate(Map<String, Object> map) {
		return sqlSession.update("adminMapper.boardUpdate", map);
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

	// --------------------------------------------------------------------------------------
	
	/** 회원 고객센터 페이징 
	 * @param memberNo 
	 * @return listMcCount
	 */
	public int getListMcCount(Member loginMember) {
		return sqlSession.selectOne("adminMapper.getListMcCount", loginMember);
	}

	/** 회원 고객센터 목록 조회
	 * @param pInfo
	 * @param memberNo
	 * @return rList
	 */
	public List<Report> memberCustomer(adminPageInfo pInfo, Member loginMember) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.memberCustomer", loginMember, rowBounds);
	}
	// ---------------------------------------------------------------------------------------
	
	/** 게시글 작성자 조회
	 * @param map 
	 * @param map
	 * @return wirterCheck
	 */
	public int writerCheck(Map<String, Object> map) {
		return sqlSession.selectOne("adminMapper.writerCheck", map);
	}

	/** 게시글 신고(게시자 신고)
	 * @param map
	 * @param writerCheck
	 * @return reportPost
	 */
	public int reportPost(Report report) {
		// System.out.println("-------------------"+report);
		return sqlSession.insert("adminMapper.reportPost", report);
	}

	/** 게시글 타입 조회
	 * @param map
	 * @return
	 */
	public String boardType(Map<String, Object> map) {
		return sqlSession.selectOne("adminMapper.boardType", map);
	}

	/** 신고 횟수 조회
	 * @param report
	 * @return reportCount
	 */
	public int reportCount(Report report) {
		return sqlSession.selectOne("adminMapper.reportCount", report);
	}

	/** 신고횟수 3회 이상 시 등급 변겅
	 * @param writerCheck
	 * @return reportMember
	 */
	public int reportMember(int writerCheck) {
		return sqlSession.update("adminMapper.reportMember", writerCheck);
	}
	
	public int report(Map<String, Object> map) {
		return 0;
	}

	/** 비즈니스 회원 목록 조회
	 * @return
	 */
	public List<Member> getMember() {
		return sqlSession.selectList("adminMapper.getMember");
	}

	public Member getbMember(int memberNo) {
		return sqlSession.selectOne("adminMapper.getbMember", memberNo);
	}

	/** 신고 게시판 페이징
	 * @return
	 */
	public int getListRsCount() {
		return sqlSession.selectOne("adminMapper.getListRsCount");
	}

	/** 신고 게시판 목록 조회
	 * @param pInfo
	 * @return rsList
	 */
	public List<Report> adminReportStand(adminPageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("adminMapper.adminReportStand", null, rowBounds);
	}
	
	// --------------------------------------------------------------------------
	
	/** 업체명 가져오기
	 * @param memberNo
	 * @return
	 */
	public String bmemShop(int memberNo) {
		return sqlSession.selectOne("adminMapper.bmemShop", memberNo);
	}


}

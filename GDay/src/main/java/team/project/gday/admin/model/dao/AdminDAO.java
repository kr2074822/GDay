package team.project.gday.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Product;
import team.project.gday.admin.model.vo.Customor;
import team.project.gday.admin.model.vo.Reply;
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
	 * @param map
	 * @return reportCount
	 */
	public int reportCount(Map<String, Object> map) {
		return sqlSession.selectOne("adminMapper.reportCount", map);
	}

	/** 신고횟수 3회 이상 시 등급 변겅
	 * @param writerCheck
	 * @return reportMember
	 */
	public int reportMember(int writerCheck) {
		return sqlSession.update("adminMapper.reportMember", writerCheck);
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

	/** 댓글 목록 조회
	 * @param parentCustomerNo
	 * @return
	 */
	public Reply selectReplyList(int parentCustomerNo) {
		return sqlSession.selectOne("adminMapper.selectReplyList", parentCustomerNo);
	}


	/** 문의글 번호 확인
	 * @param cusNo
	 * @return
	 */
	public Customor memberView(int cusNo) {
		return sqlSession.selectOne("adminMapper.memberView", cusNo);
	}

	public int approval(int memberNo) {
		return sqlSession.update("adminMapper.approval", memberNo);
	}

	/** 라이센스 변경
	 * @param memberNo
	 * @return
	 */
	public int lcsApproval(int memberNo) {
		return sqlSession.update("adminMapper.lcsApproval", memberNo);
	}

	/** 부적합 처리
	 * @param memberNo
	 * @return
	 */
	public int deny(int memberNo) {
		return sqlSession.update("adminMapper.deny", memberNo);
	}

	/** 댓글 삽입
	 * @param map
	 * @return
	 */
	public int insertReply(Map<String, Object> map) {
		return sqlSession.insert("adminMapper.insertReply", map);
	}

	
	/** 고객센터 문의 작성 DAO
	 * @param map
	 * @return result
	 */
	public int customerInsert(Map<String, Object> map) {
		return sqlSession.insert("adminMapper.customerInsert", map);
	}

	
	/** 글 삽입 전 같은 게시판에 있는 댓글들 삭제 dao 
	 * @param map
	 * @return deleteCheck
	 */
	public int deleteReply(Map<String, Object> map) {
		return sqlSession.delete("adminMapper.deleteReply", map);
	}

	/** 문의 상태 변경 
	 * @param map
	 * @return
	 */
	public int cusUpdateStatus(Map<String, Object> map) {
		return sqlSession.update("adminMapper.cusUpdateStatus", map);
	}

	/**  신고 중복 검사
	 * @param map
	 * @return
	 */
	public Report reportDupCheck(Map<String, Object> map) {
		return sqlSession.selectOne("adminMapper.reportDupCheck", map);
	}

	/** 신고받은 횟수 증가
	 * @param map2
	 */
	public int increaseRpCount(Map<String, Object> map2) {
		return sqlSession.update("adminMapper.increaseRpCount", map2);
	}

	/** 신고할 게시글 조회
	 * @param map
	 * @return
	 */
	public int prdtCheck(Map<String, Object> map) {
		return sqlSession.selectOne("adminMapper.prdtCheck", map);
	}

	/** 신고받은 게시글 횟수 조회
	 * @param map
	 * @return
	 */
	public int reportPrdt(Map<String, Object> map) {
		return sqlSession.selectOne("adminMapper.reportPrdt", map);
	}

	/** 신고받은 게시물 3회이상 블라인드 처리
	 * @param prdtCheck
	 * @return
	 */
	public int reportProduct(int prdtCheck) {
		return sqlSession.update("adminMapper.reportProduct", prdtCheck);
	}


}
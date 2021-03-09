package team.project.gday.member.bmem.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.bmem.model.vo.RefundList;
import team.project.gday.member.model.vo.BmemberInfo;
import team.project.gday.member.model.vo.LicenseImg;
import team.project.gday.member.model.vo.Member;

@Repository // 저장소 (DB) 연결 객체임을 알려줌 + bean 등록
public class BmemDAO {

	// 마이바티스를 이용한 DB 연결 객체를 의존성 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 내 판매글 목록 개수 조회 DAO
	public int getGiftListCount(Member loginMember) {
		return sqlSession.selectOne("bMemMapper.getGiftListCount", loginMember);
	}

	// 내 판매글 페이징 처리 객체 생성 DAO
	public List<Gift> bSellList(PageInfo9 pInfo, Member loginMember) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("bMemMapper.bSellList", loginMember, rowBounds);
	}

	// 내 판매글 썸네일 목록 조회 DAO
	public List<Attachment> bSellThumbnailList(List<Gift> gList) {
		return sqlSession.selectList("bMemMapper.bSellThumbnailList", gList);
	}

	
	
	// 내 클래스 목록  개수 조회 DAO
	public int getClassPageInfo(Member loginMember) {
		return sqlSession.selectOne("bMemMapper.getClassListCount", loginMember);
	}

	// 내 클래스 목록 페이징 처리 객체 생성 DAO
	public List<GClass> bClassList(PageInfo9 pInfo, Member loginMember) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("bMemMapper.bClassList", loginMember, rowBounds);
	}

	// 판매 회원 클래스 썸네일 목록 조회 DAO
	public List<Attachment> bClassThumbnailList(List<GClass> cList) {
		return sqlSession.selectList("bMemMapper.bClassThumbnailList", cList);
	}

	
	
	// 판매 회원 선물 주문 목록 개수 조회 DAO
	public int getOrdListCount(Member loginMember) {
		return sqlSession.selectOne("bMemMapper.getOrdListCount", loginMember);
	}

	// 판매 회원 선물 주문 목록 페이징 처리 객체 생성  DAO
	public List<OrderList> bOrderList(PageInfo9 pInfo, Member loginMember) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemMapper.bOrderList", loginMember, rowBounds);
	}	

	
	// 판매 회원 선물 주문 목록 개수 조회 DAO
	public int getRfListCount(Member loginMember) {
		return sqlSession.selectOne("bMemMapper.getRfListCount", loginMember);
	}
	
	// 판매 회원 선물 주문 목록 페이징 처리 객체 생성  DAO
	public List<RefundList> bRefundList(PageInfo9 pInfo, Member loginMember) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemMapper.bRefundList", loginMember, rowBounds);
	}
	
	
	// 판매 회원 선물 주문 취소 목록 개수 조회 DAO
	public int getOcListCount(Member loginMember) {
		return sqlSession.selectOne("bMemMapper.getOcListCount", loginMember);
	}
	
	// 판매 회원 선물 주문 취소 목록 페이징 처리 객체 생성 DAO
	public List<RefundList> bCancelList(PageInfo9 pInfo, Member loginMember) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemMapper.bCancelList", loginMember, rowBounds);
	}
	
	
	// 판매 회원 수강 신청 목록 개수 조회 DAO
	public int getEmListCount(Member loginMember) {
		return sqlSession.selectOne("bMemMapper.getEmListCount", loginMember);
	}
	
	// 판매 회원 수강 신청 목록 페이징 처리 객체 생성 DAO
	public List<OrderList> bEnrolmentlList(PageInfo9 pInfo, Member loginMember) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemMapper.bEnrolmentlList", loginMember, rowBounds);
	}
	
	
	// 판매 회원 수강 취소 목록 개수 조회 DAO
	public int getCcListCount(Member loginMember) {
		return sqlSession.selectOne("bMemMapper.getCcListCount", loginMember);
	}

	// 판매 회원 수강 취소 목록 페이징 처리 객체 생성 DAO
	public List<RefundList> bClassCancelList(PageInfo9 pInfo, Member loginMember) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemMapper.bClassCancelList", loginMember, rowBounds);
	}
	
	
	
	
	// 주문 상태 변경 DAO
	public int orderStatusChange(Map<String, Object> map) {
		return sqlSession.update("bMemMapper.orderStatusChange", map);
	}
	
	// 환불 상태 변경 DAO
	public int refundStatusChange(Map<String, Object> map) {
		return sqlSession.update("bMemMapper.refundStatusChange", map);
	}
	
	// 주문 취소 상태 변경
	public int cancelStatusChange(Map<String, Object> map) {
		return sqlSession.update("bMemMapper.cancelStatusChange", map);
	}

	// 수강 신청 상태 변경
	public int enrolmentStatusChange(Map<String, Object> map) {
		return sqlSession.update("bMemMapper.enrolmentStatusChange", map);
	}
	
	// 수강 취소 상태 변경
	public int classCancelStatusChange(Map<String, Object> map) {
		return sqlSession.update("bMemMapper.classCancelStatusChange", map);
	}
	
	

	public int accountDel(String memberEmail) {
		return sqlSession.update("memberMapper.accountDel", memberEmail);
	}

	/** 회원 조회
	 * @param inputMember
	 * @return
	 */
	public Member loginAction(Member inputMember) {
		return sqlSession.selectOne("memberMapper.loginAction", inputMember);
	}

	/** 비즈니스 회원 정보 조회
	 * @param memberNo
	 * @return
	 */
	public BmemberInfo getBmemInfo(int memberNo) {
		return sqlSession.selectOne("bMemMapper.getBmemInfo", memberNo);
	}

	/** 비즈니스 회원 라이선스 조회
	 * @param memberNo
	 * @return
	 */
	public LicenseImg getLicense(int memberNo) {
		return sqlSession.selectOne("bMemMapper.getLicense", memberNo);
	}

	/**bmember 테이블에 업데이트
	 * @param bmemInfo
	 * @return
	 */
	public int udpateBmemInfo(BmemberInfo bmemInfo) {
		return sqlSession.update("bMemMapper.updateBmemInfo", bmemInfo);
	}

	/**라이선스 업데이트
	 * @param newImg
	 * @return
	 */
	public int updateLicense(LicenseImg newImg) {
		return sqlSession.update("bMemMapper.updateLicense", newImg);
	}

	/**라이선스 삽입
	 * @param newImg
	 * @return
	 */
	public int insertLicense(LicenseImg newImg) {
		return sqlSession.insert("bMemMapper.insertLicense", newImg);
	}

	/** 비즈니스 회원 등급 변경
	 * @param memberNo
	 * @return
	 */
	public int updateMemGrade(int memberNo) {
		return sqlSession.update("bMemMapper.updateMemGrade", memberNo);
	}

	
}
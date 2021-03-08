package team.project.gday.member.bmem.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.dao.BmemDAO;
import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.bmem.model.vo.RefundList;
import team.project.gday.member.model.vo.Member;

@Service
public class BmemServiceImpl implements BmemService {

	@Autowired
	private BCryptPasswordEncoder enc;
	
	@Autowired
	private BmemDAO dao;

	// 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getGiftPageInfo(int cp, Member loginMember) {

		int giftListCount = dao.getGiftListCount(loginMember);

		return new PageInfo9(cp, giftListCount);
	}

	// 내 판매글 목록 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Gift> bSellList(PageInfo9 pInfo, Member loginMember) {
		return dao.bSellList(pInfo, loginMember);
	}

	// 내 판매글 썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> bSellThumbnailList(List<Gift> gList) {
		return dao.bSellThumbnailList(gList);
	}

	
	
	// 클래스 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getClassPageInfo(int cp, Member loginMember) {
		int classListCount = dao.getClassPageInfo(loginMember);

		return new PageInfo9(cp, classListCount);
	}

	// 판매 회원 클래스 목록 조회 Service 구현
	@Override
	public List<GClass> bClassList(PageInfo9 pInfo, Member loginMember) {
		return dao.bClassList(pInfo, loginMember);
	}

	// 판매 회원 클래스 썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> bClassThumbnailList(List<GClass> cList) {
		return dao.bClassThumbnailList(cList);
	}

	
	
	// 판매 회원 선물 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOrdListPageInfo(int cp, Member loginMember) {
		int orderListCount = dao.getOrdListCount(loginMember);

		return new PageInfo9(cp, orderListCount);
	}

	// 판매 회원 선물 주문 목록 조회 Service 구현
	@Override
	public List<OrderList> bOrderList(PageInfo9 pInfo, Member loginMember) {
		return dao.bOrderList(pInfo, loginMember);
	}	
	
	// 판매 회원 환불 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getRfListPageInfo(int cp, Member loginMember) {
		int refundListCount = dao.getRfListCount(loginMember);

		return new PageInfo9(cp, refundListCount);
	}

	//판매 회원 환불 목록 조회 Service 구현
	@Override
	public List<RefundList> bRefundList(PageInfo9 pInfo, Member loginMember) {
		return dao.bRefundList(pInfo, loginMember);
	}
	
	// 판매 회원 주문 취소 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOcListPageInfo(int cp, Member loginMember) {
		int cancelListCount = dao.getOcListCount(loginMember);

		return new PageInfo9(cp, cancelListCount);
	}
	
	// 판매 회원 주문 취소 목록 조회 Service 구현
	@Override
	public List<RefundList> bCancelList(PageInfo9 pInfo, Member loginMember) {
		return dao.bCancelList(pInfo, loginMember);
	}
	
	
	// 판매 회원 수강 신청 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getEmListPageInfo(int cp, Member loginMember) {
		int enrolmentListCount = dao.getEmListCount(loginMember);

		return new PageInfo9(cp, enrolmentListCount);
	}
	
	// 판매 회원 수강 신청 목록 조회 Service 구현
	@Override
	public List<OrderList> bEnrolmentlList(PageInfo9 pInfo, Member loginMember) {
		return dao.bEnrolmentlList(pInfo, loginMember);
	}
	
	
	// 판매 회원 수강 취소 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getCcListPageInfo(int cp, Member loginMember) {
		int classCancelListCount = dao.getCcListCount(loginMember);

		return new PageInfo9(cp, classCancelListCount);
	}
	
	// 판매 회원 수강 취소 목록 조회 Service 구현
	@Override
	public List<RefundList> bClassCancelList(PageInfo9 pInfo, Member loginMember) {
		return dao.bClassCancelList(pInfo, loginMember);
	}
	
	
	
	
	// 주문 상태 변경 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int orderStatusChange(Map<String, Object> map) {
		int result = dao.orderStatusChange(map);
		
		return result;
	}
	
	// 환불 상태 변경 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int refundStatusChange(Map<String, Object> map) {
		int result = dao.refundStatusChange(map);
		
		return result;
	}
	
	// 주문 취소 변경 Service 구현
	@Override
	public int cancelStatusChange(Map<String, Object> map) {
		int result = dao.cancelStatusChange(map);
		
		return result;
	}
	
	// 수강 신청 상태 변경
	@Override
	public int enrolmentStatusChange(Map<String, Object> map) {
		int result = dao.enrolmentStatusChange(map);
		
		return result;
	}
	
	// 수강 취소 상태 변경
	@Override
	public int classCancelStatusChange(Map<String, Object> map) {
		int result = dao.classCancelStatusChange(map);
		
		return result;
	}
	
	
	
	
	// 회원 탈퇴
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int accountDel(Member loginMember) {
		int result = 0;
		System.out.println("----");
		Member login = dao.loginAction(loginMember);
		if(enc.matches(loginMember.getMemberPwd(), login.getMemberPwd())) { 
		
			System.out.println(1111);
			result = dao.accountDel(loginMember.getMemberEmail());
			System.out.println("결과: "+ result);
		}else {
			System.out.println("2222222222");
		}

		return result;
	}


}
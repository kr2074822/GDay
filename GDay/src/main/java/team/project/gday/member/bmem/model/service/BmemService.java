package team.project.gday.member.bmem.model.service;

import java.util.List;
import java.util.Map;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.bmem.model.vo.RefundList;
import team.project.gday.member.model.vo.BmemberInfo;
import team.project.gday.member.model.vo.LicenseImg;
import team.project.gday.member.model.vo.Member;

public interface BmemService {

	/**
	 * 페이징 처리 객체 생성 Service
	 * 
	 * @param cp
	 * @param loginMember
	 * @return pInfo
	 */
	PageInfo9 getGiftPageInfo(int cp, Member loginMember);

	/**
	 * 내 판매글 목록 조회 Service
	 * 
	 * @param pInfo
	 * @param loginMember
	 * @return gList
	 */
	List<Gift> bSellList(PageInfo9 pInfo, Member loginMember);

	/**
	 * 내 판매글 썸네일 목록 조회 Service
	 * 
	 * @param gList
	 * @return thList
	 */
	List<Attachment> bSellThumbnailList(List<Gift> gList);

	/**
	 * 페이징 처리 객체 생성 Service
	 * 
	 * @param cp
	 * @param loginMember
	 * @return pInfo
	 */
	PageInfo9 getClassPageInfo(int cp, Member loginMember);

	/**
	 * 판매 회원 클래스 목록 조회 Service
	 * 
	 * @param pInfo
	 * @param loginMember
	 * @return cList
	 */
	List<GClass> bClassList(PageInfo9 pInfo, Member loginMember);

	/**
	 * 판매 회원 클래스 썸네일 목록 조회 Service
	 * 
	 * @param cList
	 * @return thList
	 */
	List<Attachment> bClassThumbnailList(List<GClass> cList);

	/**
	 * 페이징 처리 객체 생성 Service
	 * 
	 * @param cp
	 * @param loginMember
	 * @return pInfo
	 */
	PageInfo9 getOrdListPageInfo(int cp, Member loginMember);

	/**
	 * 판매 회원 주문 목록 조회 Service
	 * 
	 * @param pInfo
	 * @param loginMember
	 * @return
	 */
	List<OrderList> bOrderList(PageInfo9 pInfo, Member loginMember);	
	
	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param loginMember
	 * @return pInfo
	 */
	PageInfo9 getRfListPageInfo(int cp, Member loginMember);

	/** 판매 회원 환불 목록 조회 Service
	 * @param pInfo
	 * @param loginMember
	 * @return rList
	 */
	List<RefundList> bRefundList(PageInfo9 pInfo, Member loginMember);

	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param loginMember
	 * @return pInfo
	 */
	PageInfo9 getOcListPageInfo(int cp, Member loginMember);

	/** 판매 회원 주문 취소 목록 조회 Service
	 * @param pInfo
	 * @param loginMember
	 * @return oCList
	 */
	List<RefundList> bCancelList(PageInfo9 pInfo, Member loginMember);
	
	
	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param loginMember
	 * @return pInfo
	 */
	PageInfo9 getEmListPageInfo(int cp, Member loginMember);

	/** 판매 회원 수강 신청 목록 조회 Service
	 * @param pInfo
	 * @param loginMember
	 * @return eList
	 */
	List<OrderList> bEnrolmentlList(PageInfo9 pInfo, Member loginMember);
	
	
	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param loginMember
	 * @return pInfo
	 */
	PageInfo9 getCcListPageInfo(int cp, Member loginMember);

	/** 판매 회원 수강 취소 목록 조회 Service
	 * @param pInfo
	 * @param loginMember
	 * @return cList
	 */
	List<RefundList> bClassCancelList(PageInfo9 pInfo, Member loginMember);
	
	
	
	
	/** 주문 상태 변경 Service
	 * @param map
	 * @return result
	 */
	int orderStatusChange(Map<String, Object> map);
	
	/** 환불 상태 변경 Service
	 * @param map
	 * @return result
	 */
	int refundStatusChange(Map<String, Object> map);
	
	/** 수강 신청 변경 Service
	 * @param map
	 * @return result
	 */
	int cancelStatusChange(Map<String, Object> map);
		
	/** 수강 취소 변경 Service
	 * @param map
	 * @return result
	 */
	int classCancelStatusChange(Map<String, Object> map);
	
	
	
	/** 회원 탈퇴
	 * @param map
	 * @return
	 */
	int accountDel(Member loginMember);

	int enrolmentStatusChange(Map<String, Object> map);

	/** 비즈니스 회원 정보 조회
	 * @param memberNo
	 * @return
	 */
	BmemberInfo getBmemInfo(int memberNo);

	/** 비즈니스 회원 라이선스 조회
	 * @param memberNo
	 * @return
	 */
	LicenseImg getLicense(int memberNo);

}
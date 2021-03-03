package team.project.gday.member.bmem.model.service;

import java.util.List;
import java.util.Map;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
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

	
	
	/** 주문 상태 변경 Service
 	 * @param map
	 * @return
	 */
	int orderStatusChange(Map<String, Object> map);

	
}
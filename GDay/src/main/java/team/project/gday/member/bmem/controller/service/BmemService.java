package team.project.gday.member.bmem.controller.service;

import java.util.List;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.controller.model.PageInfo;
import team.project.gday.member.bmem.controller.model.vo.OrderList;
import team.project.gday.member.model.vo.Member;

public interface BmemService {

	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param loginMember
	 * @return pInfo
	 */
	PageInfo getGiftPageInfo(int cp, Member loginMember);
 
	/** 내 판매글 목록 조회 Service
	 * @param pInfo
	 * @param loginMember
	 * @return gList
	 */
	List<Gift> bSellList(PageInfo pInfo, Member loginMember);

	/** 내 판매글 썸네일 목록 조회 Service
	 * @param gList
	 * @return thList
	 */
	List<Attachment> bSellThumbnailList(List<Gift> gList);
	
	
	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param loginMember
	 * @return pInfo
	 */
	PageInfo getClassPageInfo(int cp, Member loginMember);
	
	/** 판매 회원 클래스 목록 조회 Service
	 * @param pInfo
	 * @param loginMember
	 * @return cList
	 */
	List<GClass> bClassList(PageInfo pInfo, Member loginMember);
	
	/** 판매 회원 클래스 썸네일 목록 조회 Service
	 * @param cList
	 * @return thList
	 */
	List<Attachment> bClassThumbnailList(List<GClass> cList);

	
	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param loginMember
	 * @return pInfo
	 */
	PageInfo getOrdListPageInfo(int cp, Member loginMember);
	
	/** 판매 회원 선물 목록 조회 Service
	 * @param pInfo
	 * @param loginMember
	 * @return
	 */
	List<OrderList> bOrderList(PageInfo pInfo, Member loginMember);



}

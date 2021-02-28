package team.project.gday.member.bmem.model.service;

import java.util.List;

import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.product.model.vo.Attachment;
import team.project.gday.product.model.vo.GClass;
import team.project.gday.product.model.vo.Gift;

public interface BmemService {

	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @return pInfo
	 */
	PageInfo9 getGiftPageInfo(int cp);
 
	/** 내 판매글 목록 조회 Service
	 * @param pInfo
	 * @return gList
	 */
	List<Gift> bSellList(PageInfo9 pInfo);

	/** 내 판매글 썸네일 목록 조회 Service
	 * @param gList
	 * @return thList
	 */
	List<Attachment> bSellThumbnailList(List<Gift> gList);
	
	
	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @return pInfo
	 */
	PageInfo9 getClassPageInfo(int cp);
	
	/** 판매 회원 클래스 목록 조회 Service
	 * @param pInfo
	 * @return cList
	 */
	List<GClass> bClassList(PageInfo9 pInfo);
	
	/** 판매 회원 클래스 썸네일 목록 조회 Service
	 * @param cList
	 * @return thList
	 */
	List<Attachment> bClassThumbnailList(List<GClass> cList);



}

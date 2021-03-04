package team.project.gday.search.bmem.service;

import java.util.List;
import java.util.Map;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.vo.PageInfo9;

public interface BSellListSearchService {
	
	
	/** 판매 회원 날짜 선택 후 판매 상품 목록 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param map
	 * @return pInfo
	 */
	PageInfo9 getSellPageInfo(int cp, Map<String, Object> map);

	/** 판매 회원 날짜 선택 후 판매 상품 목록 조회 Service
	 * @param pInfo
	 * @param map
	 * @return oList
	 */
	List<Gift> bSellDaySearchList(PageInfo9 pInfo, Map<String, Object> map);

	/** 판매 회원 날짜 선택 후 판매 상품 썸네일 조회 Service
	 * @param gList
	 * @return
	 */
	List<Attachment> bSellSearchThumbnailList(List<Gift> gList);
	
	/** 판매 회원 날짜 선택 후 판매 상품 목록 페이징 처리 객체 생성2 Service
	 * @param cp
	 * @param map
	 * @return pInfo
	 */
	PageInfo9 getSellPageInfo2(int cp, Map<String, Object> map);

	/** 판매 회원 날짜 선택 후 판매 상품 목록 조회2 Service
	 * @param pInfo
	 * @param map
	 * @return oList
	 */
	List<Gift> bSellDaySearchList2(PageInfo9 pInfo, Map<String, Object> map);



}

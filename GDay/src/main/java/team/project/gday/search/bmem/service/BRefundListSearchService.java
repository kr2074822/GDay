package team.project.gday.search.bmem.service;

import java.util.List;
import java.util.Map;

import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;

public interface BRefundListSearchService {

	/** 판매 회원 기본 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param map
	 * @return pInfo
	 */
	PageInfo9 getRfsPageInfo(int cp, Map<String, Object> map);

	/** 판매 회원 기본 날짜 선택 후 검색 Service 
	 * @param pInfo
	 * @param map
	 * @return oList
	 */
	List<OrderList> bRfsList(PageInfo9 pInfo, Map<String, Object> map);	
	
	/** 판매 회원 기본 날짜 선택 안하고 검색 시 주문 목록 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param map
	 * @return pInfo
	 */
	PageInfo9 getRfsPageInfo2(int cp, Map<String, Object> map);

	/** 판매 회원 기본 날짜 선택 안하고 검색 Service 
	 * @param pInfo
	 * @param map
	 * @return oList
	 */
	List<OrderList> bRfsList2(PageInfo9 pInfo, Map<String, Object> map);
	
	/** 판매 회원 직접 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param map
	 * @return pInfo
	 */
	PageInfo9 getRfsPageInfo3(int cp, Map<String, Object> map);
	
	/** 판매 회원 직접 날짜 선택 후 검색 Service 
	 * @param pInfo
	 * @param map
	 * @return oList
	 */
	List<OrderList> bRfsList3(PageInfo9 pInfo, Map<String, Object> map);
	
	
	
	/** 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param map
	 * @return pInfo
	 */
	PageInfo9 getRflPageInfo(int cp, Map<String, Object> map);

	/** 판매 회원 날짜 선택 후 주문 목록 조회 Service
	 * @param pInfo
	 * @param map
	 * @return oList
	 */
	List<OrderList> bRfDaySearchList(PageInfo9 pInfo, Map<String, Object> map);

	
	
	/** 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성2 Service
	 * @param cp
	 * @param map
	 * @return pInfo
	 */
	PageInfo9 getRflPageInfo2(int cp, Map<String, Object> map);

	/** 판매 회원 날짜 선택 후 주문 목록 조회2 Service
	 * @param pInfo
	 * @param map
	 * @return oList
	 */
	List<OrderList> bRfDaySearchList2(PageInfo9 pInfo, Map<String, Object> map);

}
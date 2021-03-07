package team.project.gday.search.bmem.service;

import java.util.List;
import java.util.Map;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.vo.PageInfo9;

public interface BClassListSearchService {
	
	
	/** 판매 회원 날짜 선택 후 클래스 목록 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param map
	 * @return pInfo
	 */
	PageInfo9 getClassPageInfo(int cp, Map<String, Object> map);

	/** 판매 회원 날짜 선택 후 클래스 목록 조회 Service
	 * @param pInfo
	 * @param map
	 * @return cList
	 */
	List<GClass> bClassDaySearchList(PageInfo9 pInfo, Map<String, Object> map);

	/** 판매 회원 날짜 선택 후 클래스 썸네일 조회 Service
	 * @param cList
	 * @return
	 */
	List<Attachment> bClassSearchThumbnailList(List<GClass> cList);
	
	/** 판매 회원 날짜 선택 후 클래스 목록 페이징 처리 객체 생성2 Service
	 * @param cp
	 * @param map
	 * @return pInfo
	 */
	PageInfo9 getClassPageInfo2(int cp, Map<String, Object> map);

	/** 판매 회원 날짜 선택 후 클래스 목록 조회2 Service
	 * @param pInfo
	 * @param map
	 * @return cList
	 */
	List<GClass> bClassDaySearchList2(PageInfo9 pInfo, Map<String, Object> map);



}

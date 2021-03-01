package team.project.gday.search.bmem.service;

import java.util.Map;

import team.project.gday.member.bmem.model.vo.PageInfo9;

public interface BOrderListSearchService {

	/** 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param map
	 * @return 
	 */
	PageInfo9 getOdlPageInfo(int cp, Map<String, Object> map);

}

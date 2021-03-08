package team.project.gday.search.model.service;

import java.util.List;

import team.project.gday.Product.model.vo.GClass;
import team.project.gday.gift.model.vo.Gift;
import team.project.gday.search.model.vo.PageInfoMain;
import team.project.gday.search.model.vo.Search;

public interface SearchService {

	/** 메인 검색결과 선물 10개 보여주기
	 * @param search
	 * @param pInfo
	 * @return
	 */
	List<Gift> selectGiftSearchList(Search search, PageInfoMain pInfo);

	/** 메인 검색결과 클래스 10개 보여주기
	 * @param search
	 * @param pInfo
	 * @return
	 */
	List<GClass> selectClassSearchList(Search search, PageInfoMain pInfo);


}

package team.project.gday.search.model.service;

import java.util.List;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.ProductStar;
import team.project.gday.gift.model.vo.Gift;
import team.project.gday.search.model.vo.Search;

public interface SearchService {

	/** 메인 검색결과 선물 10개 보여주기
	 * @param search
	 * @param pInfo
	 * @return
	 */
	List<team.project.gday.Product.model.vo.Gift> selectGiftSearchList(Search search);

	/** 메인 검색결과 클래스 10개 보여주기
	 * @param search
	 * @param pInfo
	 * @return
	 */
	List<GClass> selectClassSearchList(Search search);

	/**썸네일 목록 조회 Service
	 * @param gCList
	 * @return
	 */
	List<Attachment> selectThumbnailList(List<GClass> gCList);



}

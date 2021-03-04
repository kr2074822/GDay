package team.project.gday.gClass.model.service;

import java.util.List;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.member.bmem.model.vo.PageInfo10;

public interface GClassService {
 
	/**페이징 처리 객체 생성 Service
	 * @param cp
	 * @return pInfo
	 */
	PageInfo10 getPageInfo(int cp);

	/**클래스 목록 조회 Service
	 * @param pInfo
	 * @return GCList
	 */
	List<GClass> selectList(PageInfo10 pInfo);

	/**썸네일 목록 조회 Service
	 * @param gCList
	 * @return thList
	 */
	List<Attachment> selectThumbnailList(List<GClass> gCList);

	GClass selectGClass(int prdtNo);

	List<Attachment> selectAttachmentList(int prdtNo);

}

package team.project.gday.gClass.model.service;

import java.util.List;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.member.bmem.model.vo.PageInfo10;
import team.project.gday.member.model.vo.Member;

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

	/**클래스 상세 조회 Service
	 * @param prdtNo
	 * @return gClass
	 */
	GClass selectGClass(int prdtNo);

	/**클래스 상세 페이지에 포함된 이미지 목록 조회 Service
	 * @param prdtNo
	 * @return attachmentList
	 */
	List<Attachment> selectAttachmentList(int prdtNo);

	/**클래스 상세 페이지의 판매자 정보 가져오기 Service
	 * @param memNo
	 * @return member
	 */
	Member selectMember(int memNo);

	/**클래스 상세 페이지의 썸네일 조회 Service
	 * @param prdtNo
	 * @return attachment
	 */
	Attachment selectThumbnail(int prdtNo);

}

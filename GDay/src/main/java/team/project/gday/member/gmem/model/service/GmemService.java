package team.project.gday.member.gmem.model.service;

import java.util.List;
import java.util.Map;

import com.sun.xml.internal.ws.api.message.Attachment;

import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Order;
import team.project.gday.member.bmem.model.vo.PageInfo9;

public interface GmemService {

	/** 페이지 인포
	 * @param cp
	 * @param map
	 * @return pInfo
	 */
	public abstract PageInfo9 getPageInfo(int cp, Map<String, Object> map);
	
	/** 주문 목록 조회
	 * @param pInfo 
	 * @param map
	 * @return oList
	 */
	public abstract List<Order> selectOrderList(PageInfo9 pInfo, Map<String, Object> map);

	/**주문 목록 썸네일
	 * @param oList
	 * @return thumbnails
	 */
	public abstract List<Attachment> selectThumbnails(List<Order> oList);

	/** 선물 주문 목록 옵션
	 * @param oList
	 * @return optList
	 */
	public abstract List<GOption> selectOptList(List<Order> oList);

	/** 클래스 주문 목록 상세 정보
	 * @param oList
	 * @return cList
	 */
	public abstract List<GClass> selectCList(List<Order> oList);

	/** 구매 확정 처리
	 * @param opNo
	 * @return
	 */
	public abstract int confirmOrder(int opNo);

	
}

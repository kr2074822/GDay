package team.project.gday.member.gmem.model.service;

import java.util.List;
import java.util.Map;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Order;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.model.vo.Refund;
import team.project.gday.review.model.vo.Review;

public interface GmemService {

	/** 페이지 인포
	 * @param map
	 * @return pInfo
	 */
	public abstract PageInfo9 getPageInfo(Map<String, Object> map);
	
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

	/** 주문 내역 확인용 후기 체크
	 * @param oList
	 * @return
	 */
	public abstract List<Review> selectRCheck(List<Order> oList);

	

	/** 구매 확정 처리
	 * @param opNo
	 * @return
	 */
	public abstract int confirmOrder(int opNo);

	/** 주문 상세 내역(여러 op 내역)
	 * @param orderNo
	 * @param type
	 * @return oList
	 */
	public abstract List<Order> selectOrders(Map<String, Object> map);

	/** 주문 상품 번호 + 타입으로  하나의 주문 가져오기
	 * @param map
	 * @return order
	 */
	public abstract Order selectAOrder(Map<String, Object> map);

	/** 상품 번호로 썸네일 조회
	 * @param prdtNo
	 * @return thumbnail
	 */
	public abstract Attachment selectAThumbnail(int prdtNo);

	/** 옵션 번호로 옵션 내용 조회
	 * @param giftOpNo
	 * @return gOption
	 */
	public abstract GOption selectOption(int giftOpNo);

	/**상품 번호로 클래스 상세 내용 조회
	 * @param prdtNo
	 * @return
	 */
	public abstract GClass selectGClass(int prdtNo);

	/** 환불 테이블에 취소-반품 요청 삽입  + 주문 상태 변경
	 * @param refund
	 * @param map 
	 * @return result
	 */
	public abstract int sendRequest(Refund refund, Map<String, Object> map);

	/** 반품 요청 시 수거지 정보 변경
	 * @param map
	 * @return
	 */
	public abstract int updateShipInfo(Map<String, Object> map);

	/**반품/취소 상세 페이지 조회
	 * @param opNo
	 * @return
	 */
	public abstract Refund selectRefundInfo(int opNo);


	
}

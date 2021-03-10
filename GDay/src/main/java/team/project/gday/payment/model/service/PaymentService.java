package team.project.gday.payment.model.service;

import java.util.List;
import java.util.Map;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.payment.model.vo.PaymentInfo;

public interface PaymentService {

	/** 장바구니에서 결제창 주문목록 리스트 Service
	 * @param map
	 * @return olList
	 */
	List<PaymentInfo> orderList(Map<String, Object> map);

	/** 결제창 주문목록 썸네일 리스트 Service
	 * @param olList
	 * @return thumbnailList
	 */
	List<Attachment> bOrderThumbnailList(List<PaymentInfo> olList);

	
	/** 결제 성공 시 결제 정보 삽입 Service
	 * @param map
	 * @return result
	 */
	int insertOrderInfo(Map<String, Object> map);

	/** 상품 하나만 일 시 썸네일 가져오기 Service
	 * @param prdtNo
	 * @return tList
	 */
	List<Attachment> oneThumbnail(int prdtNo);

}

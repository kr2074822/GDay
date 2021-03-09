package team.project.gday.payment.model.service;

import java.util.List;
import java.util.Map;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.payment.model.vo.PaymentInfo;

public interface PaymentService {

	/** 결제창 주문목록 리스트 Service
	 * @param map
	 * @return olList
	 */
	List<PaymentInfo> orderList(Map<String, Object> map);

	/** 결제창 주문목록 썸네일 리스트 Service
	 * @param olList
	 * @return thumbnailList
	 */
	List<Attachment> bOrderThumbnailList(List<PaymentInfo> olList);

}

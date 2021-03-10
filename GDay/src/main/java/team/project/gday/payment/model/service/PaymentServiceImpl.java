package team.project.gday.payment.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.payment.model.dao.PaymentDAO;
import team.project.gday.payment.model.vo.PaymentInfo;

@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	private PaymentDAO dao;
	
	// 장바구니에서 결제창 주문목록 리스트 Service 구현
	@Override
	public List<PaymentInfo> orderList(Map<String, Object> map) {
		return dao.orderList(map);
	}

	// 장바구니에서 결제창 주문목록 썸네일 리스트 Service 구현
	@Override
	public List<Attachment> bOrderThumbnailList(List<PaymentInfo> olList) {
		return dao.bOrderThumbnailList(olList);
	}

	// 결제 성공 시 결제 정보 삽입 Service 구현
	@Override
	public int insertOrderInfo(Map<String, Object> map) {
		return dao.insertOrderInfo(map);
	}

	// 상품 하나만 일 시 썸네일 가져오기 Service 구현
	@Override
	public List<Attachment> oneThumbnail(int prdtNo) {
		return dao.oneThumbnail(prdtNo);
	}

}

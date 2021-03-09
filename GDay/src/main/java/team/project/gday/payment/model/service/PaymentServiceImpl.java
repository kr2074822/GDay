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
	
	// 결제창 주문목록 리스트 Service 구현
	@Override
	public List<PaymentInfo> orderList(Map<String, Object> map) {
		return dao.orderList(map);
	}

	// 결제창 주문목록 썸네일 리스트 Service 구현
	@Override
	public List<Attachment> bOrderThumbnailList(List<PaymentInfo> olList) {
		return dao.bOrderThumbnailList(olList);
	}

}

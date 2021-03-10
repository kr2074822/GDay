package team.project.gday.payment.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.payment.model.vo.PaymentInfo;

@Repository
public class PaymentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 장바구니에서 결제창 주문목록 리스트 dao
	public List<PaymentInfo> orderList(Map<String, Object> map) {
		return sqlSession.selectList("paymentMapper.orderList", map);
	}

	// 장바구니에서 결제창 주문목록 썸네일 리스트 dao
	public List<Attachment> bOrderThumbnailList(List<PaymentInfo> olList) {
		return sqlSession.selectList("paymentMapper.bOrderThumbnailList", olList);
	}

	// 결제 성공 시 정보 삽입dao
	public int insertOrderInfo(Map<String, Object> map) {
		return sqlSession.insert("paymentMapper.insertOrderInfo", map);
	}

	// 상품 하나만 일 시 썸네일 가져오기 dao
	public List<Attachment> oneThumbnail(int prdtNo) {
		return sqlSession.selectList("paymentMapper.oneThumbnail", prdtNo);
	}

}

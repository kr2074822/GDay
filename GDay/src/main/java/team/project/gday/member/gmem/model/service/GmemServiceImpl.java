package team.project.gday.member.gmem.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.xml.internal.ws.api.message.Attachment;

import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Order;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.gmem.model.dao.GmemDAO;
import team.project.gday.review.model.vo.Review;

@Service
public class GmemServiceImpl implements GmemService {
	
	@Autowired
	private GmemDAO dao;

	//pInfo 생성service 구현
	@Override
	public PageInfo9 getPageInfo(int cp, Map<String, Object> map) {
		
		String view = (String)(map.get("view"));
		
		int listCount = 0;
		
		switch(view) {
		case "V_ORDER" : listCount = dao.orderListCount(map); break; //주문 목록
		case "V_WISH" : //위시리스트
		//case "V_REVIEW" : listCount = dao.getListCount(map); break;//후기
		}
		
		System.out.println("listCount: " + listCount);
		
		return new PageInfo9(cp, listCount);
	}
	
	//--------------------------------------------------------------------------------------
	
	//------주문 목록 조회--------
	
	//주문 목록 조회 service 구현
	@Override
	public List<Order> selectOrderList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.selectOrderList(pInfo, map);
	}

	//주문 목록 썸네일 조회 service 구현
	@Override
	public List<Attachment> selectThumbnails(List<Order> oList) {
		return dao.selectThumbnails(oList);
	}

	//선물 주문 목록 옵션 조회 service 구현
	@Override
	public List<GOption> selectOptList(List<Order> oList) {
		return dao.selectOptList(oList);
	}

	// 클래스 주문 목록 상세 정보 service 구현
	@Override
	public List<GClass> selectCList(List<Order> oList) {
		return dao.selectCList(oList);
	}
	

	//주문 확인용 후기 체크
	@Override
	public List<Review> selectRCheck(List<Order> oList) {
		return dao.selectRCheck(oList);
	}


	//-----------------------------------주문 목록 끝------------------------------------------

	//주문 상세 조회(주문 번호에 들어간 모든 주문 상품 번호 가져오기) service 구현
	@Override
	public List<Order> selectOrders(Map<String, Object> map) {
		return dao.selectOrders(map);
	}

	
	// 주문 구매 확정 처리 service 구현
	@Override
	public int confirmOrder(int opNo) {
		return dao.confirmOrder(opNo);
	}



	
}

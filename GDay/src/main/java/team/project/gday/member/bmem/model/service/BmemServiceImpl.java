package team.project.gday.member.bmem.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.dao.BmemDAO;
import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.model.vo.Member;

@Service
public class BmemServiceImpl implements BmemService {

	@Autowired
	private BmemDAO dao;

	// 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getGiftPageInfo(int cp, Member loginMember) {

		int giftListCount = dao.getGiftListCount(loginMember);

		return new PageInfo9(cp, giftListCount);
	}

	// 내 판매글 목록 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Gift> bSellList(PageInfo9 pInfo, Member loginMember) {
		return dao.bSellList(pInfo, loginMember);
	}

	// 내 판매글 썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> bSellThumbnailList(List<Gift> gList) {
		return dao.bSellThumbnailList(gList);
	}

	
	
	// 클래스 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getClassPageInfo(int cp, Member loginMember) {
		int classListCount = dao.getClassPageInfo(loginMember);

		return new PageInfo9(cp, classListCount);
	}

	// 판매 회원 클래스 목록 조회 Service 구현
	@Override
	public List<GClass> bClassList(PageInfo9 pInfo, Member loginMember) {
		return dao.bClassList(pInfo, loginMember);
	}

	// 판매 회원 클래스 썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> bClassThumbnailList(List<GClass> cList) {
		return dao.bClassThumbnailList(cList);
	}

	
	
	// 판매 회원 선물 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOrdListPageInfo(int cp, Member loginMember) {
		int orderListCount = dao.getOrdListCount(loginMember);

		return new PageInfo9(cp, orderListCount);
	}

	// 판매 회원 선물 주문 목록 조회 Service 구현
	@Override
	public List<OrderList> bOrderList(PageInfo9 pInfo, Member loginMember) {
		return dao.bOrderList(pInfo, loginMember);
	}

	
	// 주문 상태 변경 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int orderStatusChange(Map<String, Object> map) {
		
		List<GOption> opAry = dao.opNumSelect(map);
		
		int[] opNumAry = new int[opAry.size()];
		
		for(int i = 0; i < opAry.size(); ++i) {
			opNumAry[i] = opAry.get(i).getgOptNo();
		}
		
		System.out.println(opNumAry);
		
		map.put("opNumAry", opNumAry);
		
		int result = dao.orderStatusChange(map);
		
		return result;
	}

	

}
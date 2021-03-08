package team.project.gday.search.bmem.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.search.bmem.dao.BRefundListSearchDAO;

@Service
public class BRefundListSearchServiceImpl implements BRefundListSearchService{

	@Autowired
	private BRefundListSearchDAO dao;
	
	
	// 판매 회원 기본 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getRfsPageInfo(int cp, Map<String, Object> map) {
		int rfsListCount = dao.getRfsPageInfo(map);

		System.out.println("검색된 행의 개수 : " + rfsListCount);
		
		return new PageInfo9(cp, rfsListCount);
	}

	// 판매 회원 기본 날짜 선택 후 검색 Service 구현
	@Override
	public List<OrderList> bRfsList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bRfsList(pInfo, map);
	}
	
	// 판매 회원 기본 날짜 선택 안하고 검색 시  주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getRfsPageInfo2(int cp, Map<String, Object> map) {
		int rfsListCount = dao.getRfsPageInfo2(map);

		System.out.println("검색된 행의 개수 : " + rfsListCount);
		
		return new PageInfo9(cp, rfsListCount);
	}

	// 판매 회원 기본 날짜 선택 안하고 검색 Service 구현
	@Override
	public List<OrderList> bRfsList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bRfsList2(pInfo, map);
	}
	
	
	// 판매 회원 직접 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getRfsPageInfo3(int cp, Map<String, Object> map) {
		int rfsListCount = dao.getRfsPageInfo3(map);

		System.out.println("검색된 행의 개수 : " + rfsListCount);
		
		return new PageInfo9(cp, rfsListCount);
	}

	// 판매 회원 직접 날짜 선택 후 검색 Service 구현
	@Override
	public List<OrderList> bRfsList3(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bRfsList3(pInfo, map);
	}
	
	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getRflPageInfo(int cp, Map<String, Object> map) {
		int rflListCount = dao.getRflPageInfo(map);

		return new PageInfo9(cp, rflListCount);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회 Service 구현
	@Override
	public List<OrderList> bRfDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bRfDaySearchList(pInfo, map);
	}

	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성2 Service 구현
	@Override
	public PageInfo9 getRflPageInfo2(int cp, Map<String, Object> map) {
		int rflListCount = dao.getRflPageInfo2(map);

		return new PageInfo9(cp, rflListCount);
	}
	
	// 판매 회원 날짜 선택 후 주문 목록 조회2 Service 구현
	@Override
	public List<OrderList> bRfDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bRfDaySearchList2(pInfo, map);
	}


}

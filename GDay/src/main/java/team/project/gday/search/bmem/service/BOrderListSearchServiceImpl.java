package team.project.gday.search.bmem.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.search.bmem.dao.BOrderListSearchDAO;

@Service
public class BOrderListSearchServiceImpl implements BOrderListSearchService{

	@Autowired
	private BOrderListSearchDAO dao;
	
	
	// 판매 회원 기본 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOdsPageInfo(int cp, Map<String, Object> map) {
		int odsListCount = dao.getOdsPageInfo(map);

		System.out.println("검색된 행의 개수 : " + odsListCount);
		
		return new PageInfo9(cp, odsListCount);
	}

	// 판매 회원 기본 날짜 선택 후 검색 Service 구현
	@Override
	public List<OrderList> bOdsList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bOdsList(pInfo, map);
	}
	
	// 판매 회원 기본 날짜 선택 안하고 검색 시  주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOdsPageInfo2(int cp, Map<String, Object> map) {
		int odsListCount = dao.getOdsPageInfo2(map);

		System.out.println("검색된 행의 개수 : " + odsListCount);
		
		return new PageInfo9(cp, odsListCount);
	}

	// 판매 회원 기본 날짜 선택 안하고 검색 Service 구현
	@Override
	public List<OrderList> bOdsList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bOdsList2(pInfo, map);
	}
	
	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOdlPageInfo(int cp, Map<String, Object> map) {
		int odlListCount = dao.getOdlListCount(map);

		return new PageInfo9(cp, odlListCount);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회 Service 구현
	@Override
	public List<OrderList> bOrdDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bOrdDaySearchList(pInfo, map);
	}

	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성2 Service 구현
	@Override
	public PageInfo9 getOdlPageInfo2(int cp, Map<String, Object> map) {
		int odlListCount = dao.getOdlListCount2(map);

		System.out.println(odlListCount);
		
		return new PageInfo9(cp, odlListCount);
	}
	
	// 판매 회원 날짜 선택 후 주문 목록 조회2 Service 구현
	@Override
	public List<OrderList> bOrdDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bOrdDaySearchList2(pInfo, map);
	}


}

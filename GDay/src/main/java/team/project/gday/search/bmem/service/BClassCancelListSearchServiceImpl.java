package team.project.gday.search.bmem.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.search.bmem.dao.BClassCancelListSearchDAO;

@Service
public class BClassCancelListSearchServiceImpl implements BClassCancelListSearchService{

	@Autowired
	private BClassCancelListSearchDAO dao;
	
	
	// 판매 회원 기본 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getCcsPageInfo(int cp, Map<String, Object> map) {
		int ccsListCount = dao.getCcsPageInfo(map);

		System.out.println("검색된 행의 개수 : " + ccsListCount);
		
		return new PageInfo9(cp, ccsListCount);
	}

	// 판매 회원 기본 날짜 선택 후 검색 Service 구현
	@Override
	public List<OrderList> bCcsList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bCcsList(pInfo, map);
	}
	
	// 판매 회원 기본 날짜 선택 안하고 검색 시  주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getCcsPageInfo2(int cp, Map<String, Object> map) {
		int ccsListCount = dao.getCcsPageInfo2(map);

		System.out.println("검색된 행의 개수 : " + ccsListCount);
		
		return new PageInfo9(cp, ccsListCount);
	}

	// 판매 회원 기본 날짜 선택 안하고 검색 Service 구현
	@Override
	public List<OrderList> bCcsList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bCcsList2(pInfo, map);
	}
	
	
	// 판매 회원 직접 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getCcsPageInfo3(int cp, Map<String, Object> map) {
		int ccsListCount = dao.getCcsPageInfo3(map);

		System.out.println("검색된 행의 개수 : " + ccsListCount);
		
		return new PageInfo9(cp, ccsListCount);
	}

	// 판매 회원 직접 날짜 선택 후 검색 Service 구현
	@Override
	public List<OrderList> bCcsList3(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bCcsList3(pInfo, map);
	}
	
	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getCclPageInfo(int cp, Map<String, Object> map) {
		int ccsListCount = dao.getCclPageInfo(map);

		return new PageInfo9(cp, ccsListCount);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회 Service 구현
	@Override
	public List<OrderList> bCcDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bCcDaySearchList(pInfo, map);
	}

	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성2 Service 구현
	@Override
	public PageInfo9 getCclPageInfo2(int cp, Map<String, Object> map) {
		int ccsListCount = dao.getCclPageInfo2(map);

		return new PageInfo9(cp, ccsListCount);
	}
	
	// 판매 회원 날짜 선택 후 주문 목록 조회2 Service 구현
	@Override
	public List<OrderList> bCcDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bCcDaySearchList2(pInfo, map);
	}


}

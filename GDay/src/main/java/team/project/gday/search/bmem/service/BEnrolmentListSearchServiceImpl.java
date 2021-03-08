package team.project.gday.search.bmem.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.search.bmem.dao.BEnrolmentListSearchDAO;

@Service
public class BEnrolmentListSearchServiceImpl implements BEnrolmentListSearchService{

	@Autowired
	private BEnrolmentListSearchDAO dao;
	
	
	// 판매 회원 기본 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getEmsPageInfo(int cp, Map<String, Object> map) {
		int emsListCount = dao.getEmsPageInfo(map);

		System.out.println("검색된 행의 개수 : " + emsListCount);
		
		return new PageInfo9(cp, emsListCount);
	}

	// 판매 회원 기본 날짜 선택 후 검색 Service 구현
	@Override
	public List<OrderList> bEmsList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bEmsList(pInfo, map);
	}
	
	// 판매 회원 기본 날짜 선택 안하고 검색 시  주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getEmsPageInfo2(int cp, Map<String, Object> map) {
		int emsListCount = dao.getEmsPageInfo2(map);

		System.out.println("검색된 행의 개수 : " + emsListCount);
		
		return new PageInfo9(cp, emsListCount);
	}

	// 판매 회원 기본 날짜 선택 안하고 검색 Service 구현
	@Override
	public List<OrderList> bEmsList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bEmsList2(pInfo, map);
	}
	
	
	// 판매 회원 직접 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getEmsPageInfo3(int cp, Map<String, Object> map) {
		int emsListCount = dao.getEmsPageInfo3(map);

		System.out.println("검색된 행의 개수 : " + emsListCount);
		
		return new PageInfo9(cp, emsListCount);
	}

	// 판매 회원 직접 날짜 선택 후 검색 Service 구현
	@Override
	public List<OrderList> bEmsList3(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bEmsList3(pInfo, map);
	}
	
	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getEmlPageInfo(int cp, Map<String, Object> map) {
		int emsListCount = dao.getEmlPageInfo(map);

		return new PageInfo9(cp, emsListCount);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회 Service 구현
	@Override
	public List<OrderList> bEmDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bEmDaySearchList(pInfo, map);
	}

	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성2 Service 구현
	@Override
	public PageInfo9 getEmlPageInfo2(int cp, Map<String, Object> map) {
		int emsListCount = dao.getEmlPageInfo2(map);

		return new PageInfo9(cp, emsListCount);
	}
	
	// 판매 회원 날짜 선택 후 주문 목록 조회2 Service 구현
	@Override
	public List<OrderList> bEmDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bEmDaySearchList2(pInfo, map);
	}


}

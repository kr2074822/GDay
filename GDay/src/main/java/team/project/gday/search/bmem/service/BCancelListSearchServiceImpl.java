package team.project.gday.search.bmem.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.search.bmem.dao.BCancelListSearchDAO;

@Service
public class BCancelListSearchServiceImpl implements BCancelListSearchService{

	@Autowired
	private BCancelListSearchDAO dao;
	
	
	// 판매 회원 기본 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOcsPageInfo(int cp, Map<String, Object> map) {
		int ocsListCount = dao.getOcsPageInfo(map);

		System.out.println("검색된 행의 개수 : " + ocsListCount);
		
		return new PageInfo9(cp, ocsListCount);
	}

	// 판매 회원 기본 날짜 선택 후 검색 Service 구현
	@Override
	public List<OrderList> bOcsList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bOcsList(pInfo, map);
	}
	
	// 판매 회원 기본 날짜 선택 안하고 검색 시  주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOcsPageInfo2(int cp, Map<String, Object> map) {
		int ocsListCount = dao.getOcsPageInfo2(map);

		System.out.println("검색된 행의 개수 : " + ocsListCount);
		
		return new PageInfo9(cp, ocsListCount);
	}

	// 판매 회원 기본 날짜 선택 안하고 검색 Service 구현
	@Override
	public List<OrderList> bOcsList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bOcsList2(pInfo, map);
	}
	
	
	// 판매 회원 직접 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOcsPageInfo3(int cp, Map<String, Object> map) {
		int ocsListCount = dao.getOcsPageInfo3(map);

		System.out.println("검색된 행의 개수 : " + ocsListCount);
		
		return new PageInfo9(cp, ocsListCount);
	}

	// 판매 회원 직접 날짜 선택 후 검색 Service 구현
	@Override
	public List<OrderList> bOcsList3(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bOcsList3(pInfo, map);
	}
	
	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOclPageInfo(int cp, Map<String, Object> map) {
		int ocsListCount = dao.getOclPageInfo(map);

		return new PageInfo9(cp, ocsListCount);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회 Service 구현
	@Override
	public List<OrderList> bOcDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bOcDaySearchList(pInfo, map);
	}

	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성2 Service 구현
	@Override
	public PageInfo9 getOclPageInfo2(int cp, Map<String, Object> map) {
		int ocsListCount = dao.getOclPageInfo2(map);

		return new PageInfo9(cp, ocsListCount);
	}
	
	// 판매 회원 날짜 선택 후 주문 목록 조회2 Service 구현
	@Override
	public List<OrderList> bOcDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bOcDaySearchList2(pInfo, map);
	}


}

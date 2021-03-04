package team.project.gday.search.bmem.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.search.bmem.dao.BSellListSearchDAO;

@Service
public class BSellListSearchServiceImpl implements BSellListSearchService{

	@Autowired
	private BSellListSearchDAO dao;
	
	
	// 판매 회원 날짜 선택 후 판매 상품 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getSellPageInfo(int cp, Map<String, Object> map) {
		int sellListCount = dao.getSellListCount(map);

		return new PageInfo9(cp, sellListCount);
	}

	// 판매 회원 날짜 선택 후 판매 상품 목록 조회 Service 구현
	@Override
	public List<Gift> bSellDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bSellDaySearchList(pInfo, map);
	}

	// 판매 회원 날짜 선택 후 판매 상품 썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> bSellSearchThumbnailList(List<Gift> gList) {
		return dao.bSellSearchThumbnailList(gList);
	}
	
	
	// 판매 회원 날짜 선택 후 판매 상품 목록 페이징 처리 객체 생성2 Service 구현
	@Override
	public PageInfo9 getSellPageInfo2(int cp, Map<String, Object> map) {
		int sellListCount = dao.getSellListCount2(map);

		return new PageInfo9(cp, sellListCount);
	}
	
	// 판매 회원 날짜 선택 후 판매 상품 목록 조회2 Service 구현
	@Override
	public List<Gift> bSellDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bSellDaySearchList2(pInfo, map);
	}


}

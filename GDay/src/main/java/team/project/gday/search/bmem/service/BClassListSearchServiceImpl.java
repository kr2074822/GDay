package team.project.gday.search.bmem.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.search.bmem.dao.BClassListSearchDAO;

@Service
public class BClassListSearchServiceImpl implements BClassListSearchService{

	@Autowired
	private BClassListSearchDAO dao;
	
	
	// 판매 회원 날짜 선택 후 클래스 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getClassPageInfo(int cp, Map<String, Object> map) {
		int classListCount = dao.getClassListCount(map);

		return new PageInfo9(cp, classListCount);
	}

	// 판매 회원 날짜 선택 후 클래스 목록 조회 Service 구현
	@Override
	public List<GClass> bClassDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bClassDaySearchList(pInfo, map);
	}

	// 판매 회원 날짜 선택 후 클래스 썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> bClassSearchThumbnailList(List<GClass> cList) {
		return dao.bClassSearchThumbnailList(cList);
	}
	
	
	// 판매 회원 날짜 선택 후 클래스 목록 페이징 처리 객체 생성2 Service 구현
	@Override
	public PageInfo9 getClassPageInfo2(int cp, Map<String, Object> map) {
		int classListCount = dao.getClassListCount2(map);

		return new PageInfo9(cp, classListCount);
	}
	
	// 판매 회원 날짜 선택 후 클래스 목록 조회2 Service 구현
	@Override
	public List<GClass> bClassDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.bClassDaySearchList2(pInfo, map);
	}


}

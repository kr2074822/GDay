package team.project.gday.search.bmem.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.search.bmem.dao.BOrderListSearchDAO;

@Service
public class BOrderListSearchServiceImpl implements BOrderListSearchService{

	@Autowired
	private BOrderListSearchDAO dao;
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOdlPageInfo(int cp, Map<String, Object> map) {
		int odlListCount = dao.getOdlListCount(map);

		System.out.println(odlListCount);
		
		return new PageInfo9(cp, odlListCount);
	}

}

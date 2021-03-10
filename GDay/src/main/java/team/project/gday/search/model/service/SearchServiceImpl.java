package team.project.gday.search.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.gift.model.vo.Gift;
import team.project.gday.search.model.dao.SearchDAO;
import team.project.gday.search.model.vo.Search;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDAO dao;

	//메인 검색결과 선물 10개 보여주기
	@Override
	public List<team.project.gday.Product.model.vo.Gift> selectGiftSearchList(Search search) {
		if(search.getCategory() == null) {
			return dao.selectGiftListAll(search);
		}
		return dao.selectGiftSearchList(search);
	}
	
	//메인 검색결과 클래스 10개 보여주기
	@Override
	public List<GClass> selectClassSearchList(Search search) {
		if(search.getCategory() == null) {
			return dao.selectClassListAll(search);
		}
		return dao.selectClassSearchList(search);
	}

	//썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> selectThumbnailList(List<GClass> gCList) {
		return dao.selectThumbnailList(gCList);
	}
	


}

package team.project.gday.search.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.member.bmem.model.vo.PageInfo10;
import team.project.gday.search.model.dao.SearchDAO;
import team.project.gday.search.model.vo.Search;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDAO dao
	;
	
	@Override
	public PageInfo10 getSearchPageInfo(Search search, int cp) {
		//검색 조건에 맞는 게시글 수 조회
		int listCount = dao.getSearchListCount(search);
		return null;
	}

}

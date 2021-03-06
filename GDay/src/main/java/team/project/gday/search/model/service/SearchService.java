package team.project.gday.search.model.service;

import team.project.gday.member.bmem.model.vo.PageInfo10;
import team.project.gday.search.model.vo.Search;

public interface SearchService {

	PageInfo10 getSearchPageInfo(Search search, int cp);

}

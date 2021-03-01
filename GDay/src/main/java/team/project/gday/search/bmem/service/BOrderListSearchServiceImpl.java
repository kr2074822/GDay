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
	
	@Override
	public PageInfo9 getOdlPageInfo(int cp, Map<String, Object> map) {
		int odlListCount = dao.getOdlListCount(map);

		return new PageInfo9(cp, odlListCount);
	}

}

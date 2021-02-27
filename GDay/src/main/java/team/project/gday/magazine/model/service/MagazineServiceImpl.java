package team.project.gday.magazine.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.magazine.model.dao.MagazineDAO;
import team.project.gday.magazine.model.vo.Magazine;
import team.project.gday.magazine.model.vo.MagazinePageInfo;

@Service 
public class MagazineServiceImpl implements MagazineService{
	
	@Autowired
	private MagazineDAO dao;

	// 매거진 게시글 수 조회 
	@Override
	public MagazinePageInfo getPageInfo(int cp) {
		int listCount = dao.getListCount();
		
		return new MagazinePageInfo(cp, listCount);
	}

	// 매거진 목록 조회 구현
	@Override
	public List<Magazine> selectList(MagazinePageInfo pInfo) {
		return dao.selectList(pInfo);
	}
	
}

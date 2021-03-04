package team.project.gday.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.admin.model.dao.AdminDAO;
import team.project.gday.admin.model.vo.adminPageInfo;
import team.project.gday.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao;
	
	// 페이징 처리를 위한 Service 구현
	@Override
	public adminPageInfo getPageInfo(int cp) {
		int listCount = dao.getListCount();
		
		return new adminPageInfo(listCount, cp);
	}

	// 회원 전체조회 Service 구현
	@Override
	public List<Member> adminMember(adminPageInfo pInfo) {
		return dao.adminMember(pInfo);
	}

}

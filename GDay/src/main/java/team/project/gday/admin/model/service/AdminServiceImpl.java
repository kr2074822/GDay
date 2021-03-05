package team.project.gday.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	// 회원 등급 변경 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMemberGrade(Map<String, Object> map) {
		return dao.updateMemberGrade(map);
	}

	// 블랙리스트 회원 조회 Service 구현
	@Override
	public List<Member> adminBlackMem(adminPageInfo pInfo) {
		return dao.adminBlackMem(pInfo);
	}

}

package team.project.gday.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.project.gday.Product.model.vo.Product;
import team.project.gday.admin.model.dao.AdminDAO;
import team.project.gday.admin.model.vo.adminPageInfo;
import team.project.gday.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao;
	
	// 전체 회원관리 페이징 처리를 위한 Service 구현
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
	
	// -----------------------------------------------------------------------

	// 블랙리스트 회원 페이징 처리를 위한 Service 구현
	@Override
	public adminPageInfo getPageBmInfo(int cp) {
		int listBmCount = dao.getBmListCount();
		return new adminPageInfo(listBmCount, cp);
	}

	// 블랙리스트 회원 조회 Service 구현
	@Override
	public List<Member> adminBlackMem(adminPageInfo pInfo) {
		return dao.adminBlackMem(pInfo);
	}

	// ----------------------------------------------------------------------
	
	// 전체 게시글 페이징 처리를 위한 Service 구현
	@Override
	public adminPageInfo getPageBdInfo(int cp) {
		
		int listBdCount = dao.getListBdCount();
		return new adminPageInfo(listBdCount, cp);
	}

	
	// 게시글 전체조회 Service 구현
	@Override
	public List<Product> productBoard(adminPageInfo pInfo) {
		return dao.productBoard(pInfo);
	}




}

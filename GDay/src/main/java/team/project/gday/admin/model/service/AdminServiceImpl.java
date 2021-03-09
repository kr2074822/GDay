package team.project.gday.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.project.gday.Product.model.vo.Product;
import team.project.gday.admin.model.dao.AdminDAO;
import team.project.gday.admin.model.vo.Customor;
import team.project.gday.admin.model.vo.Report;
import team.project.gday.admin.model.vo.adminPageInfo;
import team.project.gday.magazine.model.vo.Magazine;
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

	// 게시글 상태 변경 Service 구현
	@Transactional(rollbackFor =  Exception.class)
	@Override
	public int boardUpdate(Map<String, Object> map) {
		return dao.boardUpdate(map);
	}
	// -------------------------------------------------------------------
	
	// 매거진 페이징 처리를 위한 Service 구현
	@Override
	public adminPageInfo getPageMzInfo(int cp) {
		
		int listMzCount = dao.getListMzCount();
		return new adminPageInfo(listMzCount, cp);
	}

	// 매거진 게시판 조회 Service 구현
	@Override
	public List<Magazine> adminMagazine(adminPageInfo pInfo) {
		return dao.adminMagazine(pInfo);
	}

	// ---------------------------------------------------
	
	// 관리자 고객센터 페이징 처리 Service 구현
	@Override
	public adminPageInfo getPageAcInfo(int cp) {
		int listAcCount = dao.getListAcCount();
		//System.out.println(listAcCount);
		
		return new adminPageInfo(listAcCount, cp);
	}

	// 관리자 고객센터 목록 조회 Service 구현
	@Override
	public List<Customor> adminCustomor(adminPageInfo pInfo) {
		return dao.adminCustomor(pInfo);
	}


	// --------------------------------------------------------
	// 회원 고객센터 페이징처리 Service 구현
	@Override
	public adminPageInfo getPageMcInfo(int cp, Member loginMember) {
		int listMcCount = dao.getListMcCount(loginMember);
		
		System.out.println("서비스" + listMcCount);
		return new adminPageInfo(listMcCount, cp);
	}

	// 회원 고객센터 목록 조회 Service 구현
	@Override
	public List<Report> memberCustomer(adminPageInfo pInfo, Member loginMember) {
		return dao.memberCustomer(pInfo, loginMember);
	}
	
	// -------------------------------------------------------------
	
	// 신고하기 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int report(Map<String, Object> map, Report report) {
		
		// 게시자 조회
		int writerCheck = dao.writerCheck(map);
		System.out.println(writerCheck);
		
		report.setReportTarget(writerCheck);
		
		// 게시글 타입 조회
		String boardType = dao.boardType(map);
		System.out.println("게시글 타입 조회" +  boardType);
		
		report.setParentType(boardType);
		
		// 게시글 신고
		System.out.println("-----------"+map.get("reportType"));
		
		int reportPost = dao.reportPost(report);
		System.out.println("게시글 신고: " + reportPost);
		
		// 게시자 신고받 횟수
		int reportCount = dao.reportCount(report);
		System.out.println("신고받은 횟수 : " + reportCount);
		
		if(reportCount > 2) {
			int reportMember = dao.reportMember(writerCheck);
			System.out.println("신고당한 횟수: " + reportMember);
		}
		return dao.report(map);
	}


}

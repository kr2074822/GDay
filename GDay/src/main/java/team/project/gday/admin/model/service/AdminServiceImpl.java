package team.project.gday.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.project.gday.Product.model.vo.Product;
import team.project.gday.admin.model.dao.AdminDAO;
import team.project.gday.admin.model.vo.Customor;
import team.project.gday.admin.model.vo.Reply;
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
		
		// System.out.println("서비스" + listMcCount);
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
		int result = 0;
		int result3 = 0;
		
		// 게시자 조회
		int writerCheck = dao.writerCheck(map);
		// System.out.println("게시자: " + writerCheck);
		// System.out.println(map.get("memberNo"));
		// System.out.println(map.get("prdtNo"));
		
		// 게시글 조회
		int prdtCheck = dao.prdtCheck(map);
		System.out.println("게시글: " + prdtCheck);
		
		Report rDuc = dao.reportDupCheck(map);
		
		// System.out.println("rduc" + rDuc);
		
		if(rDuc != null) {
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("prdtNo", rDuc.getParentNo());
			map2.put("memberNo", rDuc.getMemberNo());
		
			// System.out.println("map: " + map2.get("memberNo"));
			// System.out.println("map: "+ map2.get("prdtNo"));

			result = dao.increaseRpCount(map2);
		}

		report.setReportTarget(writerCheck);
		
		// 게시글 타입 조회
		String boardType = dao.boardType(map);
		// System.out.println("게시글 타입 조회" +  boardType);
		
		report.setParentType(boardType);
		
		// System.out.println(result);
		
		// 게시글 신고
		// System.out.println("-----------"+map.get("reportType"));
		if(result == 0) {
			int reportPost = dao.reportPost(report);
			// System.out.println("게시글 신고: " + reportPost);
		}
		
		
		// 게시자 신고받은 횟수
		int reportCount = dao.reportCount(map);
		// System.out.println("신고받은 횟수 : " + reportCount);
		
		if(reportCount > 2) {
			// 게시자
			int reportMember = dao.reportMember(writerCheck);
			// System.out.println("신고당한 횟수: " + reportMember);
			// System.out.println("회원 변경: " + reportMember);
		}
		
		// 게시글 신고받은 횟수
		int reportPrdt = dao.reportPrdt(map);
		System.out.println("게시글 신고횟수: " + reportPrdt);
		
		if(reportPrdt > 2) {
			int reportProduct = dao.reportProduct(prdtCheck);
			System.out.println("게시글 변경: " + reportProduct);
			
			result3 = 1;
		}
		 
		return result3;
	}

	// 신고 게시판 페이징처리 Service 구현
	@Override
	public adminPageInfo getPageRsInfo(int cp) {
		int listRsCount = dao.getListRsCount();
		
		return new adminPageInfo(listRsCount, cp);
	}

	// 신고 게시판 목록 조회 Service 구현
	@Override
	public List<Report> adminReportStand(adminPageInfo pInfo) {
		return dao.adminReportStand(pInfo);
	}
	// ------------------------------------------------------------------------
	
	// 신청 회원들 조회
	@Override
	public List<Member> getMember() {
		return dao.getMember();
	}

	// 신청자 상세 조회
	@Override
	public Member getbMember(int memberNo) {
		return dao.getbMember(memberNo);
	}

	// 업체명 가져오기
	@Override
	public String bmemShop(int memberNo) {
		return dao.bmemShop(memberNo);
	}

	// 댓글 목록 조회
	@Override
	public Reply selectReplyList(int parentCustomerNo) {
		return dao.selectReplyList(parentCustomerNo);
	}
	
	// 댓글 삽입 전 같은 게시판에 있는 댓글들 삭제 Service 구현
	@Override
	public int deleteReply(Map<String, Object> map) {
		return dao.deleteReply(map);
	}
	
	// 댓글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(Map<String, Object> map) {
		map.put("curContent", ((String)map.get("curContent")).replaceAll("\n", "<br>"));
		return dao.insertReply(map);
	}

	
	// 크로스 사이트 스크립트 방지 메소드
	private String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
			
		return result;
	}
	
	
	// 문의글 번호 확인
	@Override
	public Customor memberView(int cusNo) {
		return dao.memberView(cusNo);
	}

	// 승인 성공
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int approval(int memberNo) {
		
		int result = dao.approval(memberNo);
		System.out.println("---"+result);
		if (result > 0) {
			result = dao.lcsApproval(memberNo);
			System.out.println("*****"+ result);
		}
		return result ;
	}

	// 부적합 처리
	@Override
	public int deny(int memberNo) {
		return dao.deny(memberNo);
	}


	// 고객센터 문의 작성 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int customerInsert(Map<String, Object> map) {
		String title = (String)map.get("title");
		String content = (String)map.get("content");
		
		// 크로스 사이트 스크리빙 방지 처리 적용
		title = replaceParameter(title);
		content = replaceParameter(content);		
		content = content.replaceAll("\n", "<br>");
		
		// 처리된 문자열을 다시 map에 세팅
		map.put("title", title);
		map.put("content", content);
		
		return dao.customerInsert(map);
	}

	// 문의글 상태변경 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int cusUpdateStatus(Map<String, Object> map) {
		return dao.cusUpdateStatus(map);
	}

	

}

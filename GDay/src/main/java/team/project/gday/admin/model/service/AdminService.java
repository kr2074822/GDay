<<<<<<< HEAD
package team.project.gday.admin.model.service;

import java.util.List;
import java.util.Map;

import team.project.gday.Product.model.vo.Product;
import team.project.gday.admin.model.vo.Customor;
import team.project.gday.admin.model.vo.Report;
import team.project.gday.admin.model.vo.adminPageInfo;
import team.project.gday.magazine.model.vo.Magazine;
import team.project.gday.member.model.vo.Member;

public interface AdminService {

	
	/** 전체 회원관리 페이징 처리를 위한 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract adminPageInfo getPageInfo(int cp);
	
	/** 회원 전체 조회 Service
	 * @param pInfo
	 * @return mList
	 */
	public abstract List<Member> adminMember(adminPageInfo pInfo);

	/** 회원 등급 변경 Service
	 * @param map
	 * @return result
	 */
	public abstract int updateMemberGrade(Map<String, Object> map);

	/** 블랙리스트 회원 페이징 처리를 위한 Service
	 * @param cp
	 * @return pBmInfo
	 */
	public abstract adminPageInfo getPageBmInfo(int cp);

	/** 블랙 리스트 회원 조회 Service
	 * @param pInfo
	 * @return bmList
	 */
	public abstract List<Member> adminBlackMem(adminPageInfo pInfo);

	/** 게시글 페이징처리 Service
	 * @param cp
	 * @return pList
	 */
	public abstract adminPageInfo getPageBdInfo(int cp);

	/** 게시글 전체 조회 Service
	 * @param pInfo
	 * @return product
	 */
	public abstract List<Product> productBoard(adminPageInfo pInfo);
	
	/** 게시글 상태 변경 Service
	 * @param map
	 * @return result
	 */
	public abstract int boardUpdate(Map<String, Object> map);

	/** 매거진 페이징처리 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract adminPageInfo getPageMzInfo(int cp);

	/** 매거진 게시판 조회 Service
	 * @param pInfo
	 * @return mzList
	 */
	public abstract List<Magazine> adminMagazine(adminPageInfo pInfo);

	/** 관리자 고객센터 페이징처리 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract adminPageInfo getPageAcInfo(int cp);

	/** 관리자 고객센터 목록 조회 Serivce
	 * @param pInfo
	 * @return cList
	 */
	public abstract List<Customor> adminCustomor(adminPageInfo pInfo);

	/** 회원 고객센터 페이징 처리 Service
	 * @param cp
	 * @param memberNo 
	 * @return pInfo
	 */
	public abstract adminPageInfo getPageMcInfo(int cp, Member loginMember);

	/** 회원 고객센터 목록 조회
	 * @param pInfo
	 * @param memberNo
	 * @return rList
	 */
	public abstract List<Report> memberCustomer(adminPageInfo pInfo, Member loginMember);

	/** 신고하기 Service
	 * @param map
	 * @return result
	 */
	public abstract int report(Map<String, Object> map, Report report);

	/** 비즈니스 회원 조회
	 * @return
	 */
	public abstract List<Member> getMember();

	/** 신청자 상세
	 * @param memberNo
	 * @return
	 */
	public abstract Member getbMember(int memberNo);

	/** 업체명 가져오기
	 * @param memberNo
	 * @return
	 */
	public abstract String bmemShop(int memberNo);

	/** 신고 게시판 페이징 처리
	 * @param cp
	 * @return pInfo
	 */
	public abstract adminPageInfo getPageRsInfo(int cp);

	/** 신고 게시판 목록 조회
	 * @param pInfo
	 * @return rsList
	 */
	public abstract List<Report> adminReportStand(adminPageInfo pInfo);






}
=======
package team.project.gday.admin.model.service;

import java.util.List;
import java.util.Map;

import team.project.gday.Product.model.vo.Product;
import team.project.gday.admin.model.vo.Customor;
import team.project.gday.admin.model.vo.Report;
import team.project.gday.admin.model.vo.adminPageInfo;
import team.project.gday.magazine.model.vo.Magazine;
import team.project.gday.member.model.vo.Member;

public interface AdminService {

	
	/** 전체 회원관리 페이징 처리를 위한 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract adminPageInfo getPageInfo(int cp);
	
	/** 회원 전체 조회 Service
	 * @param pInfo
	 * @return mList
	 */
	public abstract List<Member> adminMember(adminPageInfo pInfo);

	/** 회원 등급 변경 Service
	 * @param map
	 * @return result
	 */
	public abstract int updateMemberGrade(Map<String, Object> map);

	/** 블랙리스트 회원 페이징 처리를 위한 Service
	 * @param cp
	 * @return pBmInfo
	 */
	public abstract adminPageInfo getPageBmInfo(int cp);

	/** 블랙 리스트 회원 조회 Service
	 * @param pInfo
	 * @return bmList
	 */
	public abstract List<Member> adminBlackMem(adminPageInfo pInfo);

	/** 게시글 페이징처리 Service
	 * @param cp
	 * @return pList
	 */
	public abstract adminPageInfo getPageBdInfo(int cp);

	/** 게시글 전체 조회 Service
	 * @param pInfo
	 * @return product
	 */
	public abstract List<Product> productBoard(adminPageInfo pInfo);
	
	/** 게시글 상태 변경 Service
	 * @param map
	 * @return result
	 */
	public abstract int boardUpdate(Map<String, Object> map);

	/** 매거진 페이징처리 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract adminPageInfo getPageMzInfo(int cp);

	/** 매거진 게시판 조회 Service
	 * @param pInfo
	 * @return mzList
	 */
	public abstract List<Magazine> adminMagazine(adminPageInfo pInfo);

	/** 관리자 고객센터 페이징처리 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract adminPageInfo getPageAcInfo(int cp);

	/** 관리자 고객센터 목록 조회 Serivce
	 * @param pInfo
	 * @return cList
	 */
	public abstract List<Customor> adminCustomor(adminPageInfo pInfo);

	/** 회원 고객센터 페이징 처리 Service
	 * @param cp
	 * @param memberNo 
	 * @return pInfo
	 */
	public abstract adminPageInfo getPageMcInfo(int cp, Member loginMember);

	/** 회원 고객센터 목록 조회
	 * @param pInfo
	 * @param memberNo
	 * @return rList
	 */
	public abstract List<Report> memberCustomer(adminPageInfo pInfo, Member loginMember);

	/** 신고하기 Service
	 * @param map
	 * @return result
	 */
	public abstract int report(Map<String, Object> map, Report report);


	/** 신고 대기 페이징 처리 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract adminPageInfo getPageRsInfo(int cp);

	/** 신고페이지 목록 조회 Service
	 * @param pInfo
	 * @return
	 */
	public abstract List<Report> adminReportStand(adminPageInfo pInfo);

	/** 비즈니스 회원 조회
	 * @return
	 */
	public abstract List<Member> getMember();

	/** 신청자 상세
	 * @param memberNo
	 * @return
	 */
	public abstract Member getbMember(int memberNo);

	/** 업체명 가져오기
	 * @param memberNo
	 * @return
	 */
	public abstract String bmemShop(int memberNo);







}
>>>>>>> branch 'master' of https://github.com/kr2074822/GDay.git

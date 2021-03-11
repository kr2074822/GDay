package team.project.gday.member.bmem.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.dao.BmemDAO;
import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.bmem.model.vo.RefundList;
import team.project.gday.member.model.vo.BmemberInfo;
import team.project.gday.member.model.vo.LicenseImg;
import team.project.gday.member.model.vo.Member;
import team.project.gday.review.model.exception.UpdateAttachmentFailException;

@Service
public class BmemServiceImpl implements BmemService {

	@Autowired
	private BCryptPasswordEncoder enc;
	
	@Autowired
	private BmemDAO dao;

	// 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getGiftPageInfo(int cp, Member loginMember) {

		int giftListCount = dao.getGiftListCount(loginMember);

		return new PageInfo9(cp, giftListCount);
	}

	// 내 판매글 목록 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Gift> bSellList(PageInfo9 pInfo, Member loginMember) {
		return dao.bSellList(pInfo, loginMember);
	}

	// 내 판매글 썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> bSellThumbnailList(List<Gift> gList) {
		return dao.bSellThumbnailList(gList);
	}

	
	
	// 클래스 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getClassPageInfo(int cp, Member loginMember) {
		int classListCount = dao.getClassPageInfo(loginMember);

		return new PageInfo9(cp, classListCount);
	}

	// 판매 회원 클래스 목록 조회 Service 구현
	@Override
	public List<GClass> bClassList(PageInfo9 pInfo, Member loginMember) {
		return dao.bClassList(pInfo, loginMember);
	}

	// 판매 회원 클래스 썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> bClassThumbnailList(List<GClass> cList) {
		return dao.bClassThumbnailList(cList);
	}

	
	
	// 판매 회원 선물 주문 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOrdListPageInfo(int cp, Member loginMember) {
		int orderListCount = dao.getOrdListCount(loginMember);

		return new PageInfo9(cp, orderListCount);
	}

	// 판매 회원 선물 주문 목록 조회 Service 구현
	@Override
	public List<OrderList> bOrderList(PageInfo9 pInfo, Member loginMember) {
		return dao.bOrderList(pInfo, loginMember);
	}	
	
	// 판매 회원 환불 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getRfListPageInfo(int cp, Member loginMember) {
		int refundListCount = dao.getRfListCount(loginMember);

		return new PageInfo9(cp, refundListCount);
	}

	//판매 회원 환불 목록 조회 Service 구현
	@Override
	public List<RefundList> bRefundList(PageInfo9 pInfo, Member loginMember) {
		return dao.bRefundList(pInfo, loginMember);
	}
	
	// 판매 회원 주문 취소 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getOcListPageInfo(int cp, Member loginMember) {
		int cancelListCount = dao.getOcListCount(loginMember);

		return new PageInfo9(cp, cancelListCount);
	}
	
	// 판매 회원 주문 취소 목록 조회 Service 구현
	@Override
	public List<RefundList> bCancelList(PageInfo9 pInfo, Member loginMember) {
		return dao.bCancelList(pInfo, loginMember);
	}
	
	
	// 판매 회원 수강 신청 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getEmListPageInfo(int cp, Member loginMember) {
		int enrolmentListCount = dao.getEmListCount(loginMember);

		return new PageInfo9(cp, enrolmentListCount);
	}
	
	// 판매 회원 수강 신청 목록 조회 Service 구현
	@Override
	public List<OrderList> bEnrolmentlList(PageInfo9 pInfo, Member loginMember) {
		return dao.bEnrolmentlList(pInfo, loginMember);
	}
	
	
	// 판매 회원 수강 취소 목록 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo9 getCcListPageInfo(int cp, Member loginMember) {
		int classCancelListCount = dao.getCcListCount(loginMember);

		return new PageInfo9(cp, classCancelListCount);
	}
	
	// 판매 회원 수강 취소 목록 조회 Service 구현
	@Override
	public List<RefundList> bClassCancelList(PageInfo9 pInfo, Member loginMember) {
		return dao.bClassCancelList(pInfo, loginMember);
	}
	
	
	
	
	// 주문 상태 변경 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int orderStatusChange(Map<String, Object> map) {
		int result = dao.orderStatusChange(map);
		
		return result;
	}
	
	// 환불 상태 변경 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int refundStatusChange(Map<String, Object> map) {
		int result = dao.refundStatusChange(map);
		
		return result;
	}
	
	// 주문 취소 변경 Service 구현
	@Override
	public int cancelStatusChange(Map<String, Object> map) {
		int result = dao.cancelStatusChange(map);
		
		return result;
	}
	
	// 수강 신청 상태 변경
	@Override
	public int enrolmentStatusChange(Map<String, Object> map) {
		int result = dao.enrolmentStatusChange(map);
		
		return result;
	}
	
	// 수강 취소 상태 변경
	@Override
	public int classCancelStatusChange(Map<String, Object> map) {
		int result = dao.classCancelStatusChange(map);
		
		return result;
	}
	
	
	
	
	// 회원 탈퇴
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int accountDel(Member loginMember) {
		int result = 0;
		System.out.println("----");
		Member login = dao.loginAction(loginMember);
		if(enc.matches(loginMember.getMemberPwd(), login.getMemberPwd())) { 
		
			System.out.println(1111);
			result = dao.accountDel(loginMember.getMemberEmail());
			System.out.println("결과: "+ result);
		}else {
			System.out.println("2222222222");
		}

		return result;
	}

	//비즈니스 회원 정보 조회 service
	@Override
	public BmemberInfo getBmemInfo(int memberNo) {
		
		BmemberInfo bmemInfo = dao.getBmemInfo(memberNo);
		
		//스크립팅 사이트 해제 + 개행문자 처리 해제
		String intro = bmemInfo.getBmemIntro();
		if(intro != null) {
			bmemInfo.setBmemIntro(backParameter(intro.replaceAll("<br>", "\n")));
		}
		
		return bmemInfo;
	}

	//비즈니스 회원 라이선스 조회 service
	@Override
	public LicenseImg getLicense(int memberNo) {
		return dao.getLicense(memberNo);
	}

	
	//비즈니스 인증 재신청
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int recertifyLcs(BmemberInfo bmemInfo, MultipartFile license, String savePath) {
		
		int result = 0;
		
		int memberNo = bmemInfo.getBmemNo();
		
		//개행문자 처리
		String intro = bmemInfo.getBmemIntro();
		if(intro != null) {
			bmemInfo.setBmemIntro(replaceParameter(intro.replaceAll("\n", "<br>")));
		}
		//bmember 정보 업데이트
		result = dao.udpateBmemInfo(bmemInfo);
		
		if(result > 0) {
			String lcsName = rename(license.getOriginalFilename());
			String lcsPath = "/resources/images/licenseImg";
			System.out.println("lcsName:" + lcsName);
			
			LicenseImg oldImg = dao.getLicense(memberNo);
			
			LicenseImg removeImg = new LicenseImg();
			
			if(!license.getOriginalFilename().equals("")) {
				
				result = 0;
				
				LicenseImg newImg = new LicenseImg(memberNo, lcsPath, lcsName);
				
				newImg.setLcsStatus("N");//인증 대기 상태
				
				if(oldImg != null) {
					result = dao.updateLicense(newImg);
				
					removeImg = oldImg;
				} else {
					result = dao.insertLicense(newImg);
				}
				
			
				if(result > 0) {
					result = 0;
					//멤버 등급 변경
					result = dao.updateMemGrade(memberNo);//memGrade를 미인증 대기 비즈니스 회원인 U로 변경
				}
				
				if(result > 0) {
					
					try {
						//서버 저장
						license.transferTo(new File(savePath + "/" + lcsName));
						
					} catch (Exception e) {
						e.printStackTrace();
						throw new UpdateAttachmentFailException("비즈니스 인증 파일 저장 중 에러");
					}
					
					if(removeImg != null) {//서버 삭제
						File tmp = new File(savePath + "/" + removeImg.getLcsName());
						tmp.delete();
					} 
					
				}
				
			} 
			
		}
		return result;
	}

	// 크로스 사이트 스크립트 방지 처리 메소드
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
	
	// 크로스 사이트 스크립트 처리 해제 메소드
	private String backParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&amp;", "&");
			result = result.replaceAll("&lt;", "<");
			result = result.replaceAll("&gt;", ">");
			result = result.replaceAll("&quot;", "\"");
		}
		return result;
	}
		
	
	
	// 파일명 변경 메소드
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		//String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
		// %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}

}
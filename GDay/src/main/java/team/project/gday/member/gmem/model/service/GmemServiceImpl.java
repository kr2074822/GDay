package team.project.gday.member.gmem.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Order;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.gmem.model.dao.GmemDAO;
import team.project.gday.member.model.vo.Member;
import team.project.gday.member.model.vo.ProfileImg;
import team.project.gday.member.model.vo.Refund;
import team.project.gday.review.model.exception.UpdateAttachmentFailException;
import team.project.gday.review.model.vo.Review;

@Service
public class GmemServiceImpl implements GmemService {
	
	@Autowired
	private BCryptPasswordEncoder enc;
	
	@Autowired
	private GmemDAO dao;
	

	//pInfo 생성service 구현
	@Override
	public PageInfo9 getPageInfo(Map<String, Object> map) {
		
		String view = (String)(map.get("view"));
		System.out.println("view: " +  view);
		
		int listCount = 0;
		
		switch(view) {
		case "V_ORDER" : listCount = dao.orderListCount(map); break; //주문 목록
		case "V_WISH" : //위시리스트
		//case "V_REVIEW" : listCount = dao.getListCount(map); break;//후기
		}
		
		System.out.println("listCount: " + listCount);
		
		return new PageInfo9((Integer)map.get("cp"), listCount);
	}
	
	//--------------------------------------------------------------------------------------
	
	//------주문 목록 조회--------
	
	//주문 목록 조회 service 구현
	@Override
	public List<Order> selectOrderList(PageInfo9 pInfo, Map<String, Object> map) {
		return dao.selectOrderList(pInfo, map);
	}

	//주문 목록 썸네일 조회 service 구현
	@Override
	public List<Attachment> selectThumbnails(List<Order> oList) {
		return dao.selectThumbnails(oList);
	}

	//선물 주문 목록 옵션 조회 service 구현
	@Override
	public List<GOption> selectOptList(List<Order> oList) {
		return dao.selectOptList(oList);
	}

	// 클래스 주문 목록 상세 정보 service 구현
	@Override
	public List<GClass> selectCList(List<Order> oList) {
		return dao.selectCList(oList);
	}
	

	//주문 확인용 후기 체크
	@Override
	public List<Review> selectRCheck(List<Order> oList) {
		return dao.selectRCheck(oList);
	}


	//-----------------------------------주문 목록 끝------------------------------------------

	//주문 상세 조회(주문 번호에 들어간 모든 주문 상품 번호 가져오기) service 구현
	@Override
	public List<Order> selectOrders(Map<String, Object> map) {
		return dao.selectOrders(map);
	}

	
	// 주문 구매 확정 처리 service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int confirmOrder(int opNo) {
		return dao.confirmOrder(opNo);
	}

	// 주문 상품 번호 + 타입으로 하나의 주문 가져오기 service 구현
	@Override
	public Order selectAOrder(Map<String, Object> map) {
		return dao.selectAOrder(map);
	}

	//상품 번호로 썸네일 조회 service 구현
	@Override
	public Attachment selectAThumbnail(int prdtNo) {
		return dao.selectAThumbnail(prdtNo);
	}

	//옵션 번호로 옵션 내용 조회 service 구현	
	@Override
	public GOption selectOption(int giftOpNo) {
		return dao.selectOption(giftOpNo);
	}

	//상품 번호로 클래스 상세 내용 조회 service 구현
	@Override
	public GClass selectGClass(int prdtNo) {
		return dao.selectGClass(prdtNo);
	}

	//------------------------------------주문 상세 조회 끝----------------------------------
	
	//환불 테이블에 취소-반품 요청 삽입  + 주문 상태 변경 service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int sendRequest(Refund refund, Map<String, Object> map) {
		
		refund.setRfContent(replaceParameter(refund.getRfContent().replaceAll("\n", "<br>")));
		
		int result = dao.insertRequest(refund);
		
		if(result > 0) {
			result = 0;
			result = dao.updateRfStatus(map);
		}
		
		return result;
	}

	//반품 요청 시 수거지 정보 변경 service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateShipInfo(Map<String, Object> map) {
		return dao.updateShipInfo(map);
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

	//취소/반품 상세 조회
	@Override
	public Refund selectRefundInfo(int opNo) {
		return dao.selectRefundInfo(opNo);
	}

	// 회원 탈퇴
		@Transactional(rollbackFor = Exception.class)
		@Override
		public int accountDel(Member loginMember) {
			int result = 0;
			System.out.println("----");
			Member login = dao.loginAction(loginMember);
			System.out.println(login);
			if(enc.matches(loginMember.getMemberPwd(), login.getMemberPwd())) { 
				System.out.println(1111);
				result = dao.accountDel(loginMember.getMemberEmail());
				System.out.println("결과: "+ result);
			}else {
			}

			return result;
		}

		
		//회원 일반 정보 업데이트
		@Transactional(rollbackFor = Exception.class)
		@Override
		public int updateProfile(List<MultipartFile> profile, String savePath, Member updateMember, boolean profileFlag) {
			
			int result = 0;
			
			result = dao.updateAction(updateMember);
			int memberNo = updateMember.getMemberNo();
			
			if(result > 0) {

				String fileName = null;
				String filePath = "/resources/images/profileImg";
				
				//기존 프로필 확인
				ProfileImg oldImg = dao.selectProfile(memberNo);
				//삭제 파일
				ProfileImg removeImg = new ProfileImg();
			
				boolean serverFlag = false;
				
				if (!profile.isEmpty() && !profile.get(0).getOriginalFilename().equals("")) {
					
					fileName = rename(profile.get(0).getOriginalFilename());
					ProfileImg pf = new ProfileImg(0, filePath, fileName, memberNo);
					//새로운 이미지
	
					if(oldImg != null) {
						result = dao.updateProfile(pf);
						
						removeImg = oldImg;//서버 삭제
						
					} else {
						result = dao.insertProfile(pf);
						
					}
				
					serverFlag = true;
					
				} else {//새 프로필이 없을 때
					if(profileFlag && oldImg != null) {//프로필 삭제 + 기존 프로필 없을 때
						result = dao.deleteProfile(memberNo);
						
						removeImg = oldImg;//서버 삭제
					}
					
					serverFlag = false;
				}
				//db 관련 기능 끝
				
				//서버 삽입 / 삭제
				if(result > 0 && serverFlag) { //삽입, 수정 성공  → 서버에 프로필 삽입
					
					try {
						profile.get(0).transferTo(new File(savePath + "/" + fileName));
						
					} catch (Exception e) {
						e.printStackTrace();
						throw new UpdateAttachmentFailException("프로필 수정 실패");
					}
				}
				
				if(result > 0 && removeImg != null) { //서버에서 프로필 삭제
					File tmp = new File(savePath + "/" + removeImg.getPfName());
					tmp.delete();
				}
				
			}
			
			return result;
		}

		
		// 파일명 변경 메소드
		public String rename(String originFileName) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
			
			int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
			
			String str = "_" + String.format("%05d", ranNum);
			//String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
			// %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)
			
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			
			return date + str + ext;
		}

		
		//비밀번호 구현
		@Transactional(rollbackFor = Exception.class)
		@Override
		public int updatePwd(Map<String, Object> map) {
			
			int result = 0;
			
			//1. 현재 비밀번호가 일치하는지 확인(본인 확인)
			//bcrypt 암호화 → DB에서 비밀번호를 가져와 입력받은 현재 비밀번호와 같은지 확인(matches)
			String savePwd = dao.selectPwd((int)map.get("memberNo"));

			if(savePwd != null) {
				
				//matches(평문 상태 비번(입력받은 비번), 암호화된 비번(DB 비번))
				if(enc.matches((String)map.get("presentPwd"), savePwd)) {
					
					//2. 입력받은 비밀번호와 DB의 비밀번호 일치 시 newPwd 업데이트 처리
					//(1) 새 비밀번호 암호화
					String encPwd = enc.encode((String)map.get("newPwd"));
					
					//(2) 암호화된 비밀번호를 다시 map에 세팅
					map.put("newPwd", encPwd);
					
					//(3) 비밀번호 수정 DAO ㅈ호출
					result = dao.updatePwd(map);
				} 
			}
			return result;
		}


	
}

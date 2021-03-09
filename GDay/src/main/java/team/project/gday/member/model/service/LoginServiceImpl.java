package team.project.gday.member.model.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.RollbackRuleAttribute;
import org.springframework.web.multipart.MultipartFile;

import team.project.gday.member.model.dao.LoginDAO;
import team.project.gday.member.model.vo.AutoLogin;
import team.project.gday.member.model.vo.BMember;
import team.project.gday.member.model.vo.BmemberInfo;
import team.project.gday.member.model.vo.LicenseImg;
import team.project.gday.member.model.vo.Member;
import team.project.gday.member.model.vo.ProfileImg;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder enc;
	
	// 회원 로그인
	@Override
	public Member loginAction(Member inputMember) {
		Member loginMember = dao.loginAction(inputMember);
		if(loginMember != null) {
			if(enc.matches(inputMember.getMemberPwd(),  
					   loginMember.getMemberPwd())) { 
			
			loginMember.setMemberPwd(null);
				
			}else {
				loginMember = null;
			}
		}
		return loginMember;
	}
	
	// 일반 회원 가입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member member, String bmemShop) {
		int result = 0 ;
		String encPwd = enc.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		if (member.getMemberGrade().equals("G")) {
			result = dao.signUp(member);
			System.out.println("서비스 가입확인"+ result);
		}else {
			dao.signUp(member);
			result = dao.checkMemNo(member);
			
			BmemberInfo bmemberinfo = new BmemberInfo(result, bmemShop); 
			result = dao.bmemAddShopName(bmemberinfo);
		}
		return result;
	}
	
	// 회원 이미지 설정 
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertImg(List<MultipartFile> image, String savePath, Member member) {
		List<ProfileImg> uploadImages = new ArrayList<ProfileImg>();
		
		String filePath = "/resources/images/profileImg";
		
		// 회원 번호 조회
		int result = dao.checkMemNo(member);
		
		if (!image.get(0).getOriginalFilename().equals("")) {
			String fileName = rename(image.get(0).getOriginalFilename());
						
			ProfileImg pf = new ProfileImg(0, filePath, fileName, result);
			
			dao.insertImg(pf);
			uploadImages.add(pf);
			try {
				image.get(0).transferTo(new File(savePath + "/" + uploadImages.get(0).getPfName()));
	

				if (member.getMemberGrade().equals("U")) {
					savePath = savePath.replace("profileImg", "licenseImg");
					image.get(1).transferTo(new File(savePath + "/" + uploadImages.get(0).getPfName()));
					
					filePath = "/resources/images/licenseImg";
					LicenseImg li = new LicenseImg(result, filePath, fileName);
					result = dao.insertLicense(li);
					System.out.println("사업지"+result);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			ProfileImg pf = new ProfileImg(0, filePath, "profile.jpg", result);
			result = dao.insertImg(pf);
		}
		
		
		return result;
	}
	
	// 닉네임 체크
	@Override
	public int nickCheck(Member member) {
		return dao.nickCheck(member);
	}

	// 카카오톡 회원가입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int kakaoSignUp(Member member) {
		return dao.kakaoSignUp(member);
	}

	// 카카오톡 로그인
	@Override
	public Member kakaoLogin(Member member) {
		Member loginMember = dao.kakaoLogin(member);
		if(loginMember != null) {
			int token = dao.inputToken(member);
		}
		return loginMember;
	}

	// 이메일 찾기
	@Override
	public String findEmail(Member member) {
		return dao.findEmail(member);
	}
	
	// 이메일 중복
	@Override
	public int checkEmail(Member member) {
		return dao.checkEmail(member);
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

	// 카카오톡 추가 정보 입력
	@Transactional(rollbackFor = Exception.class) 
	@Override
	public int addMoreInfo(Member member) {
		return dao.addMoreInfo(member);
	}
	/*
	 * // 비즈니스 회원 가입
	 * 
	 * @Override public int signUpBmember(BMember bmember) { // TODO Auto-generated
	 * method stub return 0; }
	 */

	// 비즈니스 이미지 추가
	@Override
	public int insertImgBmember(List<MultipartFile> image, String savePath, BMember bmember) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 비밀번호 찾기 변경
	@Transactional(rollbackFor = Exception.class) 
	@Override
	public int changePwAction(Member member) {
		return dao.changePwAction(member);
	}

	// 자동로그인
	@Override
	public int searchSID(Map<String, Object> map) {
		return dao.searchSID(map);
	}

	// 최초 삽입
	@Transactional(rollbackFor = Exception.class) 
	@Override
	public int insertSID(Map<String, Object> map) {
		return dao.insertSID(map);
	}

	// SID 있을경우 업데이트
	@Transactional(rollbackFor = Exception.class) 
	@Override
	public int updateSID(Map<String, Object> map) {
		return dao.updateSID(map);
	}

	// 프사 갖고오기
	@Override
	public ProfileImg getProfile(int memberNo) {
		return dao.getProfile(memberNo);
	}

	// JSESSIONID 비교
	@Override
	public AutoLogin getCookie(String sessionId) {
		return dao.getCookie(sessionId);
	}

	// 인터셉터 멤버
	@Override
	public Member getMember(int memberNo) {
		return dao.getMember(memberNo);
	}

}

package team.project.gday.member.model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import team.project.gday.member.model.dao.LoginDAO;
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
	public int signUp(Member member) {
		String encPwd = enc.encode(member.getMemberPwd());		
		member.setMemberPwd(encPwd);
		return dao.signUp(member);
	}
	
	// 회원 이미지 설정 
	@Override
	public int insertImg(List<MultipartFile> image, String savePath, Member member) {
		
		// 회원 번호 조회
		int result = dao.checkMemNo(member);
		if (!image.get(0).getOriginalFilename().equals("")) {
			String fileName = rename(image.get(0).getOriginalFilename());
			ProfileImg pf = new ProfileImg(0, savePath, fileName, result);
			result = dao.insertImg(pf);
		}else {
			ProfileImg pf = new ProfileImg(0, savePath, "pfp.png", result);
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

	@Override
	public int addMoreInfo(Member member) {
		return dao.addMoreInfo(member);
	}

}

package team.project.gday.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.project.gday.member.model.dao.LoginDAO;
import team.project.gday.member.model.vo.Member;

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




}

package team.project.gday.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.project.gday.member.login.controller.LoginService;
import team.project.gday.member.model.dao.LoginDAO;
import team.project.gday.member.model.vo.Member;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder enc;
	
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

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int kakaoSignUp(Member member) {
		int result = 0;
		result = dao.kakaoSignUp(member);
		
		if(result > 0) {
			// result = dao.kakaoLogin(member);
		}else {
			
		}
		
		return result;
	}


}

package team.project.gday.member.login.controller;

import team.project.gday.member.model.vo.Member;

public interface LoginService {

	public abstract Member loginAction(Member inputMember);

	/** 닉네임 체크
	 * @param member
	 * @return int
	 */
	public abstract int nickCheck(Member member);
	
	/** 카카오톡 회원가입
	 * @param member
	 * @return int
	 */
	public abstract int kakaoSignUp(Member member);

	/** 카카오톡 로그인
	 * @param memberEmail
	 * @param memberNick
	 * @return Member
	 */
	public abstract Member kakaoLogin(Member member);





}

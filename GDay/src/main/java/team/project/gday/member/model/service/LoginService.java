package team.project.gday.member.model.service;

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

	/** 이메일 찾기
	 * @param member
	 * @return member
	 */
	public abstract String findEmail(Member member);

	/** 이메일 중복 검사
	 * @param member
	 * @return
	 */
	public abstract int checkEmail(Member member);





}

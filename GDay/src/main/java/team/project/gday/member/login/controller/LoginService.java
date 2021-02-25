package team.project.gday.member.login.controller;

import team.project.gday.member.model.vo.Member;

public interface LoginService {

	public abstract Member loginAction(Member inputMember);

	public abstract int kakaoSignUp(Member member);



}

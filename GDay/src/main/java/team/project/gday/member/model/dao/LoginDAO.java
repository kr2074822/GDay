package team.project.gday.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.member.model.vo.Member;
import team.project.gday.member.model.vo.ProfileImg;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 닉네임 체크
	 * @param member
	 * @return
	 */
	public int nickCheck(Member member) {
		return sqlSession.selectOne("memberMapper.nickCheck", member);
	}
	
	/** 일반 로그인
	 * @param inputMember
	 * @return
	 */
	public Member loginAction(Member inputMember) {
		return sqlSession.selectOne("memberMapper.loginAction", inputMember);
	}

	/** 카카오톡 회원가입
	 * @param member
	 * @return
	 */
	public int kakaoSignUp(Member member) {
		return sqlSession.insert("memberMapper.kakaoSignUp", member);
	}

	/** 카카오톡 로그인
	 * @param member
	 * @return
	 */
	public Member kakaoLogin(Member member) {
		return sqlSession.selectOne("memberMapper.kakaoLogin", member);
	}

	public String findEmail(Member member) {
		return sqlSession.selectOne("memberMapper.findEmail", member);
	}

	public int inputToken(Member member) {
		return sqlSession.update("memberMapper.inputToken", member);
	}

	/** 이메일 중복
	 * @param member
	 * @return int
	 */
	public int checkEmail(Member member) {
		return sqlSession.selectOne("memberMapper.checkEmail", member);
	}

	public int signUp(Member member) {
		return sqlSession.insert("memberMapper.signUp", member);
	}

	
	// 회원 번호 조회
	public int checkMemNo(Member member) {
		return sqlSession.selectOne("memberMapper.checkMemNo", member);
	}

	public int insertImg(ProfileImg pf) {
		return sqlSession.insert("memberMapper.insertImg", pf);
	}

	public int addMoreInfo(Member member) {
		return sqlSession.update("memberMapper.addMoreInfo", member);
	}




}

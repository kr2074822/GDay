package team.project.gday.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.member.model.vo.AutoLogin;
import team.project.gday.member.model.vo.BmemberInfo;
import team.project.gday.member.model.vo.LicenseImg;
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

	public int bmemAddShopName(BmemberInfo bmemberinfo) {
		return sqlSession.insert("memberMapper.bmemAddShopName", bmemberinfo);
	}

	public int insertLicense(LicenseImg li) {
		return sqlSession.insert("memberMapper.insertLicense", li);
	}

	public int changePwAction(Member member) {
		return sqlSession.update("memberMapper.changePwAction", member);
	}

	public int searchSID(Map<String, Object> map) {
		return sqlSession.selectOne("memberMapper.searchSID", map);
	}

	public int insertSID(Map<String, Object> map) {
		return sqlSession.insert("memberMapper.insertSID", map);
	}

	public int updateSID(Map<String, Object> map) {
		return sqlSession.update("memberMapper.updateSID", map);
	}

	public ProfileImg getProfile(int memberNo) {
		return sqlSession.selectOne("memberMapper.getProfile", memberNo);
	}

	/** JSESSION 비교
	 * @param sessionId
	 * @return
	 */
	public AutoLogin getCookie(String sessionId) {
		return sqlSession.selectOne("memberMapper.getCookie", sessionId);
	}




}

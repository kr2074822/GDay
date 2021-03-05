package team.project.gday.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import team.project.gday.member.model.vo.BMember;
import team.project.gday.member.model.vo.Member;
import team.project.gday.member.model.vo.ProfileImg;

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

	/** 일반 회원 가입
	 * @param member
	 * @param bmemShop 
	 * @return
	 */
	public abstract int signUp(Member member, String bmemShop);

	/** 회원 이미지 설정
	 * @param image
	 * @param savePath
	 * @param member 
	 * @return
	 */
	public abstract int insertImg(List<MultipartFile> image, String savePath, Member member);

	/** 카카오 회원 추가 정보
	 * @param member
	 * @return
	 */
	public abstract int addMoreInfo(Member member);

	/** 비즈니스 회원 가입
	 * @param bmember
	 * @return
	 */
	// public abstract int signUpBmember(BMember bmember);

	/** 비즈니스 회원 이미지 추가
	 * @param image
	 * @param savePath
	 * @param bmember
	 * @return
	 */
	public abstract int insertImgBmember(List<MultipartFile> image, String savePath, BMember bmember);

	/** 비밀번호 찾기 변경 구현
	 * @param member
	 * @return 
	 */
	public abstract int changePwAction(Member member);

	public abstract int searchSID(Map<String, Object> map);

	public abstract int insertSID(Map<String, Object> map);

	public abstract int updateSID(Map<String, Object> map);

	/** 프사 갖고오기
	 * @param memberNo
	 * @return 
	 */
	public abstract ProfileImg getProfile(int memberNo);






}

package team.project.gday.member.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.project.gday.member.model.vo.Member;


@Controller
@RequestMapping("/login/*")
@SessionAttributes({"loginMember"})
public class LoginController {
	@Autowired 
	private LoginService service;
	
	// 로그인 화면
	@RequestMapping("loginView")
	public String loginView(){
		return "login/login";
	}
	
	// 로그인  시작
	@RequestMapping("loginAction")
	public String loginAction(Member inputMember, 
			  @RequestParam(value="saveId", required=false) String saveId,
			  @RequestParam(value="autoId", required=false) String autoId,
//			  @RequestParam(value="saveId", required=false) String ,
//			  @RequestParam(value="autoId", required=false) String ,
			  HttpServletResponse response,
			  Model model) {
		
		System.out.println(saveId);
		System.out.println(inputMember);
		Member loginMember = service.loginAction(inputMember);
		String url = null;
		
		if(loginMember != null) {
			model.addAttribute("loginMember", loginMember);
			
			Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());
			
			if(saveId != null) { 
				cookie.setMaxAge(60 * 60 * 24 * 30);
			}else {
				
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
			
			url = "/";
		
		}else {
			url = "login/login";
		}
		
		
		return url;
		
	}
	
	
	// 로그아웃
	@RequestMapping("logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	// 카카오 로그인
	@RequestMapping("kakaoLogin")
	@ResponseBody
	public String kakaoLogin(Member member, Model model) {
		int random = 0;
		int result = 0;
		String url = null;
		
		// 카카오톡 로그인
		Member loginMember =  service.kakaoLogin(member);
		if (loginMember != null) { // 아이디가 있을때
			model.addAttribute("loginMember", loginMember);
			url = "/";
		}else { // 아이디가 없을때
			// 닉네임 체크
			result = service.nickCheck(member);
			if (result > 0) { // 닉네임이 있을때
				random = (int)(Math.random()*100);
				member.setMemberNick(member.getMemberNick()+random);
			}else { // 닉네임이 없을때
				result = service.kakaoSignUp(member);
				if (result > 0) { // 회원가입 성공했을때
					
				}else { // 회원가입 실패 했을 때
					url = "loginView";
				}
				
			}
		
		}
		
		return  "redirect:" + url;
	}
	
	// 일반회원 회원가입 화면
	@RequestMapping("signUpView")
	public String signUpView() {
		return "login/signUp";
	}
	
	
	// 이메일 찾기 화면
	@RequestMapping("emailView")
	public String emailView() {
		return "login/findEmail";
	}
	
	// 이메일 찾기
	@RequestMapping("findEmail")
	@ResponseBody
	public String findEmail(Member member) {
		String email = service.findEmail(member);
		return email;
	}
	
	// 비밀번호 찾기 화면
	@RequestMapping("passwordView")
	public String passwordView() {
		return "login/findPw";
	}
	
}

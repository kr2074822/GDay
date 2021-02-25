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
			url = "loginView";
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
	public int kakaoLogin(Member member) {
		
		System.out.println(member);
		int result = service.kakaoSignUp(member);
		System.out.println(result);
		return result;
		
	}
}

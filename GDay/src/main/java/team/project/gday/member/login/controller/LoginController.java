package team.project.gday.member.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.project.gday.member.model.service.LoginService;
import team.project.gday.member.model.vo.Member;


@Controller
@RequestMapping("/login/*")
@SessionAttributes({"loginMember"})
public class LoginController {
	
	@Autowired
	JavaMailSender mailSender;
	
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
		
		System.out.println(member);
		
		// 카카오톡 로그인
		Member loginMember =  service.kakaoLogin(member);
		if (loginMember != null) { // 아이디가 있을때
			model.addAttribute("loginMember", loginMember);
			// 토큰 저장
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
	
	// 이메일 인증 
	@RequestMapping("sendEmail")
	@ResponseBody
	public int mailsend(Member member, HttpServletResponse response_email) throws IOException {
		System.out.println(member.getMemberEmail());
		
		int random = (int)(Math.random()*(99999 - 1))+1;
        
        String setfrom = "rladudwn0215@gamil.com";
        String tomail =  member.getMemberEmail();// 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content = "인증번호는 " + random + " 입니다";
        
        System.out.println(random);
        MimeMessage message = mailSender.createMimeMessage();
        try {
            System.out.println(message);
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/login/signUp");     //뷰의이름
        mv.addObject("random", random);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
		/*
		 * PrintWriter out_email = response_email.getWriter();
		 * out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		 * out_email.flush();
		 */
        
        
        return random;
		
	}
	
	// 이메일 중복
	@RequestMapping("checkEmail")
	@ResponseBody
	public int checkEmail(Member member) {
		return service.checkEmail(member);
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
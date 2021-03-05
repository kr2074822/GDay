package team.project.gday.member.login;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import team.project.gday.member.model.service.LoginService;
import team.project.gday.member.model.vo.AutoLogin;
import team.project.gday.member.model.vo.Member;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter{
	@Inject
	private LoginService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginSessionId");
		System.out.println(loginCookie);
		if (loginCookie != null) {
			String sessionId = loginCookie.getValue();
			
			
			System.out.println(sessionId);
			AutoLogin userSession = service.getCookie(sessionId);
			System.out.println(userSession);
			if (userSession != null) {
				// 멤버 가져오기
				Member member = service.getMember(userSession.getMemberNo());
				
				// 프사 가져오기
				
				
				System.out.println(member);
				HttpSession session = request.getSession();
				session.setAttribute("loginMember", member);
			}
		}
		return true;
	}
	   
	  
	
	
	
}

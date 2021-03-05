package team.project.gday.member.login;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import team.project.gday.member.model.service.LoginService;
import team.project.gday.member.model.vo.Member;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter{
	@Inject
	private LoginService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		Cookie loginCookie = WebUtils.getCookie(request, "JSESSIONID");
		System.out.println(loginCookie);
		if (loginCookie != null) {
			String sessionId = loginCookie.getValue();
			
			Member member = service.getCookie(sessionId);
		}
		
		return true;
		
		
	}
	
	
	
	
	
}

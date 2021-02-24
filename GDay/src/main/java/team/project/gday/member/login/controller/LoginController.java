package team.project.gday.member.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/login/*")
@SessionAttributes({"loginMember"})
public class LoginController {
	
	// 로그인 화면
	@RequestMapping("loginView")
	public String loginView(){
		return "login/login";
		
	}
}

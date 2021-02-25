package team.project.gday.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import team.project.gday.admin.model.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService service;

	// 고객센터 화면 전환 Controller
	@RequestMapping("memberCusInt")
	public void memberCustomerInsert() {
		return ;
	}
}

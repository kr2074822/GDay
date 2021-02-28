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

	// 관리자 페이지로 이동 Controller
	@RequestMapping("adminMember")
	public String adminMember() {
		return "admin/adminMember";
	}
	
	// 회원 등급 변경 Controller
	@RequestMapping("memberRating")
	public String memberRating() {
		return null;
	}

	// 블랙리스트 회원 조회 화면 전환 Controller
	@RequestMapping("adminBlackMem")
	public String adminBlackMem() {
		return "admin/adminBlackMem";
	}
	
	// 고객센터 문의 화면 전환 Controller
	@RequestMapping("memberCusInt")
	public String memberCustomerInsert() {
		return "admin/memberCustomerInsert";
	}

	
	// 회원 고객센터 목록 화면 전환 Controller
	@RequestMapping("memberCustomer")
	public String memberCustomer(){
		return "admin/memberCustomer";
	}
	
}

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

	// 비즈니스 회원 목록 조회 화면 전환 Controller
	@RequestMapping("adminBMemSub")
	public String adminBMemSub() {
		return "admin/adminBMemSub";
	}

	// 비즈니스 회원신청 상세조회 화면 전환 Controller
	@RequestMapping("adminBMemView")
	public String adminBMemView() {
		return "admin/adminBMemView";
	}
	
	// 게시판 전체 조회 화면 전환 Controller
	@RequestMapping("adminBoard")
	public String adminBoard() {
		return "admin/adminBoard";
	}
	
	// 신고 회원 화면 전환 Controller
	@RequestMapping("adminReportEnd")
	public String adminReportEnd() {
		return "admin/adminReportEnd";
	}

	// 신고 회원대기 화면 전환 Controller
	@RequestMapping("adminReportStand")
	public String adminReportStand() {
		return "admin/adminReportStand";
	}
	
	// 관리자 고객센터 목록 화면 전환 Controller
	@RequestMapping("adminCustomerService")
	public String adminCustomerService() {
		return "admin/adminCustomerService";
	}
	
	// 블랙리스트 회원 조회 화면 전환 Controller
	@RequestMapping("adminBlackMem")
	public String adminBlackMem() {
		return "admin/adminBlackMem";
	}
	
	// 고객센터 문의 화면 전환 Controller
	@RequestMapping("memberCustomerInsert")
	public String memberCustomerInsert() {
		return "admin/memberCustomerInsert";
	}
	
	// 회원 고객센터 목록 화면 전환 Controller
	@RequestMapping("memberCustomer")
	public String memberCustomer(){
		return "admin/memberCustomer";
	}

	// 회원 고객센터 상세조회 화면 전환 Controller
	@RequestMapping("memberCustomerView")
	public String memberCustomerView(){
		return "admin/memberCustomerView";
	}
	
}

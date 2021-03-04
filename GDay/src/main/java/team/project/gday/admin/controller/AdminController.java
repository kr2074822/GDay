package team.project.gday.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.project.gday.admin.model.service.AdminService;
import team.project.gday.admin.model.vo.adminPageInfo;
import team.project.gday.member.model.vo.Member;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService service;

	// 관리자 페이지/전체 회원관리로 이동 Controller
	@RequestMapping("adminMember")
	public String adminMember(@RequestParam(value = "cp", required = false, defaultValue= "1") int cp,
							  Model model) {
		
		// 페이징 처리
		adminPageInfo pInfo = service.getPageInfo(cp);
		System.out.println(pInfo);
		
		// 전체 회원 조회
		List<Member> mList = service.adminMember(pInfo);
		
		for(Member m : mList) {
			System.out.println(m);
		}
	
		model.addAttribute("mList", mList);
		model.addAttribute("pInfo", pInfo);
		
		return "admin/adminMember";
	}
	
	// 회원 등급 변경 Controller
	@RequestMapping("memberGrade")
	@ResponseBody
	public int memberGrade(@RequestParam String[] memberNo,
							@RequestParam String memberGrade) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("memberGrade", memberGrade);
		
		System.out.println(map);
		int result = service.updateMemberGrade(map);
		
		return result;
	}

	// -----------------------------------------------------------------------------
	
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

	
	// 블랙리스트 회원 조회 화면 전환 Controller
	@RequestMapping("adminBlackMem")
	public String adminBlackMem() {
		return "admin/adminBlackMem";
	}
	
	// 게시판 전체 조회 화면 전환 Controller
	@RequestMapping("adminBoard")
	public String adminBoard() {
		return "admin/adminBoard";
	}
	
	// 매거진 게시판 조회 화면 전환 Controller
	@RequestMapping("adminMagazine")
	public String adminMagazine() {
		return "admin/adminMagazine";
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

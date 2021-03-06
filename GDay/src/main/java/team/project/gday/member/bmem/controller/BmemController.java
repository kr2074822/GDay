package team.project.gday.member.bmem.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.service.BmemService;
import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.model.vo.Member;


@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/bMember/*")
public class BmemController {


	@Autowired 
	private BmemService service;
	
//	===================================== 화면 이동 관련 ======================================
	
	//비즈니스 내 판매 글 이동
	@RequestMapping("bSellList")
	public String bSellList(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
							@ModelAttribute("loginMember") Member loginMember,
							Model model) {				
		
		PageInfo9 pInfo = service.getGiftPageInfo(cp, loginMember);
		
		List<Gift> gList = service.bSellList(pInfo, loginMember);
		
		if(gList != null && !gList.isEmpty()) { // 게시글 목록 조회 성공 시
			List<Attachment> thumbnailList = service.bSellThumbnailList(gList);
			
			if(thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
		}
	
		model.addAttribute("gList", gList);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/bMemPage/bSellList";
	}
	
	//비즈니스 주문조회 이동
	@RequestMapping("bOrderList")
	public String bOrderList(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
							 @ModelAttribute("loginMember") Member loginMember,
							 Model model) {
		
		PageInfo9 pInfo = service.getOrdListPageInfo(cp, loginMember);
		
		List<OrderList> oList = service.bOrderList(pInfo, loginMember);		

		List<String> gOpName = new ArrayList<String>();
		
		
		for(int i = 0; i < oList.size(); ++i) {
			String optName = "";
			List<GOption> gOptNames = service.gOptionList(oList.get(i).getOpNo());
			
			for(GOption opt : gOptNames) {
				optName = opt.getgOptName() + ", ";
			}
			
			gOpName.add(optName);
		}
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("oList", oList);
		map.put("gOpName", gOpName);
		
		System.out.println(map.get("oList")); 
		System.out.println(map.get("gOpName")); 
		
		model.addAttribute("oList", oList);
		model.addAttribute("map", map);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/bMemPage/bOrderList";
	}
	
	//비즈니스 환불 목록 조회 이동
	@RequestMapping("bRefundList")
	public String bRefundList() {
		return "mypage/bMemPage/bRefundList";
	}
	
	//비즈니스 주문 취소 목록 조회 이동
	@RequestMapping("bCancelList")
	public String bCancelList() {
		return "mypage/bMemPage/bCancelList";
	}
	
	//비즈니스 회원이 등록한 클래스 목록 조회 Controller
	@RequestMapping("bClassList")
	public String bClassList(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
							 @ModelAttribute("loginMember") Member loginMember,
							 Model model) {
		
		PageInfo9 pInfo = service.getClassPageInfo(cp, loginMember);
		
		List<GClass> cList = service.bClassList(pInfo, loginMember);
		
		if(cList != null && !cList.isEmpty()) { // 게시글 목록 조회 성공 시
			List<Attachment> thumbnailList = service.bClassThumbnailList(cList);
			
			if(thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
		}
		
		model.addAttribute("cList", cList);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/bMemPage/bClassList";
	}
	
	//비즈니스 수강 신청 목록 조회
	@RequestMapping("bEnrolmentList")
	public String bEnrolmentList() {
		return "mypage/bMemPage/bEnrolmentList";
	}
	
	//비즈니스 수강 취소 목록 조회
	@RequestMapping("bClassCancelList")
	public String bClassCancelList() {
		return "mypage/bMemPage/bClassCancelList";
	}
		
	//비즈니스 내 정보 수정 이동
	@RequestMapping("bMemUpdate")
	public String bMemUpdateForm() {
		return "mypage/bMemPage/bMemUpdate";
	}
	
	//비즈니스 비밀번호 변경 이동
	@RequestMapping("bMemPwdUpdateForm")
	public String bMemPwdUpdateForm() {
		return "mypage/bMemPage/bMemUpdate";
	}
	
	//비즈니스 회원 탈퇴 이동
	@RequestMapping("bMemSessionUpdate")
	public String bMemSessionUpdate() {
		return "mypage/bMemPage/bMemUpdate";
	}
	
	
	
	
//	===================================== 기능 관련 ======================================
	// 주문 목록 상태 변경
	@ResponseBody
	@RequestMapping("orderStatusChange/{status}")
	public int orderStatusChange(@RequestParam(value = "opAry[]") List<String> opAry,
								 @ModelAttribute("loginMember") Member loginMember,
							 	 @PathVariable("status") int status) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", loginMember.getMemberNo());
		map.put("status", status);
		map.put("opAry", opAry);
		
		int result = service.orderStatusChange(map);
				
		System.out.println(result);
		
		return result;
	}
	
}
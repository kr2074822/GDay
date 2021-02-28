package team.project.gday.member.bmem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.project.gday.member.bmem.model.service.BmemService;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.product.model.vo.Attachment;
import team.project.gday.product.model.vo.GClass;
import team.project.gday.product.model.vo.Gift;

@Controller
@RequestMapping("/bMember/*")
public class BmemController {

	@Autowired 
	private BmemService service;
	
//	===================================== 화면 이동 관련 ======================================
	
	
	//비즈니스 내 판매 글 이동
	@RequestMapping("bSellList")
	public String bSellList(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
							Model model) {
		
		PageInfo9 pInfo = service.getGiftPageInfo(cp);
		
		List<Gift> gList = service.bSellList(pInfo);
		
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
	public String bOrderList() {
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
							 Model model) {
		
		PageInfo9 pInfo = service.getClassPageInfo(cp);
		
		List<GClass> cList = service.bClassList(pInfo);
		
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
	
	
	
	
//	===================================== 기능 관련 ======================================
	
	
	
}

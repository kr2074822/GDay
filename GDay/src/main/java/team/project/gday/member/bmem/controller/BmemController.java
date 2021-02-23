package team.project.gday.member.bmem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bMember/*")
public class BmemController {

	//클래스 신청 화면 이동
	@RequestMapping("gClassInsert")
	public String gClassInsert() {
		return "gClass/gClassInsert";
	}
	
	
	//비즈니스 내 판매 글 이동
	@RequestMapping("bSellList")
	public String bSellList() {
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
	@RequestMapping("bCancleList")
	public String bCancleList() {
		return "mypage/bMemPage/bCancleList";
	}
	
	//비즈니스 회원이 등록한 클래스 목록 조회 이동
	@RequestMapping("bClassList")
	public String bClassList() {
		return "mypage/bMemPage/bClassList";
	}
	
	//비즈니스 수강 신청 목록 조회
	@RequestMapping("bEnrolmentList")
	public String bEnrolmentList() {
		return "mypage/bMemPage/bEnrolmentList";
	}
	
	//비즈니스 수강 취소 목록 조회
	@RequestMapping("bClassCancleList")
	public String bClassCancleList() {
		return "mypage/bMemPage/bClassCancleList";
	}
	
	
	
	//비즈니스 내 정보 수정 이동
	@RequestMapping("bMemUpdate")
	public String bMemUpdateForm() {
		return "mypage/bMemPage/bMemUpdate";
	}
}

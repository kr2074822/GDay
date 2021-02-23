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
	
	//비즈니스 주문조회
	@RequestMapping("bOrderList")
	public String bOrderList() {
		return "mypage/bMemPage/bOrderList";
	}
	
	
	//비즈니스 내 정보 수정 이동
	@RequestMapping("bMemUpdate")
	public String bMemUpdateForm() {
		return "mypage/bMemPage/bMemUpdate";
	}
}

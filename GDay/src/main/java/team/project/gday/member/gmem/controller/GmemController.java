package team.project.gday.member.gmem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gMember/*")
public class GmemController {

	//마이페이지 주문 내역 조회
	@RequestMapping("orderList1")
	public String gMemOrderList1() {
		return "mypage/gMemPage/gMemOrderList1";
	}
	
	//내 정보 수정 페이지 이동
	@RequestMapping("updateInfo")
	public String gMemUpdate() {
		return "mypage/gMemPage/gMemUpdate";
	}
}

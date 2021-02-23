package team.project.gday.member.gmem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart/*")
public class GmemCartController {

	// 마이페이지 장바구니 이동
	@RequestMapping("memberCart")
	public String gMemOrderList1() {
		return "mypage/gMemPage/gMemCart";
	}
	
}

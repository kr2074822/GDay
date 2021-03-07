package team.project.gday.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/payment/*")
public class PaymentController {

	// 주문창 이동 Controller
	@RequestMapping("order")
	public String loginView(@ModelAttribute("loginMember") Member loginMember,
							@RequestParam("checkAry") String[] checkAry) {
		
		System.out.println(checkAry.toString());
		return "payment/order";
	}
		
	
	
	// 결제 성공 시 주문 정보 테이블에 담는 Controller
	@RequestMapping("insertOrderInfo")
	public String insertOrderInfo() {
		System.out.println("잘 넘어온듯?");
		return null;
	}
	
}

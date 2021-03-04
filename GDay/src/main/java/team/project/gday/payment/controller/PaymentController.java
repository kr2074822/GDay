package team.project.gday.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/payment/*")
@Controller
public class PaymentController {

	// 주문창 이동 Controller
	@RequestMapping("order")
	public String loginView() {
		return "payment/order";
	}
		
	
	// 주문 성공 시 주문 정보 테이블에 담는 Controller
	@RequestMapping("insertOrderInfo")
	public String insertOrderInfo() {
		System.out.println("잘 넘어온듯?");
		return null;
	}
	
}

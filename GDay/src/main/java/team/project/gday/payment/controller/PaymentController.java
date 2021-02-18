package team.project.gday.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/payment/*")
@Controller
public class PaymentController {

	@RequestMapping("order")
	public String loginView() {
		return "payment/order";
	}
		
//	@ExceptionHandler(Exception.class) 	
//	public void etcException(Exception e, Model model) { 
//		//특정 예외를 제외한 나머지 예외 처리 		
//		e.printStackTrace(); //예외 내용 출력 	
//		model.addAttribute("errorMsg", "회원 관련 서비스 처리 중 오류 발생"); 		 	
//	}
	
}

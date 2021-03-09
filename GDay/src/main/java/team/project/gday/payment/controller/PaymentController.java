package team.project.gday.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.member.model.vo.Member;
import team.project.gday.payment.model.service.PaymentService;
import team.project.gday.payment.model.vo.PaymentInfo;

@Controller
@SessionAttributes({"loginMember", "oList"})
@RequestMapping("/payment/*")
public class PaymentController {

	@Autowired
	private PaymentService service;
	
	// 주문창 이동 Controller
	@RequestMapping("order")
	@ResponseBody
	public int orderInfo(@ModelAttribute("loginMember") Member loginMember,
						 @RequestBody String itemArys,
						 HttpSession session) {
		
		int result = 0;
		
		// 결제할 상품들을 담을 리스트
		List<PaymentInfo> oList = new ArrayList<PaymentInfo>();

		// 문자열로 변한 객체배열에서 필요없는 문자들 제거
		itemArys = itemArys.replace("\"", "");
		itemArys = itemArys.replace("[{", "");
		itemArys = itemArys.replace("}]", "");
		
		// "},{" 를 기준으로 잘라 배열에 담기
		String[] items = itemArys.split("\\},\\{");
		
		// item 문자열에서 , 를 기준으로 다시 자르기
		for(int i = 0; i < items.length; ++i) {
			String[] itemTemp = items[i].split(",");

			// itemTemp에서 : 뒤 값들만 챙기기
			for(int j = 0; j < itemTemp.length; ++j) {
				itemTemp[j] = itemTemp[j].substring(itemTemp[j].indexOf(":"));
				itemTemp[j] = itemTemp[j].replace(":", "");				
			}
			
			// 결제할 상품 정보 담을 객체
			PaymentInfo paymentInfo = new PaymentInfo();
			
			// 주문정보 객체에 가공된 값 넣어주기
			paymentInfo.setCartNo(Integer.parseInt(itemTemp[0]));
			paymentInfo.setPrdtNo(Integer.parseInt(itemTemp[1]));
			paymentInfo.setPrdtName(itemTemp[2]);
			paymentInfo.setgOptNo(Integer.parseInt(itemTemp[3]));
			paymentInfo.setPrdtPrice(Integer.parseInt(itemTemp[4]));
			paymentInfo.setCartAmount(Integer.parseInt(itemTemp[5]));
			
			// 주문 정보 주문 정보 리스트에 저장
			oList.add(paymentInfo);
		}
		
		if(oList != null) {
			session.setAttribute("oList", oList);
			result = 1;
		}
		
		return result;
	}
		
	
	@RequestMapping("paymentForm")
	public String paymentForm(@ModelAttribute("loginMember") Member loginMember,
							  @ModelAttribute("oList") List<PaymentInfo> oList,
							  Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", loginMember.getMemberNo());
		map.put("oList", oList);
		
		List<PaymentInfo> olList = service.orderList(map);
		
		if(olList != null && !olList.isEmpty()) { // 게시글 목록 조회 성공 시
			List<Attachment> thumbnailList = service.bOrderThumbnailList(olList);
			
			if(thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
		}
		
		for(int i = 0; i < olList.size(); ++i) {
			if(olList.get(i).getCartNo() == oList.get(i).getCartNo()) {
				olList.get(i).setCartAmount(oList.get(i).getCartAmount());
			}
		}
		
		model.addAttribute("olList", olList);
		
		System.out.println(olList);
		
		return "payment/order";
	}
	
	
	// 결제 성공 시 주문 정보 테이블에 담는 Controller
	@RequestMapping("insertOrderInfo")
	public String insertOrderInfo() {
		System.out.println("잘 넘어온듯?");
		return null;
	}
	
}

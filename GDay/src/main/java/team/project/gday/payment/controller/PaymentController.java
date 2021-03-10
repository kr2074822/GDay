package team.project.gday.payment.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// 장바구니에서 주문창 이동 Controller
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
				System.out.println(itemTemp[i]);
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
	
	// 선물 상세 페이지에서 바로 주문하기 눌렀을 시 상품 정보 담기
	@RequestMapping("onePaymentInfo")
	@ResponseBody
	public int onePaymentInfo(@RequestParam("prdtNo") int prdtNo,
							  @RequestParam("prdtName") String prdtName,
							  @RequestParam("prdtPrice") int prdtPrice,
							  @RequestParam("prdtAmount") int prdtAmount,
							  @RequestParam("gOptName") String gOptName,
							  HttpSession session) {
		
		int result = 0;
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("prdtNo", prdtNo);
		map.put("prdtName", prdtName);
		map.put("prdtPrice", prdtPrice);
		map.put("prdtAmount", prdtAmount);
		map.put("gOptName", gOptName);
		
		List<Attachment> thumbnailList = service.oneThumbnail(prdtNo);
		
		if(thumbnailList != null) {
			session.setAttribute("tList", thumbnailList);
			session.setAttribute("item", map);
			result = 1;
		}
		
		return result;
	}
	
	
	// 클래스 상세 페이지에서 바로 주문하기 눌렀을 시 상품 정보 담기
	@RequestMapping("onePaymentInfo2")
	@ResponseBody
	public int onePaymentInfo2(@RequestParam("prdtNo") int prdtNo,
							  @RequestParam("prdtName") String prdtName,
							  @RequestParam("prdtPrice") int prdtPrice,
							  @RequestParam("prdtAmount") int prdtAmount,
							  HttpSession session) {
		
		int result = 0;
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("prdtNo", prdtNo);
		map.put("prdtName", prdtName);
		map.put("prdtPrice", prdtPrice);
		map.put("prdtAmount", prdtAmount);
		
		List<Attachment> thumbnailList = service.oneThumbnail(prdtNo);
		
		if(thumbnailList != null) {
			session.setAttribute("tList", thumbnailList);
			session.setAttribute("item", map);
			result = 1;
		}
		
		return result;
	}
	
	
	// 주문하기에서 바로 결제창으로
	@RequestMapping("onePaymentForm")
	public String onePaymentForm() {
		return "payment/order2";
	}
		
	// 주문 성공 시
	@RequestMapping("orderSuccess")
	public String orderSuccess() {
		return "payment/orderSuccess";
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
		
		for(int i = 0; i < oList.size(); ++i) {
			for(int j = 0; j < olList.size(); ++j) {
				if(olList.get(j).getCartNo() == oList.get(i).getCartNo()) {
					olList.get(j).setCartAmount(oList.get(i).getCartAmount());
				}
			}
		}
		
		model.addAttribute("olList", olList);
		
		System.out.println(olList);
		
		return "payment/order";
	}
	
	
	
	
	
	// 결제 성공 시 주문 정보 테이블에 담는 Controller
	@RequestMapping("insertOrderInfo")
	@ResponseBody
	public int insertOrderInfo(@ModelAttribute("loginMember") Member loginMember,
								@RequestParam("memberName") String memberName,
								@RequestParam("memberAddress") String memberAddress,
								@RequestParam("memberPhone") String memberPhone,
								@RequestBody String merchant_uid) throws UnsupportedEncodingException {
		
		memberName = URLDecoder.decode(memberName, "UTF-8");
		memberAddress = URLDecoder.decode(memberAddress, "UTF-8");
		
		int start = merchant_uid.indexOf("merchant_uid");
		int end = merchant_uid.indexOf("memberName");
		
		String importKey = merchant_uid.substring(start,end);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", loginMember.getMemberNo());
		map.put("memberNick", loginMember.getMemberNick());
		map.put("memberName", memberName);
		map.put("memberAddress", memberAddress);
		map.put("memberPhone", memberPhone);
		map.put("importKey", importKey);
		
		int result = service.insertOrderInfo(map);
		
		return result;
	}
	
}

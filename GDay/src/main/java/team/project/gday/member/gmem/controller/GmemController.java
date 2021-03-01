package team.project.gday.member.gmem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gMember/*")
public class GmemController {

	//마이페이지 주문 내역 조회
	@RequestMapping("orderList/{type}")
	public String gMemOrderList(@PathVariable("type") int type) {
		return "mypage/gMemPage/gMemOrderList" + type;
	}
	
	//마이페이지 주문 취소 요청 
	@RequestMapping("cancelRequest/{type}/{opNo}")
	public String cancelRequest(@PathVariable("type") int type,
								@PathVariable("opNo") int opNo) {
		return "mypage/gMemPage/gMemCancelReqst" + type;
	}
	
	
	//마이페이지 주문 상세 조회("orderView/{type}/{orderNo}")
	@RequestMapping("orderView/{type}/{orderNo}")
	public String gMemOrderView(@PathVariable("type") int type,
								@PathVariable("orderNo") int orderNo) {
		
		return "mypage/gMemPage/gMemOrderView" + type;
	}
	
	//내 정보 수정 페이지 이동
	@RequestMapping("updateInfo")
	public String gMemUpdate() {
		return "mypage/gMemPage/gMemUpdate";
	}
	
	//위시리스트 페이지 이동
	@RequestMapping("myWishList")
	public String myWishList() {
		return "mypage/gMemPage/gMemWishList";
	}
	
	//나의 후기 페이지 이동
	@RequestMapping("myReviews")
	public String myReviews() {
		return "mypage/gMemPage/gMemReviewList";
	}
	
	
}

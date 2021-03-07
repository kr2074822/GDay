package team.project.gday.member.gmem.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Order;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.gmem.model.service.GmemService;
import team.project.gday.member.model.vo.ListCondition;
import team.project.gday.member.model.vo.Refund;
import team.project.gday.review.model.vo.Review;

@Controller
@RequestMapping("/gMember/*")
@SessionAttributes({"loginMember"})

public class GmemController {

	@Autowired
	private GmemService service;
	
	//sweet alert 메시지 전달용 변수 선언
	private String swalIcon;
	private String swalTitle;
	private String swalText;

	
	//마이페이지 주문 내역 페이지 이동
	@RequestMapping("orderList/{type}")
	public String gMemOrderList(@PathVariable("type") String type) {
		return "mypage/gMemPage/gMemOrderList" + type;
	}
	
	//마이페이지 주문 내역
	@ResponseBody
	@RequestMapping("selectOrderList/{type}/{memberNo}")
	public String selectOrderList(@PathVariable("type") String type,
				@PathVariable("memberNo") int memberNo,
				@ModelAttribute ListCondition listCd,
				HttpServletRequest request) {
		
		//파라미터 맵에 담기
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type); //G , C
		map.put("memberNo", memberNo);
		map.put("start", listCd.getPeriodStart());		
		map.put("end", listCd.getPeriodEnd());
		map.put("cp", listCd.getCp());
		
		List<Integer> status = new ArrayList<Integer>();
		
		switch(listCd.getStatusNo()) {
		case 100 : status.add(100); break;
		case 200 : status.add(200); break;
		case 300 : status.add(300); break;
		case 400 : status.add(400); status.add(500); break;
		case 600 : status.add(600); status.add(700); break;
		case 800 : status.add(800); break;
		case 900 : status.add(900); break;
		case 1000 : status.add(400); status.add(600); status.add(900); break;
		}
		
		map.put("status", status);
		map.put("view", "V_ORDER");
		
		System.out.println("map: " + map);
		
		
		//json 형태 반환용 map returnMap 생성
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		
		//pInfo 구하기
		PageInfo9 pInfo = service.getPageInfo(map);
		pInfo.setLimit(5);
		
		//System.out.println("pInfo: "+ pInfo);
		
		returnMap.put("pInfo", pInfo);
		
		
		//oList 구하기
		List<Order> oList = service.selectOrderList(pInfo, map); 
		
		System.out.println("oList: " + oList);
		
		
		//returnMap에 oList 넣기
		returnMap.put("oList", oList);//리턴 값 추가 oList
		
		
		if(oList != null && !oList.isEmpty()) {
			
			//썸네일 리스트 구하기
			List<Attachment> thumbnails = service.selectThumbnails(oList);
			
			//System.out.println("thumbnails : " + thumbnails);
			
			
			if(thumbnails != null && !oList.isEmpty()) {
				
				//returnMap에 썸네일 추가
				returnMap.put("thumbnails", thumbnails);
				
				//리뷰 확인하는 거 가져오기 (RV_NO = OP_NO)
				List<Review> rCheck = service.selectRCheck(oList);
				
				if(rCheck != null && !rCheck.isEmpty()) {
					returnMap.put("rCheck", rCheck);
				}
				
				if(type.equals("G")) {//선물일 때
					
					//선물이면 goption 가져와야 함
					List<GOption> optList = service.selectOptList(oList);
					
					if(optList != null && !optList.isEmpty()) {
						returnMap.put("optList", optList);//선물 : returnMap에 optList 추가
						
						//System.out.println("optList : " + optList);
					}
					
				} else if (type.equals("C")) {//클래스일 때
					//클래스면 gclass를 가져와야 함
					
					List<GClass> cList = service.selectCList(oList);
					if(cList != null && !cList.isEmpty()) {
						returnMap.put("cList", cList);
					}
					
					System.out.println(cList);
				} 
			}
		} 
	
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(returnMap); 
	}
	
	//-------------------주문 목록 조회 끝-------------------------
	
	
	//마이페이지 주문 상세 조회("orderView/{type}/{orderNo}")
	@RequestMapping("orderView/{type}/{orderNo}")
	public String gMemOrderView(@PathVariable("type") String type,
								@PathVariable("orderNo") int orderNo, 
								Model model, RedirectAttributes ra,
								@RequestHeader(value="referer", required=false) String referer) {
		String url = null;//주소 담기
		
		//파라미터 맵에 담기
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("orderNo", orderNo);
		
		List<Order> oList = service.selectOrders(map);
		
		if(oList != null && !oList.isEmpty()) {

			model.addAttribute("oList", oList);

			//썸네일 리스트 구하기
			List<Attachment> thumbnails = service.selectThumbnails(oList);
			
			//System.out.println("thumbnails : " + thumbnails);
			
			if(thumbnails != null && !oList.isEmpty()) {
				
				//modelattribute로 보내기
				model.addAttribute("thumbnails", thumbnails);
				
				
				//리뷰 확인하는 거 가져오기 (RV_NO = OP_NO)
				List<Review> rCheck = service.selectRCheck(oList);
				
				System.out.println("rCheck : " + rCheck);
				
				if(rCheck != null && !rCheck.isEmpty()) {
					model.addAttribute("rCheck", rCheck);
				}

				if(type.equals("G")) {//선물일 때
					
					//선물이면 goption 가져와야 함
					List<GOption> optList = service.selectOptList(oList);
					
					if(optList != null && !optList.isEmpty()) {
						model.addAttribute("optList", optList);
						System.out.println("optList : " + optList);
					}
					
				} else if (type.equals("C")) {//클래스일 때
					//클래스면 gclass를 가져와야 함
					
					List<GClass> cList = service.selectCList(oList);
					if(cList != null && !cList.isEmpty()) {
						model.addAttribute("cList", cList);
					}
					
					System.out.println(cList);
				} 
			}
			
			url = "mypage/gMemPage/gMemOrderView" + type;
			
			
		} else {
			if(referer == null) {
				url = "redirect: ../orderList/" + type;
			} else {
				url = "redirct: " + referer;
			}
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "상세 조회 과정 중 오류 발생.");
		}
		return url;
	}
	
	
	//마이페이지 주문 목록에서 구매 확정 처리
	@ResponseBody
	@RequestMapping("confirmOrder")
	public int confirmOrder(@RequestParam("opNo") int opNo) {
		
		int result = service.confirmOrder(opNo);
		return result;
	}
	
	
	//마이페이지 주문 취소 요청 페이지 이동
	@RequestMapping("cancelRequest/{type}/{opNo}")
	public String cancelRequest(@PathVariable("type") String type,
								@PathVariable("opNo") int opNo,
								Model model, RedirectAttributes ra,
								HttpServletRequest request,
								@RequestHeader(value="referer", required=false) String referer) {
		
		String url = null;//주소 담기
		//파라미터 맵에 담기
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("opNo", opNo);
		
		//주문 상품 번호 + 타입으로 주문 정보 조회
		Order order = service.selectAOrder(map);
		
		if(order != null) {

			model.addAttribute("order", order);

			//썸네일 리스트 구하기
			Attachment thumbnail = service.selectAThumbnail(order.getPrdtNo());
			System.out.println("thumbnail : " + thumbnail);
			
			if(thumbnail != null) {
				//modelattribute로 보내기
				model.addAttribute("thumbnail", thumbnail);
				
				if(type.equals("G")) {//선물일 때
					
					//선물이면 goption 가져와야 함
					GOption gOption = service.selectOption(order.getGiftOpNo());
					
					if(gOption != null) {
						model.addAttribute("gOption", gOption);
						System.out.println("gOption : " + gOption);
					}
					
				} else if (type.equals("C")) {//클래스일 때

					//클래스면 gclass를 가져와야 함
					GClass gClass = service.selectGClass(order.getPrdtNo());
					
					if(gClass != null) {
						model.addAttribute("gClass", gClass);
						System.out.println("gClass: " + gClass);
					}
				} 
			}
			url = "mypage/gMemPage/gMemCancelReqst" + type;
			
		} else {
			if(referer == null) {
				url = "redirect: ../orderList/" + type;
			} else {
				url = "redirect: " + referer;
			}
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "취소/반품 요청 페이지 이동 과정 중 오류 발생");
		}
		
		return url;
	}
	
	
	//반품, 취소 요청 보내기
	@RequestMapping("sendRequest/{type}")
	public String sendRequest(@PathVariable("type") String type,
								@ModelAttribute Refund refund,
								@RequestParam(value="shipPhone", required=false) String shipPhone,
								@RequestParam(value="newAddr", required=false) String shipAddr,
								HttpServletRequest request, RedirectAttributes ra) {
		String url;
		
		int statusNo = refund.getStatusNo();
		int opNo = refund.getOpNo();
		int orderNo = refund.getOrderNo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("statusNo", statusNo);
		map.put("opNo", opNo);
		
		//취소-반품 요청 넣기 + 주문 상태 변경
		int result = service.sendRequest(refund, map);
		
		if(result > 0) {
			
			//반품 요청인 경우
			if(type.equals("G") && statusNo == 200) {
				result = 0;
				
				String shipName = refund.getShipName();
				map.put("shipName", shipName);
				map.put("shipPhone", shipPhone);
				map.put("shipAddr", shipAddr);
				map.put("orderNo", orderNo);
				System.out.println(shipAddr);
				
				//수거지 정보 변경
				result = service.updateShipInfo(map);
			}
		} 
		
	    if(result > 0) {
	    	swalIcon = "success";
	    	
	    	if(statusNo == 200) swalTitle = "반품 신청을 완료했습니다.";
	    	else if(statusNo == 100) swalTitle = "취소 신청을 완료했습니다.";
	    	else if(statusNo == 900) swalTitle = "수강 취소 요청을 완료했습니다.";
	    	
	    	//임시로 주문 조회 : 이후에 취소 요청 상세 조회로 이동시키기
	    	url = "redirect:../cancelView/" + type + "/" + opNo;
	    	//url = "redirect:../orderView/" + type + "/" + orderNo;
	    	
	    	//취소 요청 상세 조회 이후 '목록' 버튼 클릭 시 주문 내역 조회로 이동
	    	//request.getSession().setAttribute("returnListURL", "../../orderList/" + type);
	    	
	    } else {
			
	    	swalIcon = "error";
	    	swalTitle = "취소 및 반품 신청 실패!";
			
			url = "redirect:../orderView/" + type + "/" + orderNo;
		}
		
	    ra.addFlashAttribute("swalIcon", swalIcon);
	    ra.addFlashAttribute("swalText", swalText);
		
		return url;
	}
	
	
	//마이페이지 취소/반품 요청 상세 조회("cancelView/{type}/{opNo}")
	@RequestMapping("cancelView/{type}/{opNo}")
	public String gMemCancelView(@PathVariable("type") String type,
									@PathVariable("opNo") int opNo,
									Model model, RedirectAttributes ra,
									HttpServletRequest request) {
		
		String url = null;//주소 담기
		
		//파라미터 맵에 담기
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("opNo", opNo);
		
		//주문 상품 번호 + 타입으로 주문 정보 조회
		Order order = service.selectAOrder(map);
		
		if(order != null) {

			model.addAttribute("order", order);

			//썸네일 리스트 구하기
			Attachment thumbnail = service.selectAThumbnail(order.getPrdtNo());
			System.out.println("thumbnail : " + thumbnail);
			
			if(thumbnail != null) {
				//modelattribute로 보내기
				model.addAttribute("thumbnail", thumbnail);
				
				Refund refund = service.selectRefundInfo(opNo);
				
				if(refund != null) {

					model.addAttribute("refund", refund);
					
					if(type.equals("G")) {//선물일 때
						
						//선물이면 goption 가져와야 함
						GOption gOption = service.selectOption(order.getGiftOpNo());
						
						if(gOption != null) {
							model.addAttribute("gOption", gOption);
							System.out.println("gOption : " + gOption);
						}
						
					} else if (type.equals("C")) {//클래스일 때
	
						//클래스면 gclass를 가져와야 함
						GClass gClass = service.selectGClass(order.getPrdtNo());
						
						if(gClass != null) {
							model.addAttribute("gClass", gClass);
							System.out.println("gClass: " + gClass);
						}
					}
				}
			}
			url = "mypage/gMemPage/gMemCancelView" + type;
			
		} else {
			url = "redirect: ../../orderList/" + type;
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "취소/반품 상세 페이지 이동 과정 중 오류 발생");
		}
		
		return url;
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

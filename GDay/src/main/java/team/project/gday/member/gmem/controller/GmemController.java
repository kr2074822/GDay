package team.project.gday.member.gmem.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.xml.internal.ws.api.message.Attachment;

import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Order;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.gmem.model.service.GmemService;

@Controller
@RequestMapping("/gMember/*")
public class GmemController {

	@Autowired
	private GmemService service;
	
	
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
				@RequestParam("start") String start,
				@RequestParam("end") String end,
				@RequestParam(value="cp", required=false, defaultValue="1") int cp,
				@RequestParam(value="statusNo") int statusNo) {
		
		//파라미터 맵에 담기
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type); //G , C
		map.put("memberNo", memberNo);
		map.put("start", start);		
		map.put("end", end);
		
		List<Integer> status = new ArrayList<Integer>();
		
		switch(statusNo) {
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
		PageInfo9 pInfo = service.getPageInfo(cp, map);
		pInfo.setLimit(10);
		
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
	
	
	//마이페이지 주문 구매 확정 처리
	@ResponseBody
	@RequestMapping("confirmOrder")
	public int confirmOrder(@RequestParam("opNo") int opNo) {
		
		int result = service.confirmOrder(opNo);

		return result;
	}
	
	
	//마이페이지 주문 취소 요청 페이지 이동
	@RequestMapping("cancelRequest/{type}/{opNo}")
	public String cancelRequest(@PathVariable("type") String type,
								@PathVariable("opNo") int opNo) {
		return "mypage/gMemPage/gMemCancelReqst" + type;
	}
	
	
	//마이페이지 취소/반품 요청 상세 조회("cancelView/{type}/{opNo}")
	@RequestMapping("cancelView/{type}/{opNo}")
		public String gMemCancelView(@PathVariable("type") String type,
									@PathVariable("opNo") int orderNo) {
			
			return "mypage/gMemPage/gMemCancelView" + type;
	}
		
	
	//마이페이지 주문 상세 조회("orderView/{type}/{orderNo}")
	@RequestMapping("orderView/{type}/{orderNo}")
	public String gMemOrderView(@PathVariable("type") String type,
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

package team.project.gday.search.bmem.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.model.vo.Member;
import team.project.gday.search.bmem.service.BSellListSearchService;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/bMemSearch/*")
public class BSellListSearchController {
	
	@Autowired
	private BSellListSearchService service;
	
	// 판매 회원 날짜 선택 후 판매 상품 목록 조회 Controller
	@RequestMapping("bSellDaySearch/{day}")
	public String bSellDaySearch(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
								@ModelAttribute("loginMember") Member loginMember,
								@PathVariable("day") String selectDay,
								Model model) {				
		
		int day = 0;
		int memberNo = loginMember.getMemberNo();
				
		switch(selectDay) {
		case "7days" : day = 7; break;
		case "1Month" : day = 30; break;
		case "3Months" : day = 90; break;
		case "6Months" : day = 180; break;
		}		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("day", day);
						
		PageInfo9 pInfo = service.getSellPageInfo(cp, map);		
		
		List<Gift> gList = service.bSellDaySearchList(pInfo, map);
		
		if(gList != null && !gList.isEmpty()) { // 게시글 목록 조회 성공 시
			List<Attachment> bSellSearchThumbnailList = service.bSellSearchThumbnailList(gList);
			
			if(bSellSearchThumbnailList != null) {
				model.addAttribute("thList", bSellSearchThumbnailList);
			}
		}
		
		model.addAttribute("gList", gList);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("day", day);
		
		return "mypage/bMemPage/bSellList";
	}
	
	
	// 판매 회원 날짜 선택 후 판매 상품 목록 조회2 Controller
	@RequestMapping("bSellDaySearch2/{startText}/{endText}")
	public String bOrdDaySearch2(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
								 @ModelAttribute("loginMember") Member loginMember,
								 @PathVariable("startText") String startText,
								 @PathVariable("endText") String endText,
								 Model model) {				
		
		String startDay = startText;
		String endDay = endText;
		
		Date startReult = Date.valueOf(startDay);  
		Date endReult = Date.valueOf(endDay);  
		
		int memberNo = loginMember.getMemberNo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("startDay", startReult);
		map.put("endDay", endReult);
		
		PageInfo9 pInfo = service.getSellPageInfo2(cp, map);		
		
		List<Gift> gList = service.bSellDaySearchList2(pInfo, map);
		
		model.addAttribute("gList", gList);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("startText", startText);
		model.addAttribute("endText", endText);
		
		return "mypage/bMemPage/bSellList";
	}
	
}

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

import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.model.vo.Member;
import team.project.gday.search.bmem.service.BCancelListSearchService;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/bMemSearch/*")
public class BCancelListSearchController {
	
	@Autowired
	private BCancelListSearchService service;
	
	
	// 판매 회원 기본 날짜 선택 후 검색 Controller
	@RequestMapping("bOcSearch/{day}")
	public String bOcSearch(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
							   @RequestParam(value="sv", required = false) String searchValue,
							   @RequestParam(value="sk", required = false) String searchKey,
							   @ModelAttribute("loginMember") Member loginMember,
							   @PathVariable("day") int day,
							   Model model) {				
		
		System.out.println(searchValue); // sdf
		System.out.println(day); // 30
		System.out.println(searchKey); // all
		
		int memberNo = loginMember.getMemberNo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("searchValue", searchValue);
		map.put("day", day);
		map.put("searchKey", searchKey);
						
		PageInfo9 pInfo = service.getOcsPageInfo(cp, map);		
		
		List<OrderList> rList = service.bOcsList(pInfo, map);
		
		System.out.println(rList);
		
		model.addAttribute("rList", rList);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/bMemPage/bRefundList";
	}
	
	
	// 판매 회원 기본 날짜 선택 안하고 검색 Controller
	@RequestMapping("bOcSearch")
	public String bOcSearch2(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
							  @RequestParam(value="sv", required = false) String searchValue,
							  @RequestParam(value="sk", required = false) String searchKey,
							  @ModelAttribute("loginMember") Member loginMember,
							  Model model) {				
		
		int memberNo = loginMember.getMemberNo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("searchValue", searchValue);
		map.put("searchKey", searchKey);
						
		PageInfo9 pInfo = service.getOcsPageInfo2(cp, map);		
		
		List<OrderList> rList = service.bOcsList2(pInfo, map);
		
		System.out.println(rList);
		
		model.addAttribute("rList", rList);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/bMemPage/bRefundList";
	}
	
	
	// 판매 회원 날짜 직접 선택 하고 검색 Controller
	@RequestMapping("bOcSearch/{startText}/{endText}")
	public String bOcSearch3(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
								 @ModelAttribute("loginMember") Member loginMember,
								 @PathVariable("startText") String startText,
								 @PathVariable("endText") String endText,
								 @RequestParam(value="sv", required = false) String searchValue,
								 @RequestParam(value="sk", required = false) String searchKey,
								 Model model) {				
		
		String startDay = startText;
		String endDay = endText;
		
		Date startReult = Date.valueOf(startDay);  
		Date endReult = Date.valueOf(endDay);  		
		
		int memberNo = loginMember.getMemberNo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("searchValue", searchValue);
		map.put("searchKey", searchKey);
		map.put("startDay", startReult);
		map.put("endDay", endReult);
		
		PageInfo9 pInfo = service.getOcsPageInfo3(cp, map);		
		
		List<OrderList> rList = service.bOcsList3(pInfo, map);
		
		model.addAttribute("rList", rList);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("startText", startText);
		model.addAttribute("endText", endText);
		
		return "mypage/bMemPage/bRefundList";
	}
	
	
	
	// 판매 회원 날짜 선택 후 목록 조회 Controller
	@RequestMapping("bOcDaySearch/{day}")
	public String bRfDaySearch(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
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
						
		PageInfo9 pInfo = service.getOclPageInfo(cp, map);		
		
		List<OrderList> rList = service.bOcDaySearchList(pInfo, map);
		
		model.addAttribute("rList", rList);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("day", day);
		
		return "mypage/bMemPage/bRefundList";
	}
	
	
	// 판매 회원 날짜 선택 후 목록 조회2 Controller
	@RequestMapping("bOcDaySearch2/{startText}/{endText}")
	public String bRfDaySearch2(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
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
		
		PageInfo9 pInfo = service.getOclPageInfo2(cp, map);		
		
		List<OrderList> rList = service.bOcDaySearchList2(pInfo, map);
		
		model.addAttribute("rList", rList);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("startText", startText);
		model.addAttribute("endText", endText);
		
		return "mypage/bMemPage/bRefundList";
	}
	
}

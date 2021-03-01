package team.project.gday.search.bmem.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.model.vo.Member;
import team.project.gday.search.bmem.service.BOrderListSearchService;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/bMemSearch/*")
public class BOrderListSearchController {
	
	private BOrderListSearchService service;
	
	//비즈니스 내 판매 글 이동
	@RequestMapping("bOrdDaySearch/{day}")
	public String bOrdDaySearch(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
								@ModelAttribute("loginMember") Member loginMember,
								@PathVariable("day") String selectDay,
								Model model) {				
		
		System.out.println(selectDay);
		
		int day = 0;
		int memberNo = loginMember.getMemberNo();
		
		switch(selectDay) {
		case "7days" : day = 7; break;
		case "1Month" : day = 30; break;
		case "3Months" : day = 90; break;
		case "6Months" : day = 180; break;
		}
		
		System.out.println(day);
		
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("day", day);
		
		PageInfo9 pInfo = service.getOdlPageInfo(cp, map);
		
		
		
		return "mypage/bMemPage/bOrderList";
	}
}

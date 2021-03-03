package team.project.gday.gift.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.gift.model.service.GiftService;

@Controller 
@SessionAttributes({"loginMember"})
@RequestMapping("/gift/*")
public class GiftCtrl {
	
	@Autowired
	private GiftService service;
	
	// 선물 리스트 화면
	@RequestMapping("list")
	public String giftList() {
		return "gift/giftList";
	}
	// 선물 등록 화면
	@RequestMapping("insertView")
	public String giftInsertView() {
		return "gift/giftInsert";
	}
	
	
	// 선물 등록 기능 구현
	@RequestMapping("insert")
	public String giftInsert() {
		System.out.println(1);
		return "redirect:/";
	}
	
	
}

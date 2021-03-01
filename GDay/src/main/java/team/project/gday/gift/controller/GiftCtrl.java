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
	
	@RequestMapping("list")
	public String giftList() {
		return "gift/giftList";
	}
	
	
	
}

package team.project.gday.gClass.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.gift.model.service.GiftService;

@Controller 
@SessionAttributes({"loginMember"})
@RequestMapping("/gClass/*")
public class gClassController {
	
	@Autowired
	private GiftService service;
	
	// ==============화면 전환용================
	@RequestMapping("list")
	public String giftList() {
		return "gClass/gClassList";
	}
	

	// ==============기능 구현용================
}

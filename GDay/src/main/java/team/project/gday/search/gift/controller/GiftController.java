package team.project.gday.search.gift.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gift/*")
public class GiftController {
	@RequestMapping("giftView")
	public String gift() {
		return "gift/giftView";
	}
}

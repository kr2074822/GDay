package team.project.gday.common.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common/*")
public class MainController {
	@RequestMapping("bMain")
	public String bMain() {
		return "common/bMain";
	}
}

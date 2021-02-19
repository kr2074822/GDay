package team.project.gday.search.gClass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gClass/*")
public class GclassController {
	@RequestMapping("gClassView")
	public String gClass() {
		return "gClass/gClassView";
	}
}

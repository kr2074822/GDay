package team.project.gday.member.bmem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bMember/*")
public class BmemController {

	//클래스 신청 화면 이동
	@RequestMapping("gClassInsert")
	public String gClassInsert() {
		return "gClass/gClassInsert";
	}
}

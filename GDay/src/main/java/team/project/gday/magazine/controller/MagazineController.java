package team.project.gday.magazine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.magazine.model.service.MagazineService;

@Controller // 컨트롤러임을 알려줌 + bean 등록
@SessionAttributes({"loginMember"})
@RequestMapping("/magazine/*")
public class MagazineController {
	

	 @Autowired 
	 private MagazineService service;
	 
	
	
	
}

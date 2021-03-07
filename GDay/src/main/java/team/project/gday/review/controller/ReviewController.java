package team.project.gday.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.review.model.service.ReviewServiceImpl;


@Controller
@RequestMapping("/review/*")
@SessionAttributes({"loginMember"})
public class ReviewController {

	@Autowired
	private ReviewServiceImpl service;
	
	//sweet alert 메시지 전달용 변수 선언
	private String swalIcon;
	private String swalTitle;
	private String swalText;
}

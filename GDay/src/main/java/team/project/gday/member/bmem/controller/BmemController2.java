package team.project.gday.member.bmem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.project.gday.member.bmem.model.service.BmemService2;
import team.project.gday.member.model.vo.Member;

@Controller
@RequestMapping("/bMember2/*")
public class BmemController2 {

	@Autowired 
	private BmemService2 service;
	
	
	//==============화면 전환용================
	
	//클래스 등록 신청 화면 이동
	@RequestMapping("gClassInsert")
	public String gClassInsert() {
		return "gClass/gClassInsert";
	}
	
	//==============기능 구현용=================
	//클래스 등록 신청 Controller

}

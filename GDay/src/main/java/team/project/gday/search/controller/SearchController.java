package team.project.gday.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.project.gday.Product.model.vo.GClass;
import team.project.gday.gift.model.vo.Gift;
import team.project.gday.search.model.service.SearchService;
import team.project.gday.search.model.vo.PageInfoMain;
import team.project.gday.search.model.vo.Search;

@Controller
public class SearchController {

	@Autowired
	private SearchService service;
	
	@RequestMapping("/search/*")
	public String searchItem(@RequestParam(value="cp", required=false, defaultValue = "1") int cp,
							@ModelAttribute Search search,
							Model model) {
		
		//1. (선물 찾기 + 10개만 보여주기) 검색 조건이 포함된 클래스 목록 조회
		PageInfoMain pInfo = new PageInfoMain(cp);
		List<Gift> gList = service.selectGiftSearchList(search, pInfo);
		
		//2. (클래스 찾기 + 10개만 보여주기) 검색 조건이 포함된 선물 목록 조회
		List<GClass> cList = service.selectClassSearchList(search, pInfo); 
		
		//3. 썸네일 가져오기
		
		
		model.addAttribute("gList", gList);
		model.addAttribute("cList", cList);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("search", search);
		
		return "mainSearch";
	}
	
}

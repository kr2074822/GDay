package team.project.gday.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.project.gday.member.bmem.model.vo.PageInfo10;
import team.project.gday.search.model.service.SearchService;
import team.project.gday.search.model.vo.Search;

@Controller
public class SearchController {

	@Autowired
	private SearchService service;
	
	@RequestMapping("/search/*")
	public String searchItem(@RequestParam(value="cp", required=false, defaultValue = "1") int cp,
							@ModelAttribute Search search,
							Model model) {
		
		PageInfo10 pInfo = service.getSearchPageInfo(search, cp);
		
		return null;
	}
	
}

package team.project.gday.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import team.project.gday.search.model.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private SearchService service;
	
	@RequestMapping("/search/*")
	public String searchItem(@RequestParam(value="category", required=false) int category,
							@RequestParam(value="hashNo", required=false) int hashNo,
							@RequestParam(value="sv", required=false) String sv,
							Model model) {
		
		
		
		return null;
	}
	
}

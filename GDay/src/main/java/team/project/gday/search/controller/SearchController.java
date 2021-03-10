package team.project.gday.search.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.ProductStar;
import team.project.gday.gClass.model.service.GClassService;
import team.project.gday.gift.model.service.GiftService;
import team.project.gday.gift.model.vo.Gift;
import team.project.gday.search.model.service.SearchService;
import team.project.gday.search.model.vo.Search;

@Controller
public class SearchController {

	@Autowired
	private SearchService service;
	@Autowired
	private GClassService cService;
	@Autowired
	private GiftService gService;
	
	@RequestMapping("/search")
	public String searchItem(@RequestParam(value="cp", required=false, defaultValue = "1") int cp,
							@ModelAttribute Search search,
							Model model) {
		
		//1. (선물 찾기 + 10개만 보여주기) 검색 조건이 포함된 클래스 목록 조회
		List<team.project.gday.Product.model.vo.Gift> gList = service.selectGiftSearchList(search);
		List<Attachment> gthList = new ArrayList<>();
		List<ProductStar> gSelectStarList = new ArrayList<>();
		
		//2. (클래스 찾기 + 10개만 보여주기) 검색 조건이 포함된 선물 목록 조회
		List<GClass> gCList = service.selectClassSearchList(search); 
		List<Attachment> thList = new ArrayList<>();
		List<ProductStar> selectStarList = new ArrayList<>();
		
		//3. 썸네일 가져오기
		//if(gList!=null) { List<Attachment> gThumbnailList = new GiftServiceImpl().selectThumbnaiList(gList); }
		if(gCList!=null  && !gCList.isEmpty()) { 
			System.out.println(gCList);
			thList = service.selectThumbnailList(gCList);
			System.out.println(thList);
			
			selectStarList = cService.selectStarList(gCList);
			}
		
		if(gList!=null  && !gList.isEmpty()) { 
			thList = gService.selectThumbnailList(gList);
			gSelectStarList = gService.selectStarList(gList);
			}
				
		model.addAttribute("thList", thList);
		model.addAttribute("gthList", gthList);
		
		model.addAttribute("gCList", gCList);
		model.addAttribute("gList", gList);
		
		model.addAttribute("selectStarList", selectStarList);
		model.addAttribute("gSelectStarList", gSelectStarList);
		model.addAttribute("search", search);
		
		return "search/mainSearch";
	}
	
}

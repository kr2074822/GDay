package team.project.gday.gClass.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.gClass.model.service.GClassService;
import team.project.gday.member.bmem.model.vo.PageInfo10;

@Controller 
@SessionAttributes({"loginMember"})
@RequestMapping("/gClass/*")
public class GClassController {
	
	@Autowired
	private GClassService service;

	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	
	//상품 목록 조회 Controller
	@RequestMapping("list")
	public String giftList(@RequestParam(value="cp", required=false, defaultValue="1") int cp,
							Model model){
		PageInfo10 pInfo = service.getPageInfo(cp);
		
		List<GClass> gCList = service.selectList(pInfo);
		
		if(gCList != null && !gCList.isEmpty()) {
			List<Attachment> thumbnailList = service.selectThumbnailList(gCList);
			if(thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
		}
		
		model.addAttribute("gCList", gCList);
		model.addAttribute("pInfo", pInfo);
		
		return "gClass/gClassList";
	}
	
	

}

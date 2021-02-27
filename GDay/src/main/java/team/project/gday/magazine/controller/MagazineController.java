package team.project.gday.magazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.magazine.model.service.MagazineService;
import team.project.gday.magazine.model.vo.Magazine;
import team.project.gday.magazine.model.vo.MagazinePageInfo;

@Controller // 컨트롤러임을 알려줌 + bean 등록
@SessionAttributes({"loginMember"})
@RequestMapping("/magazine/*")
public class MagazineController {
	
	 @Autowired 
	 private MagazineService service;
	 
	@RequestMapping("list")
	public String magazineList (@RequestParam(value="cp", required = false ,defaultValue = "1" ) int cp,
			Model model) {
		// System.out.println("type : " + type);
		// System.out.println("cp : " + cp);
		
		// 1) 페이징 처리를 위한 객체 PageInfo 생성
		MagazinePageInfo pInfo = service.getPageInfo(cp);
		
		// System.out.println(pInfo);
		
		// 2) 게시글 목록 조회 
		List<Magazine> mList = service.selectList(pInfo); 
		
		/*
		for(Board b : bList) {
			System.out.println(b);
		}
		*/
		
		
		
		
		// 썸네일부분
		/*
		 * if (bList != null && !bList.isEmpty()) { List<Magazine> thumbnailList =
		 * service.selectThumbnailList(bList); if (thumbnailList != null) {
		 * model.addAttribute("thList", thumbnailList); } }
		 */
		// 게시글 목록, 페이징 처리 정보를 request scope로 세팅 후 foward 진행
		
		model.addAttribute("mList", mList);
		model.addAttribute("pInfo", pInfo);
		
		
		return "magazine/magazine";
	}
	
	@RequestMapping("paging")
	@ResponseBody
	public List<Magazine> paging (@RequestParam(value="cp", required = false ,defaultValue = "1" ) int cp,
			Model model) {
		
		MagazinePageInfo pInfo = service.getPageInfo(cp);
		System.out.println(pInfo);
		
	
		List<Magazine> mList = service.selectList(pInfo); 
		
		model.addAttribute("mList", mList);
		model.addAttribute("pInfo", pInfo);
		
		System.out.println(mList);
		
		return mList;
	}
}

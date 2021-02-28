package team.project.gday.magazine.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		
		
		 if (mList != null && !mList.isEmpty()) { 
			 List<Magazine> mThumbList =
			 service.selectThumbnailList(mList); 
			 if (mThumbList != null) {
				 model.addAttribute("mThumbList", mThumbList); 
			 } 
			 System.out.println("이미지 획인: " + mThumbList);
		}
		
		
		
		
		// 게시글 목록, 페이징 처리 정보를 request scope로 세팅 후 foward 진행
		
		model.addAttribute("mList", mList);
		model.addAttribute("pInfo", pInfo);
		
		
		return "magazine/magazine";
	}
	
	// 매거진 페이징 처리
	@RequestMapping("paging")
	@ResponseBody
	public Map<String, Object> paging (@RequestParam(value="cp", required = false ,defaultValue = "1" ) int cp,
			Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		MagazinePageInfo pInfo = service.getPageInfo(cp);
		System.out.println(pInfo);
		
		map.put("pInfo", pInfo);
	
		List<Magazine> mList = service.selectList(pInfo); 
		
		
		map.put("mList", mList);
		
		
		
		// 썸네일부분
		if (mList != null && !mList.isEmpty()) { 
			 List<Magazine> mThumbList =
			 service.selectThumbnailList(mList); 
			 if (mThumbList != null) {
				 model.addAttribute("mThumbList", mThumbList); 
				 map.put("mThumbList", mThumbList);
			 } 
			 System.out.println("이미지 획인: " + mThumbList);
		}
		
		
		

		System.out.println("--------"+map);
		
		
		
		model.addAttribute("mList", mList);
		model.addAttribute("pInfo", pInfo);
		
		System.out.println(mList);
		
		return map;
	}
}

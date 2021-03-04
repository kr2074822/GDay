package team.project.gday.magazine.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.magazine.model.service.MagazineService;
import team.project.gday.magazine.model.vo.Magazine;
import team.project.gday.magazine.model.vo.MagazineImg;
import team.project.gday.magazine.model.vo.MagazinePageInfo;
import team.project.gday.member.model.vo.Member;

@Controller // 컨트롤러임을 알려줌 + bean 등록
@SessionAttributes({"loginMember"})
@RequestMapping("/magazine/*")
public class MagazineController {
	
	 @Autowired 
	 private MagazineService service;
	 
	@RequestMapping("list")
	public String magazineList (@RequestParam(value="cp", required = false ,defaultValue = "1" ) int cp,
			Model model) {

		// 1) 페이징 처리를 위한 객체 PageInfo 생성
		MagazinePageInfo pInfo = service.getPageInfo(cp);
		

		
		// 2) 게시글 목록 조회 
		List<Magazine> mList = service.selectList(pInfo); 
		

		
		
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
	
	// 매거진 등록 화면
	@RequestMapping("magazineInsertView")
	public String magazineInsertView() {
		return "magazine/magazineInsert";
	}
	
	// 매거진 등록 구현
	@RequestMapping("magazineInsert")
	public String magazineInsert(@ModelAttribute Magazine magazine,
			@ModelAttribute(name="loginMember", binding=false) Member loginMember,
			@RequestParam(value = "images", required = false) List<MultipartFile> images,
			HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mgzNo", magazine.getMgzNo());
		map.put("mgzTitle", magazine.getMgzTitle());
		map.put("mgzContent", magazine.getMgzContent());
		map.put("memberNo", loginMember.getMemberNo());
		System.out.println(images);
		System.out.println(magazine);
		
		// 파일 업로드 확인 
		for (int i = 0; i < images.size(); i++) {
			System.out.println("images[" + i + "] :" + images.get(i).getOriginalFilename());
		}

		// 파일 저장 경로설정
		// HttpServletRequest 객체가 있어야지만 파일 저장 경로를 얻어올 수 있음
		// -> HttpServletRequest객체는 Controller에서만 사용 가능
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/magazineImg");

		// 게시글 map, 이미지 images, 저장경로 savePath

		// 게시글 삽입 Service 호출
		int result = service.insertMagazine(map, images, savePath);
		
		
		
		
		return "magazine/magazine";
	}
	
	// summernote에 업로드된 이미지 저장 Controller
	@RequestMapping("insertImage")
	@ResponseBody //응답시 값 자체를 돌려보냄
	public String insertImage(HttpServletRequest request,
								@RequestParam(value="uploadFile") MultipartFile uploadFile) {
		//서버에 파일(이미지)을 저장할 폴더 경로 얻어오기
		String savePath
		= request.getSession().getServletContext().getRealPath("resources/images/productInfoImg");
		MagazineImg at = service.insertImages(uploadFile, savePath);
		
		//java->js로 객체 전달 : json
		return new Gson().toJson(at);
	}

}

package team.project.gday.gift.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.gift.model.service.GiftService;
import team.project.gday.member.model.vo.Member;

@Controller 
@SessionAttributes({"loginMember"})
@RequestMapping("/gift/*")
public class GiftCtrl {
	
	@Autowired
	private GiftService service;
	
	// 선물 리스트 화면
	@RequestMapping("list")
	public String giftList() {
		return "gift/giftList";
	}
	// 선물 등록 화면
	@RequestMapping("insertView")
	public String giftInsertView() {
		return "gift/giftInsert";
	}
	
	
	// 선물 등록 기능 구현
	@RequestMapping("insert")
	public String giftInsert(@ModelAttribute Gift gift, 
			@ModelAttribute("loginMember") Member loginMember,
			@RequestParam("hashNo") List<String> hashNo, 
			@RequestParam(value = "images", required = false) List<MultipartFile> images,
			HttpServletRequest request) {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hashNo", hashNo);
		map.put("memberNo", loginMember.getMemberNo());
		map.put("prdtName", gift.getPrdtName());
		map.put("prdtContent", gift.getPrdtContent());
		map.put("prdtPrice", gift.getPrdtPrice());
		System.out.println(gift);
		System.out.println(hashNo);
		
		
		// 파일 업로드 확인 
		for (int i = 0; i < images.size(); i++) {
			System.out.println("images[" + i + "] :" + images.get(i).getOriginalFilename());
		}

		// 파일 저장 경로설정
		// HttpServletRequest 객체가 있어야지만 파일 저장 경로를 얻어올 수 있음
		// -> HttpServletRequest객체는 Controller에서만 사용 가능
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/thumbnailImg");

		// 게시글 map, 이미지 images, 저장경로 savePath

		// 게시글 삽입 Service 호출
		int result = service.insertGift(map, images, savePath);
		
		
		
		System.out.println(1);
		return "redirect:/";
	}
	
	// summernote에 업로드된 이미지 저장 Controller
	@RequestMapping("insertImage")
	@ResponseBody //응답시 값 자체를 돌려보냄
	public String insertImage(HttpServletRequest request,
								@RequestParam(value="uploadFile") MultipartFile uploadFile) {
		//서버에 파일(이미지)을 저장할 폴더 경로 얻어오기
		String savePath
		= request.getSession().getServletContext().getRealPath("resources/images/productInfoImg");
		Attachment at = service.insertImages(uploadFile, savePath);
		
		//java->js로 객체 전달 : json
		return new Gson().toJson(at);
	}
	
	
}

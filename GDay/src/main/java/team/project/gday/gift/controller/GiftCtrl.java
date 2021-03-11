package team.project.gday.gift.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.Product.model.vo.ProductCTag;
import team.project.gday.Product.model.vo.ProductStar;
import team.project.gday.gClass.model.service.GClassService;
import team.project.gday.gift.model.service.GiftService;
import team.project.gday.member.bmem.model.vo.PageInfo10;
import team.project.gday.member.model.vo.Member;
import team.project.gday.search.model.vo.Search;

@Controller 
@SessionAttributes({"loginMember"})
@RequestMapping("/gift/*")
public class GiftCtrl {
	
	@Autowired
	private GiftService service;
	private GClassService cService;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	// 선물 리스트 화면
	@RequestMapping("list")
	public String giftList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {
		PageInfo10 pInfo = service.getPageInfo(cp);

		List<Gift> gList = service.selectList(pInfo);

		if (gList != null && !gList.isEmpty()) {
			//썸네일 가져오기
			List<Attachment> thumbnailList = service.selectThumbnailList(gList);
			
			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
				
				//평균 별점 가져오기
				List<ProductStar> selectStarList = service.selectStarList(gList);
				
				model.addAttribute("selectStarList", selectStarList);
			}
		}

		model.addAttribute("gList", gList);
		model.addAttribute("pInfo", pInfo);
		
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
			@RequestParam(value="hashNo", required = false) List<String> hashNo, 
			@RequestParam(value="color", required = false) List<String> color, 
			@RequestParam(value="size", required = false) List<String> size, 
			@RequestParam(value = "images", required = false) List<MultipartFile> images,
			HttpServletRequest request) {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hashNo", hashNo);
		map.put("memNo", loginMember.getMemberNo());
		map.put("prdtName", gift.getPrdtName());
		map.put("prdtContent", gift.getPrdtContent());
		map.put("prdtPrice", gift.getPrdtPrice());
		map.put("hashNo", hashNo);
		map.put("color", color);
		map.put("size", size);
		System.out.println(gift);
		System.out.println(hashNo);
		System.out.println(color);
		System.out.println(size);
		
		
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

	//클래스 상세 조회
	@RequestMapping("/gift/{prdtNo}") 
	public String boardView(@PathVariable("prdtNo") int prdtNo,
							Model model,
							@RequestHeader(value="referer", required=false) String referer, RedirectAttributes ra) {
		//@RequestHeader(name="referer") String referer
		// ---> HTTP 요청 헤더에 존재하는 "referer"값을 얻어와
		//매개변수 String referer에 저장

		Gift gift = service.selectGift(prdtNo);
		
		String url = null;
		
		if(gift != null) { //상세 조회 성공시
			//상세 조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출
			List<Attachment> attachmentList = service.selectAttachmentList(prdtNo);
			
			//조회된 이미지 목록이 있을 경우
			if(attachmentList != null && !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}
			
			//판매자 정보 가져오기
			Member member = service.selectMember(gift.getMemNo());
			model.addAttribute("member", member);
			
			// 옵션 가져오기
			List<GOption> goption = service.selectGoption(prdtNo);
			if (goption != null && !goption.isEmpty()) {
				model.addAttribute("goption", goption);
			}
			
			//해시태그 목록 가져오기
			List<ProductCTag> prdtTagList = service.selectPrdtTagList(prdtNo);
			if (prdtTagList != null  && !prdtTagList.isEmpty()) {
				model.addAttribute("prdtTagList", prdtTagList);
			}
			
			Attachment thumbnail = service.selectThumbnail(prdtNo);
			if(thumbnail != null) {
				model.addAttribute("thumbnail", thumbnail);
			}
			
			
			ProductStar star = service.selectStar(prdtNo); 
			if(star != null) { 
				model.addAttribute("star", star); 
			}
			 
			
			model.addAttribute("gift", gift);
			url = "gift/giftView";
		} else {
			
			//즐겨찾기로 들어와서 referer이 null인 상태라면?
			// -> 이전 요청 주소가 없는 경우
			if(referer == null) { 
				url = "redirect:../list/";
			} else { //이전 요청 주소가 있는 경우
				url = "redirect:" + referer;
			}
			 
		}
		
		return url;
	}

	
	// 선물 수정 화면 이동 controller
	@RequestMapping("{prdtNo}/updateGiftView")
	public String updateGiftView(@PathVariable("prdtNo") int prdtNo, Model model) {
		//게시글 상세 조회 
		Gift gift = service.selectGift(prdtNo);
		 
		//해당 게시글에 포함된 이미지 목록 조회
		if (gift != null) { // 상세 조회 성공시
			//상세 조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출
			List<Attachment> attachmentList = service.selectAttachmentList(prdtNo);

			//조회된 이미지 목록이 있을 경우
			if (attachmentList != null && !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}
			//썸네일 가져오기
			Attachment thumbnail = service.selectThumbnail(prdtNo);
			if (thumbnail != null) {
				model.addAttribute("thumbnail", thumbnail);
			}
			
			// 옵션 가져오기
			List<GOption> goption = service.selectGoption(prdtNo);
			if (goption != null && !goption.isEmpty()) {
				model.addAttribute("goption", goption);
				
			}

			//해시태그 목록 가져오기
			List<ProductCTag> prdtTagList = service.selectPrdtTagList(prdtNo);
			if (prdtTagList != null  && !prdtTagList.isEmpty()) {
				model.addAttribute("prdtTagList", prdtTagList);
			}
		}
		
		model.addAttribute("gift", gift);
		String url = "gift/giftUpdate";
		
		return url;
	}
	
	// 선물 업데이트 수행
	@RequestMapping("{prdtNo}/updateGift")
	 public String updateAction(@PathVariable("prdtNo") int prdtNo,
							 	@ModelAttribute Gift updateGift,
							 	@RequestParam("hashNo") List<String> hashNo,
								Model model, RedirectAttributes ra,
								HttpServletRequest request,
								@RequestParam(value="color", required = false) List<String> color, 
								@RequestParam(value="size", required = false) List<String> size,
								//삽입해야하는 이미지들을 알려주는 역할을 하는 변수
								@RequestParam(value="images", required=false) List<MultipartFile> images) {
		
		 
		updateGift.setPrdtNo(prdtNo);
		 
		 //파일 저장 경로 얻어오기
		 String savePath = request.getSession().getServletContext().getRealPath("resources/images/thumbnailImg");
		 System.out.println(updateGift);
		// map을 이용하여 필요한 데이터 모두 담기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("prdtNo", updateGift.getPrdtNo());
			map.put("prdtPrice", updateGift.getPrdtPrice());
			map.put("prdtName", updateGift.getPrdtName());
			map.put("prdtContent", updateGift.getPrdtContent());
			map.put("hashNo", hashNo);
			map.put("size", size);
			map.put("color", color);
		 
		 // 게시글 수정 Service 호출
		 int result = service.updateGift(map, images, savePath);
		 
		 String url = null;
		 if(result > 0) {
				swalIcon = "success";
				swalTitle = "선물 페이지 수정 성공!";
				url = "redirect:../"+prdtNo;
			}else {
				swalIcon = "error";
				swalTitle = "선물 페이지 수정 실패";
				url = "redirect:" + request.getHeader("referer");
			}
			
			ra.addFlashAttribute("swalIcon", swalIcon);
			ra.addFlashAttribute("swalTitle", swalTitle);

			return url;
	 
	 }
	
	//선물 마감하기 Controller
	@RequestMapping("{prdtNo}/pauseAction")
	public String pauseAction(@PathVariable("prdtNo") int prdtNo, RedirectAttributes ra,
								@RequestHeader(value = "referer", required = false) String referer) {
		
		int result = cService.pauseAction(prdtNo);
		
		String url = null;
		 if(result > 0) {
				swalIcon = "success";
				swalTitle = "품절 정상 처리";
				swalText = "상품이 품절되었습니다.";
				url = "redirect:/" + referer;
			}else {
				swalIcon = "error";
				swalTitle = "품절 처리 중 문제 발생";
				swalText = "문제가 계속될 시 관리자에게 연락 주세요.";
				url = "redirect:/"; 
			}
			
			ra.addFlashAttribute("swalIcon", swalIcon);
			ra.addFlashAttribute("swalTitle", swalTitle);
			ra.addFlashAttribute("swalText", swalText);

			return url;
	}
	
	//선물 검색
	@RequestMapping("search")
	public String searchGift (@RequestParam(value="cp", required=false, defaultValue = "1") int cp,
								@ModelAttribute Search search, Model model) {
	
				//1) 검색 조건이 포함된 페이징 처리용 객체 얻어오기
				PageInfo10 pInfo = service.getSearchPageInfo(search, cp);
				
				//2) 검색 조건이 포함된 선물 목록 조회
				List<Gift> gList = service.selectSearchList(search, pInfo);
				
				//3) 썸네일 목록 조회
				if(!gList.isEmpty()) {
					List<Attachment> thList = service.selectThumbnailList(gList);
					model.addAttribute("thList", thList);
					
					//평균 별점 목록 가져오기
					List<ProductStar> selectStarList = service.selectStarList(gList);
					
					model.addAttribute("selectStarList", selectStarList);
				}
				
				System.out.println(pInfo);
				System.out.println(gList);
				System.out.println(search);
				
				model.addAttribute("gList", gList);
				model.addAttribute("pInfo", pInfo);
				model.addAttribute("search", search);
				
				return "gift/giftList";
	}
	
}

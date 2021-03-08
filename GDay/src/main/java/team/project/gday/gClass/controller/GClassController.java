package team.project.gday.gClass.controller;

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
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.ProductCTag;
import team.project.gday.Product.model.vo.ProductStar;
import team.project.gday.gClass.model.service.GClassService;
import team.project.gday.member.bmem.model.vo.PageInfo10;
import team.project.gday.member.model.vo.Member;

@Controller
@SessionAttributes({ "loginMember" })
@RequestMapping("/gClass/*")
public class GClassController {

	@Autowired
	private GClassService service;

	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	// 상품 목록 평점/최신순 Controller --현재 최신순
	@RequestMapping("list")
	public String giftList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {
		PageInfo10 pInfo = service.getPageInfo(cp);

		List<GClass> gCList = service.selectList(pInfo);

		if (gCList != null && !gCList.isEmpty()) {
			//썸네일 가져오기
			List<Attachment> thumbnailList = service.selectThumbnailList(gCList);
			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
				
				//평균 별점 가져오기
				List<ProductStar> selectStarList = service.selectStarList(gCList);
				model.addAttribute("selectStarList", selectStarList);
			}
		}

		model.addAttribute("gCList", gCList);
		model.addAttribute("pInfo", pInfo);

		return "gClass/gClassList";
	}

	// 클래스 상세 조회 controller
	@RequestMapping("{prdtNo}")
	public String boardView(@PathVariable("prdtNo") int prdtNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {
		// @RequestHeader(name="referer") String referer
		// ---> HTTP 요청 헤더에 존재하는 "referer"값을 얻어와
		// 매개변수 String referer에 저장

		System.out.println("prdtNo: " + prdtNo);

		GClass gclass = service.selectGClass(prdtNo);
		String url = null;

		if (gclass != null) { // 상세 조회 성공시
			// 상세 조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출
			List<Attachment> attachmentList = service.selectAttachmentList(prdtNo);

			// 조회된 이미지 목록이 있을 경우
			if (attachmentList != null && !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}

			// 판매자 정보 가져오기
			Member member = service.selectMember(gclass.getMemNo());
			model.addAttribute("member", member);
			
			// 썸네일 가져오기
			Attachment thumbnail = service.selectThumbnail(prdtNo);
			if (thumbnail != null) {
				model.addAttribute("thumbnail", thumbnail);
			}
			
			//해시태그 목록 가져오기
			List<ProductCTag> prdtTagList = service.selectPrdtTagList(prdtNo);
			System.out.println(prdtTagList);
			if (prdtTagList != null  && !prdtTagList.isEmpty()) {
				model.addAttribute("prdtTagList", prdtTagList);
			}
			
			//후기 가져오기
			//List<Review> reviewList = service.selectReviewList(prdtNo);

			model.addAttribute("gclass", gclass);
			url = "gClass/gClassView";
		} else {
			// 즐겨찾기로 들어와서 referer이 null인 상태라면?
			// -> 이전 요청 주소가 없는 경우
			if (referer == null) {
				url = "redirect:/";
			} else { // 이전 요청 주소가 있는 경우
				url = "redirect:" + referer;
			}

			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "클래스가 마감되었습니다.");
		}

		return url;
	}

	
	  //클래스 수정 화면 이동 controller
	  
	 @RequestMapping("{prdtNo}/update")
	 public String update(@PathVariable("prdtNo") int prdtNo, Model model){
		
		//게시글 상세 조회 
		GClass gclass = service.selectGClass(prdtNo);
		 
		//해당 게시글에 포함된 이미지 목록 조회
		if (gclass != null) { // 상세 조회 성공시
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
			
			//해시태그 목록 가져오기
			List<ProductCTag> prdtTagList = service.selectPrdtTagList(prdtNo);
			if (prdtTagList != null  && !prdtTagList.isEmpty()) {
				model.addAttribute("prdtTagList", prdtTagList);
			}
		}
		
		model.addAttribute("gclass", gclass);
		String url = "gClass/gClassUpdate";
		
		return url;
	 }
	 
	  //클래스 수정 controller
	@RequestMapping("{prdtNo}/updateAction")
	 public String updateAction(@PathVariable("prdtNo") int prdtNo,
							 	@ModelAttribute GClass updateClass,
							 	@RequestParam("hashNo") List<String> hashNo,
								Model model, RedirectAttributes ra,
								HttpServletRequest request,
								//삽입해야하는 이미지들을 알려주는 역할을 하는 변수
								@RequestParam(value="images", required=false) List<MultipartFile> images) {
		
		 
		 updateClass.setPrdtNo(prdtNo);
		 
		 //파일 저장 경로 얻어오기
		 String savePath = request.getSession().getServletContext().getRealPath("resources/images/thumbnailImg");
		 System.out.println(updateClass);
		// map을 이용하여 필요한 데이터 모두 담기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("prdtNo", updateClass.getPrdtNo());
			map.put("prdtPrice", updateClass.getPrdtPrice());
			map.put("cCount", updateClass.getcCount());
			map.put("cSession", updateClass.getcSession());
			map.put("cStartDate", updateClass.getcStartDate());
			map.put("cEndDate", updateClass.getcEndDate());
			map.put("cDate", updateClass.getcDate());
			map.put("prdtName", updateClass.getPrdtName());
			map.put("prdtContent", updateClass.getPrdtContent());
			map.put("cLocal", updateClass.getcLocal());
			map.put("hashNo", hashNo);
		 
		 
		 // 게시글 수정 Service 호출
		 int result = service.updateClass(map, images, savePath);
		 
		 String url = null;
		 if(result > 0) {
				swalIcon = "success";
				swalTitle = "클래스 수정 성공!";
				url = "redirect:../"+prdtNo;
			}else {
				swalIcon = "error";
				swalTitle = "클래스 수정 실패";
				url = "redirect:" + request.getHeader("referer");
			}
			
			ra.addFlashAttribute("swalIcon", swalIcon);
			ra.addFlashAttribute("swalTitle", swalTitle);

			return url;
	 
	 }
	
	// summernote에 업로드된 이미지 저장 Controller
	@RequestMapping("{prdtNo}/insertImage")
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
	
	//클래스 마감하기 Controller
	@RequestMapping("{prdtNo}/pause")
	public String pauseAction(@PathVariable("prdtNo") int prdtNo, RedirectAttributes ra,
								@RequestHeader(value = "referer", required = false) String referer) {
		
		int result = service.pauseAction(prdtNo);
		
		String url = null;
		 if(result > 0) {
				swalIcon = "success";
				swalTitle = "클래스 정상 마감";
				swalText = "클래스가 마감되었습니다.";
				url = "redirect:/" + referer;
			}else {
				swalIcon = "error";
				swalTitle = "클래스 마감 중 문제 발생";
				swalText = "문제가 계속될 시 관리자에게 연락 주세요.";
				url = "redirect:/"; 
			}
			
			ra.addFlashAttribute("swalIcon", swalIcon);
			ra.addFlashAttribute("swalTitle", swalTitle);
			ra.addFlashAttribute("swalText", swalText);

			return url;
	}
}

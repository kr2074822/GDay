package team.project.gday.magazine.controller;

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
	 
	 private String swalIcon = null;
	 private String swalTitle = null;
	 private String swalText = null;
	
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
		
		
		
		
		return "redirect:list";
	}
	
	// summernote에 업로드된 이미지 저장 Controller
	@RequestMapping(value = {"{no}/insertImage", "insertImage"})
	@ResponseBody //응답시 값 자체를 돌려보냄
	public String insertImage(HttpServletRequest request,
								@RequestParam(value="uploadFile") MultipartFile uploadFile) {
		//서버에 파일(이미지)을 저장할 폴더 경로 얻어오기
		String savePath
		= request.getSession().getServletContext().getRealPath("resources/images/magazineImg");
		Attachment at = service.insertImages(uploadFile, savePath);
		
		//java->js로 객체 전달 : json
		return new Gson().toJson(at);
	}
	
	
	// 매거진 상세 페이지 조회
	@RequestMapping("/magazine/{no}") 
	public String boardView(@PathVariable("no") int no,
							Model model,
							@RequestHeader(value="referer", required=false) String referer,
							RedirectAttributes ra) {
		//@RequestHeader(name="referer") String referer
		// ---> HTTP 요청 헤더에 존재하는 "referer"값을 얻어와
		//매개변수 String referer에 저장

		System.out.println("no: " + no);
		
		Magazine magazine = service.selectMagazine(no);
		System.out.println("매거진 조회: "+magazine);
		String url = null;
		
		if(magazine != null) { //상세 조회 성공시
			//상세 조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출
			List<MagazineImg> magazineImg = service.selectMimgList(no);
			
			//조회된 이미지 목록이 있을 경우
			if(magazineImg != null && !magazineImg.isEmpty()) {
				model.addAttribute("magazineImg", magazineImg);
				System.out.println(magazineImg);
			}
			
			MagazineImg thumbnail = service.selectThumbnail(no);
			if(thumbnail != null) {
				model.addAttribute("thumbnail", thumbnail);
				System.out.println(thumbnail);
			}
			
			model.addAttribute("magazine", magazine);
			url = "magazine/magazineView";
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
	
	// 매거진 수정 화면
	@RequestMapping("{no}/update")
	 public String magazineUpdateView(@PathVariable("no") int no, Model model){
		
		//게시글 상세 조회 
		Magazine magazine = service.selectMagazine(no);
		System.out.println(magazine);
		//해당 게시글에 포함된 이미지 목록 조회
		if (magazine != null) { // 상세 조회 성공시
			//상세 조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출
			List<MagazineImg> attachmentList = service.selectMimgList(no);

			//조회된 이미지 목록이 있을 경우
			if (attachmentList != null && !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}
			//썸네일 가져오기
			MagazineImg thumbnail = service.selectThumbnail(no);
			if (thumbnail != null) {
				model.addAttribute("thumbnail", thumbnail);
			}
			
		}
		
		model.addAttribute("magazine", magazine);
		String url = "magazine/magazineUpdate";
		
		return url;
	 }
	
	@RequestMapping("{no}/magazineUpdate")
	public String magazineUpdate(@PathVariable("no") int no,
		 	@ModelAttribute Magazine updateMagazine,
			Model model, RedirectAttributes ra,
			HttpServletRequest request,
			//삽입해야하는 이미지들을 알려주는 역할을 하는 변수
			@RequestParam(value="images", required=false) List<MultipartFile> images) {
			
		updateMagazine.setMgzNo(no);
			
		//파일 저장 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/magazineImg");
		System.out.println("업데이트매거진"+updateMagazine);
		// map을 이용하여 필요한 데이터 모두 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mgzNo", updateMagazine.getMgzNo());
		map.put("mgzTitle", updateMagazine.getMgzTitle());
		map.put("mgzContent", updateMagazine.getMgzContent());
		
		// 게시글 수정 Service 호출
		int result = service.updateMagazine(map, images, savePath);
		
		String url = null;
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "클래스 수정 성공!";
			url = "redirect:../"+no;
		}else {
			swalIcon = "error";
			swalTitle = "클래스 수정 실패";
			url = "redirect:" + request.getHeader("referer");
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
			
	}

}

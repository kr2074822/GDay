package team.project.gday.member.bmem.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.member.bmem.model.service.BmemService2;
import team.project.gday.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/bMember2/*")
public class BmemController2 {

	@Autowired
	private BmemService2 service;

	String swalIcon = null;
	String swalTitle = null;
	String swalText = null;

	// ==============화면 전환용================

	// 클래스 등록 신청 화면 이동
	@RequestMapping("gClassInsert")
	public String gClassInsert(@ModelAttribute("loginMember") Member loginMember) {
		System.out.println(loginMember);
		return "gClass/gClassInsert";
	}

	
	// ==============기능 구현용=================
	// 클래스 등록 신청 Controller

	@RequestMapping("insertClass")
	public String insertAction(@ModelAttribute GClass gClass, @ModelAttribute("loginMember") Member loginMember,
			@RequestParam("hashNo") List<String> hashNo,
			@RequestParam(value = "images", required = false) List<MultipartFile> images, HttpServletRequest request,
			RedirectAttributes ra) {
		
		System.out.println(loginMember);
		System.out.println(loginMember.getMemberNo());
		
		// map을 이용하여 필요한 데이터 모두 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memNo", loginMember.getMemberNo());
		map.put("prdtPrice", gClass.getPrdtPrice());
		map.put("cCount", gClass.getcCount());
		map.put("cSession", gClass.getcSession());
		map.put("cStartDate", gClass.getcStartDate());
		map.put("cEndDate", gClass.getcEndDate());
		map.put("cDate", gClass.getcDate());
		map.put("prdtName", gClass.getPrdtName());
		map.put("prdtContent", gClass.getPrdtContent());
		map.put("cLocal", gClass.getcLocal());
		map.put("hashNo", hashNo);

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
		int result = service.insertClass(map, images, savePath);

		String url = null;
		// 게시글 삽입 결과에 따른 View 연결 처리
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "클래스 정상 등록";
			swalText = "작성하신 해시태그와 제목으로 검색됩니다.";
			url = "redirect:/gClass/list";

			// 새로 작성한 게시글 상세 조회시 목록으로 버튼 경로 지정하기
			// request.getSession().setAttribute("returnListURL", "../list/" + type);
			// /spring/list/1 -> 자유게시판의 첫페이지로 이동
		} else {
			swalIcon = "error";
			swalTitle = "클래스 등록 중 문제 발생";
			swalText = "문제가 계속될 시 관리자에게 연락 주세요.";
			url = "redirect:/common/bMain";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		ra.addFlashAttribute("swalText", swalText);

		return url;
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

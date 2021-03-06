package team.project.gday.gClass.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.gClass.model.service.GClassService;
import team.project.gday.member.bmem.model.vo.PageInfo10;
import team.project.gday.member.model.vo.Member;

@Controller 
@SessionAttributes({"loginMember"})
@RequestMapping("/gClass/*")
public class GClassController {
	
	@Autowired
	private GClassService service;

	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	
	//상품 목록 평점/최신순 Controller --현재 최신순
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
	
	
	//클래스 상세 조회 controller
	@RequestMapping("{prdtNo}") 
	public String boardView(@PathVariable("prdtNo") int prdtNo,
							Model model,
							@RequestHeader(value="referer", required=false) String referer,
							RedirectAttributes ra) {
		//@RequestHeader(name="referer") String referer
		// ---> HTTP 요청 헤더에 존재하는 "referer"값을 얻어와
		//매개변수 String referer에 저장

		System.out.println("prdtNo: " + prdtNo);
		
		GClass gclass = service.selectGClass(prdtNo);
		String url = null;
		
		if(gclass != null) { //상세 조회 성공시
			//상세 조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출
			List<Attachment> attachmentList = service.selectAttachmentList(prdtNo);
			
			//조회된 이미지 목록이 있을 경우
			if(attachmentList != null && !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}
			
			//판매자 정보 가져오기
			Member member = service.selectMember(gclass.getMemNo());
			model.addAttribute("member", member);
			
			Attachment thumbnail = service.selectThumbnail(prdtNo);
			if(thumbnail != null) {
				model.addAttribute("thumbnail", thumbnail);
			}
			
			model.addAttribute("gclass", gclass);
			url = "gClass/gClassView";
		} else {
			//즐겨찾기로 들어와서 referer이 null인 상태라면?
			// -> 이전 요청 주소가 없는 경우
			if(referer == null) { 
				url = "redirect:../list/";
			} else { //이전 요청 주소가 있는 경우
				url = "redirect:" + referer;
			}
			
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 클래스입니다.");
		}
		
		return url;
	}
	
	/*
	 * //클래스 수정 controller
	 * 
	 * @RequestMapping("{prdtNo}/updateAction") public String
	 * updateAction(@PathVariable("prdtNo") int prdtNo)
	 */
}

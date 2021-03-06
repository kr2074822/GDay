package team.project.gday.member.gmem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.member.gmem.model.service.GmemCartService;
import team.project.gday.member.model.vo.Baguni;
import team.project.gday.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/cart/*")
public class GmemCartController {

	@Autowired
	private GmemCartService service;
	
	// 장바구니 화면으로 이동 Controller
	@RequestMapping("memberCart")
	public String memberCartForm(@ModelAttribute("loginMember") Member loginMember,
							     Model model) {	
		
		int memberNo = loginMember.getMemberNo();
		
		List<Baguni> baguniList = service.selectBaguni(memberNo);
		
		if(baguniList != null && !baguniList.isEmpty()) { // 게시글 목록 조회 성공 시
			List<Attachment> thumbnailList = service.cartThumbnailList(baguniList);
			
			if(thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
		}
		
		System.out.println(baguniList);
		
		model.addAttribute("bList", baguniList);
		
		return "mypage/gMemPage/gMemCart";
	}
	
	
	// 클래스 장바구니에 추가 Controller
	@RequestMapping("memberClassCart")
	@ResponseBody
	public int memberClassCart(@RequestParam("prdtNo") int prdtNo,
							   @RequestParam("amount") int amount,
							   @RequestParam("imgPath") String imgPath,
							   @ModelAttribute("loginMember") Member loginMember,
							   Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prdtNo", prdtNo);
		map.put("amount", amount);
		map.put("imgPath", imgPath);
		map.put("memberNo", loginMember.getMemberNo());
		
		int result = service.insertClassCart(map);
		
		return result;
	}
	
}

package team.project.gday.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.project.gday.member.model.vo.Member;
import team.project.gday.message.model.service.MessageService;
import team.project.gday.message.model.vo.Message;

@Controller // 컨트롤러임을 알려줌 + bean 등록
@SessionAttributes({"loginMember"})
@RequestMapping("/message/*")
public class MessageController {

	@Autowired
	private MessageService service;
	
	@RequestMapping("message")
	public String message(@ModelAttribute(name="loginMember", binding=false) Member loginMember, Model model) {
		System.out.println(loginMember);
		int memNo = loginMember.getMemberNo();
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Message> msgList = new ArrayList<Message>(); 
		msgList = service.messageList(memNo);
		System.out.println(msgList);
		
		model.addAttribute("msgList", msgList);
		
		return "message/message";
	}
}

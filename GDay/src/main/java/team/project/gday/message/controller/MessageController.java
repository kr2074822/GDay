package team.project.gday.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 메시지 화면
	@RequestMapping("message")
	public String message(@ModelAttribute(name="loginMember", binding=false) Member loginMember, Model model) {
		System.out.println(loginMember);
		int memNo = loginMember.getMemberNo();
		
		List<Message> msgList = new ArrayList<Message>(); 
		msgList = service.messageList(memNo);
		System.out.println(msgList);
		
		model.addAttribute("msgList", msgList);
		
		return "message/message";
	}
	
	// 채팅 화면
	@RequestMapping("msgChat")
	@ResponseBody
	public List<Message> msgChat(@ModelAttribute(name="loginMember", binding=false) Member loginMember, Model model, @RequestParam int getter) {
		System.out.println(loginMember);
		System.out.println(getter);
		int memNo = loginMember.getMemberNo();
		
		List<Message> mChat = new ArrayList<Message>(); 
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memNo", memNo);
		map.put("getter", getter);
		
		mChat = service.chatList(map);
		if (mChat != null) {
			// 읽음처리
			int result = service.read(map);
			System.out.println("읽음처리: "+result);
		}
		System.out.println(mChat);
		
		return mChat;
		
	}
	
	// 메시지 보내기
	@RequestMapping("sendMsg")
	@ResponseBody
	public String sendMsg(@ModelAttribute(name="loginMember", binding=false) Member loginMember, 
			Model model, 
			@RequestParam int getter,
			@RequestParam String myMsg) {
		
		System.out.println(loginMember.getMemberNo());
		System.out.println(getter);
		System.out.println(myMsg);
		int memNo = loginMember.getMemberNo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memNo", memNo);
		map.put("getter", getter);
		map.put("myMsg", myMsg);
		
		int result = service.sendMsg(map);
		
		return "";
	}
	
	@RequestMapping("gcMsg")
	@ResponseBody
	public String gcMsg(@ModelAttribute Message message) {
		
		System.out.println(message);
		
		int result = service.gcMsg(message);
		System.out.println(result);
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
}

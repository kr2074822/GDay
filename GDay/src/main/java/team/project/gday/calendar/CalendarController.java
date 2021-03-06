package team.project.gday.calendar;

import java.net.HttpURLConnection;
import java.util.List;

import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import team.project.gday.calendar.model.service.CalendarService;
import team.project.gday.calendar.model.vo.Calendar;
import team.project.gday.common.scheduling.SendSMSbyN;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {
	
	@Autowired
	private CalendarService service;
	
	//캘린더 페이지로 이동
	@RequestMapping("calendarMain")
	public String calendarMain() {
		return "calendar/calendar";
	}
	
	//캘린더 기념일 조회
	@ResponseBody
	@RequestMapping("selectCalendarList")
	public String selectCalendarList(@RequestParam("memberNo") int memberNo) {
			
		List<Calendar> eList = service.selectCalendarList(memberNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
//		for(Calendar c : cList) {
//			
//			System.out.println(c);
//		}
		
		return gson.toJson(eList);
	}
	
	
	//캘린더 기념일 상세 조회
	@ResponseBody
	@RequestMapping("viewEvent")
	public String viewEvent(@RequestParam("gdayNo") int gdayNo) {
		
		Calendar event = service.viewEvent(gdayNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(event);
	}
	
	
	
	//캘린더 기념일 등록
	@ResponseBody
	@RequestMapping("insertEvent")
	public int insertEvent(@ModelAttribute Calendar event) {
		
		System.out.println("event: " + event);
		
		int result = service.insertEvent(event);
		
		
		return result;
	}
	
	
	//캘린더 기념일 수정
	@ResponseBody
	@RequestMapping("updateEvent")
	public int updateEvent(@ModelAttribute Calendar event) {
		
		System.out.println("event: " + event);
		
		int result = service.updateEvent(event);
		
		return result;
	}
	
	//캘린더 기념일 삭제
	@ResponseBody
	@RequestMapping("deleteEvent")
	public int deleteEvent(@RequestParam("gdayNo") int gdayNo) {
		
		int result = service.deleteEvent(gdayNo);
		return result;
	}
	
	
	//기념일에 맞춰서 문자 보내기 : 임시로 버튼 만들어놓음 -> 원래는 스케줄링으로 함
	@ResponseBody
	@RequestMapping("getTargetDt")
	public int getTargetDt(@RequestParam("memberNo") int memberNo) {
		
		List<Calendar> targetList = service.getMemTarget(memberNo);
		
		int responseCode = 0;
		
		if (targetList != null) {
			SendSMSbyN sendSms = new SendSMSbyN();
		
			responseCode = sendSms.sendSMS(targetList);
		}

		return responseCode;
	}
	
	
	
	
}

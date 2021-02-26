package team.project.gday.calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import team.project.gday.calendar.model.service.CalendarService;
import team.project.gday.calendar.model.vo.Calendar;

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
	
	
	
}

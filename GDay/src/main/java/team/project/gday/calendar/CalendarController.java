package team.project.gday.calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
			
		List<Calendar> cList = service.selectCalendarList(memberNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		for(Calendar c : cList) {
			
			System.out.println(c);
		}
		
		return gson.toJson(cList);
	}
	
	
	
	
	
	
	
	
}

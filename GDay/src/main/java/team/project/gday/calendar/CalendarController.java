package team.project.gday.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {
	@RequestMapping("calendarMain")
	public String calendarMain() {
		return "calendar/calendar";
	}
}

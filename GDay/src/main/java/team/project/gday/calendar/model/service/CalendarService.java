package team.project.gday.calendar.model.service;

import java.util.List;

import team.project.gday.calendar.model.vo.Calendar;

public interface CalendarService {

	/** 캘린더 기념일 조회
	 * @param memberNo
	 * @return
	 */
	List<Calendar> selectCalendarList(int memberNo);

}

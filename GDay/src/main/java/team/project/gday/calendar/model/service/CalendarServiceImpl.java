package team.project.gday.calendar.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.calendar.model.dao.CalendarDAO;
import team.project.gday.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDAO dao;
	
	//캘린더 기념일 조회
	@Override
	public List<Calendar> selectCalendarList(int memberNo) {
		return dao.selectCalendarList(memberNo);
	}
	
}

package team.project.gday.calendar.model.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	
	//캘린더 기념일 상세 조회
	@Override
	public Calendar viewEvent(int gdayNo) {
		return dao.viewEvent(gdayNo);
	}

	
	//캘린더 기념일 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertEvent(Calendar event) {
		return dao.insertEvent(event);
	}

	//캘린더 기념일 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateEvent(Calendar event) {
		return dao.updateEvent(event);
	}
	
	//캘린더 기념일 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteEvent(int gdayNo) {
		return dao.deleteEvent(gdayNo);
	}


}

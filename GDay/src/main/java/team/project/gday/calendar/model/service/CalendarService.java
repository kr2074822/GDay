package team.project.gday.calendar.model.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import team.project.gday.calendar.model.vo.Calendar;

public interface CalendarService {

	/** 캘린더 기념일 조회
	 * @param memberNo
	 * @return
	 */
	public abstract List<Calendar> selectCalendarList(int memberNo);

	/** 캘린더 기념일 상세 조회
	 * @param gdayNo
	 * @return
	 */
	public abstract Calendar viewEvent(int gdayNo);

	/** 캘린더 기념일 등록
	 * @param event
	 * @return
	 */
	public abstract int insertEvent(Calendar event);
	
	/** 캘린더 기념일 수정
	 * @param event
	 * @return
	 */
	public abstract int updateEvent(Calendar event);

	/** 캘린더 기념일 삭제
	 * @param gdayNo
	 * @return
	 */
	public abstract int deleteEvent(int gdayNo);


}

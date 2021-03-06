package team.project.gday.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.calendar.model.vo.Calendar;

@Repository
public class CalendarDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**캘린더 기념일 조회
	 * @param memberNo
	 * @return
	 */
	public List<Calendar> selectCalendarList(int memberNo) {
		return sqlSession.selectList("calendarMapper.selectCalendarList", memberNo);
	}

	/**캘린더 기념일 상세 조회
	 * @param gdayNo
	 * @return
	 */
	public Calendar viewEvent(int gdayNo) {
		return sqlSession.selectOne("calendarMapper.viewEvent", gdayNo);
	}

	/**캘린더 기념일 삽입
	 * @param event
	 * @return 
	 */
	public int insertEvent(Calendar event) {
		return sqlSession.insert("calendarMapper.insertEvent", event);
	}

	/**캘린더 기념일 수정
	 * @param event
	 * @return
	 */
	public int updateEvent(Calendar event) {
		return sqlSession.update("calendarMapper.updateEvent", event);
	}	

	/**캘린더 기념일 삭제
	 * @param gdayNo
	 * @return
	 */
	public int deleteEvent(int gdayNo) {
		return sqlSession.delete("calendarMapper.deleteEvent", gdayNo);
	}

	
	/** dtUntil이 오늘 날짜보다 이상인 경우인 기념일 가져오기
	 * @param memberNo 
	 * @return
	 */
	public List<Calendar> getOriginList(int memberNo) {
		return sqlSession.selectList("calendarMapper.selectTarget", memberNo);
	}


}

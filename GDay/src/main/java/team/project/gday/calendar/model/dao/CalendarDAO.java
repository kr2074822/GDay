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

}

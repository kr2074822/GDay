package team.project.gday.message.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.message.model.vo.Message;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	/** 쪽지 리스트 조회
	 * @param memNo
	 * @return
	 */
	public List<Message> messageList(int memNo) {
		return sqlSession.selectList("messageMapper.messageList", memNo);
	}
	

}

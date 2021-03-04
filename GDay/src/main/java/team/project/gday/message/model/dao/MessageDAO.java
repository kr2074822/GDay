package team.project.gday.message.model.dao;

import java.util.List;
import java.util.Map;

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

	/** 채팅 리스트 조회
	 * @param map
	 * @return
	 */
	public List<Message> chatList(Map<String, Object> map) {
		return sqlSession.selectList("messageMapper.chatList", map);
	}

	/** 메시지 보내기
	 * @param map
	 * @return
	 */
	public int sendMsg(Map<String, Object> map) {
		return sqlSession.insert("messageMapper.sendMsg", map);
	}

	public int read(Map<String, Object> map) {
		return sqlSession.update("messageMapper.read", map);
	}


}

package team.project.gday.message.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.message.model.dao.MessageDAO;
import team.project.gday.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDAO dao;

	// 쪽지 리스트 조회
	@Override
	public List<Message> messageList(int memNo) {
		return dao.messageList(memNo);
	}

	// 채팅 화면
	@Override
	public List<Message> chatList(Map<String, Object> map) {
		return dao.chatList(map);
	}

	// 메시지 보내기
	@Override
	public int sendMsg(Map<String, Object> map) {
		return dao.sendMsg(map);
	}

	// 읽음 처리
	@Override
	public int read(Map<String, Object> map) {
		return dao.read(map);
	}

	@Override
	public int gcMsg(Message message) {
		return dao.gcMsg(message);
	}

}

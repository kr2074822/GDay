package team.project.gday.message.model.service;

import java.util.List;

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
}

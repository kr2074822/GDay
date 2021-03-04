package team.project.gday.message.model.service;

import java.util.List;

import team.project.gday.message.model.vo.Message;

public interface MessageService {

	List<Message> messageList(int memNo);

}

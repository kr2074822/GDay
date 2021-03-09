package team.project.gday.message.model.service;

import java.util.List;
import java.util.Map;

import team.project.gday.message.model.vo.Message;

public interface MessageService {

	/** 메시지 리스트 조회
	 * @param memNo
	 * @return
	 */
	List<Message> messageList(int memNo);

	/** 채팅 화면
	 * @param map
	 * @return
	 */
	List<Message> chatList(Map<String, Object> map);

	/** 메시지 보내기
	 * @param map
	 * @return
	 */
	int sendMsg(Map<String, Object> map);

	/** 읽음 처리 설정
	 * @param map 
	 * @return
	 */
	int read(Map<String, Object> map);

	/** 상품에서 메시지 보내기
	 * @param message
	 * @return
	 */
	int gcMsg(Message message);

}

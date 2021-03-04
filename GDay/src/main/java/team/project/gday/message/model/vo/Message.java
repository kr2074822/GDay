package team.project.gday.message.model.vo;

import java.sql.Timestamp;

public class Message {
	private int msgNo;
	private String msgContent;
	private Timestamp msgDate;
	private int msgStatus;
	private int me;
	private int you;
	
	private String memNick;
	
	public Message() {
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Timestamp getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(Timestamp msgDate) {
		this.msgDate = msgDate;
	}

	public int getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(int msgStatus) {
		this.msgStatus = msgStatus;
	}

	public int getMe() {
		return me;
	}

	public void setMe(int me) {
		this.me = me;
	}

	public int getYou() {
		return you;
	}

	public void setYou(int you) {
		this.you = you;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", msgContent=" + msgContent + ", msgDate=" + msgDate + ", msgStatus="
				+ msgStatus + ", me=" + me + ", you=" + you + ", memNick=" + memNick + "]";
	}

}

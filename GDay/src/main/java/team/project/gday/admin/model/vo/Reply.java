package team.project.gday.admin.model.vo;

import java.sql.Timestamp;

public class Reply {
	private int curNo; // 댓글 번호
	private String curContent; // 댓글 내용
	private Timestamp replyCreateDate; // 작성자명
	private int cusNo; // 문의글 번호
	
	
	public Reply() {
		super();
	}


	public int getCurNo() {
		return curNo;
	}


	public void setCurNo(int curNo) {
		this.curNo = curNo;
	}


	public String getCurContent() {
		return curContent;
	}


	public void setCurContent(String curContent) {
		this.curContent = curContent;
	}


	public Timestamp getReplyCreateDate() {
		return replyCreateDate;
	}


	public void setReplyCreateDate(Timestamp replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}


	public int getCusNo() {
		return cusNo;
	}


	public void setCusNo(int cusNo) {
		this.cusNo = cusNo;
	}


	@Override
	public String toString() {
		return "Reply [curNo=" + curNo + ", curContent=" + curContent + ", replyCreateDate=" + replyCreateDate
				+ ", cusNo=" + cusNo + "]";
	}
}

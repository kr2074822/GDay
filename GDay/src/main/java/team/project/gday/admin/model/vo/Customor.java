package team.project.gday.admin.model.vo;

import java.sql.Timestamp;

public class Customor {
	private int cusNo; // 고객센터 글번호
	private String cusContent; // 고객센터 내용
	private int memNo; // 회원 번호
	private String replyStatus; // 댓글 여부
	private String memberName; // 작성자명
	private Timestamp cusCreateDate; // 작성자명
	private String cusTitle; // 글제목
	
	
	public Customor() {
		super();
	}


	public int getCusNo() {
		return cusNo;
	}


	public void setCusNo(int cusNo) {
		this.cusNo = cusNo;
	}


	public String getCusContent() {
		return cusContent;
	}


	public void setCusContent(String cusContent) {
		this.cusContent = cusContent;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public String getReplyStatus() {
		return replyStatus;
	}


	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public Timestamp getCusCreateDate() {
		return cusCreateDate;
	}


	public void setCusCreateDate(Timestamp cusCreateDate) {
		this.cusCreateDate = cusCreateDate;
	}


	public String getCusTitle() {
		return cusTitle;
	}


	public void setCusTitle(String cusTitle) {
		this.cusTitle = cusTitle;
	}


	@Override
	public String toString() {
		return "Customor [cusNo=" + cusNo + ", cusContent=" + cusContent + ", memNo=" + memNo + ", replyStatus="
				+ replyStatus + ", memberName=" + memberName + ", cusCreateDate=" + cusCreateDate + ", cusTitle="
				+ cusTitle + "]";
	}

}

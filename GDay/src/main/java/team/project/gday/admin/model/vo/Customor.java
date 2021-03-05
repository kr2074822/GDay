package team.project.gday.admin.model.vo;

public class Customor {
	private int cusNo; // 고객센터 글번호
	private String cusContent; // 고객센터 내용
	private int memNo; // 회원 번호
	private int curNo; // 댓글 번호
	private String curContent; // 댓글 내용
	
	public Customor() {	}

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

	@Override
	public String toString() {
		return "Customor [cusNo=" + cusNo + ", cusContent=" + cusContent + ", memNo=" + memNo + ", curNo=" + curNo
				+ ", curContent=" + curContent + "]";
	}

}

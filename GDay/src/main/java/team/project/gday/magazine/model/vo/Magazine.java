package team.project.gday.magazine.model.vo;

import java.sql.Date;

public class Magazine {
	
	private int mgzNo;
	private String mgzTitle;
	private String mgzContent;
	private Date mgzCreateDt;
	private int mgzReadCnt;
	private String mgzDelStatus;
	private int memberNo;
	
	public Magazine() {
	}

	public int getMgzNo() {
		return mgzNo;
	}

	public void setMgzNo(int mgzNo) {
		this.mgzNo = mgzNo;
	}

	public String getMgzTitle() {
		return mgzTitle;
	}

	public void setMgzTitle(String mgzTitle) {
		this.mgzTitle = mgzTitle;
	}

	public String getMgzContent() {
		return mgzContent;
	}

	public void setMgzContent(String mgzContent) {
		this.mgzContent = mgzContent;
	}

	public Date getMgzCreateDt() {
		return mgzCreateDt;
	}

	public void setMgzCreateDt(Date mgzCreateDt) {
		this.mgzCreateDt = mgzCreateDt;
	}

	public int getMgzReadCnt() {
		return mgzReadCnt;
	}

	public void setMgzReadCnt(int mgzReadCnt) {
		this.mgzReadCnt = mgzReadCnt;
	}

	public String getMgzDelStatus() {
		return mgzDelStatus;
	}

	public void setMgzDelStatus(String mgzDelStatus) {
		this.mgzDelStatus = mgzDelStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Magazine [mgzNo=" + mgzNo + ", mgzTitle=" + mgzTitle + ", mgzContent=" + mgzContent + ", mgzCreateDt="
				+ mgzCreateDt + ", mgzReadCnt=" + mgzReadCnt + ", mgzDelStatus=" + mgzDelStatus + ", memberNo="
				+ memberNo + "]";
	}

}

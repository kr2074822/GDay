package team.project.gday.admin.model.vo;

public class Report {
	private int reportNo; // 신고 번호
	private String reportType; // 신고 타입
	private int parentNo; // 부모 게시글 번호
	private String parentType; // 부모 게시글 타입
	private int reportTarget; // 신고대상
	private String reportContent; // 신고 내용
	private int memberNo; // 회원 번호
	
	public Report() {}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public int getParentNo() {
		return parentNo;
	}

	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}

	public String getParentType() {
		return parentType;
	}

	public void setParentType(String parentType) {
		this.parentType = parentType;
	}

	public int getReportTarget() {
		return reportTarget;
	}

	public void setReportTarget(int reportTarget) {
		this.reportTarget = reportTarget;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportType=" + reportType + ", parentNo=" + parentNo
				+ ", parentType=" + parentType + ", reportTarget=" + reportTarget + ", reportContent=" + reportContent
				+ ", memberNo=" + memberNo + "]";
	};
}

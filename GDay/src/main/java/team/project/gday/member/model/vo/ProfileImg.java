package team.project.gday.member.model.vo;

public class ProfileImg {
	private int pfNo;
	private String pfPath;
	private String pfName;
	private int memberNo;
	
	public ProfileImg() {
	}
	
	

	public ProfileImg(int pfNo, String pfPath, String pfName, int memberNo) {
		super();
		this.pfNo = pfNo;
		this.pfPath = pfPath;
		this.pfName = pfName;
		this.memberNo = memberNo;
	}



	public int getPfNo() {
		return pfNo;
	}
	public void setPfNo(int pfNo) {
		this.pfNo = pfNo;
	}
	public String getPfPath() {
		return pfPath;
	}
	public void setPfPath(String pfPath) {
		this.pfPath = pfPath;
	}
	public String getPfName() {
		return pfName;
	}
	public void setPfName(String pfName) {
		this.pfName = pfName;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "ProfileImg [pfNo=" + pfNo + ", pfPath=" + pfPath + ", pfName=" + pfName + ", memberNo=" + memberNo
				+ "]";
	}
	
	
}

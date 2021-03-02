package team.project.gday.member.model.vo;

public class AutoLogin {
	private String sessionId;
	private int memberNo;
	
	public AutoLogin() {
	}

	
	
	public AutoLogin(String sessionId, int memberNo) {
		super();
		this.sessionId = sessionId;
		this.memberNo = memberNo;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "AutoLogin [sessionId=" + sessionId + ", memberNo=" + memberNo + "]";
	}
	
}

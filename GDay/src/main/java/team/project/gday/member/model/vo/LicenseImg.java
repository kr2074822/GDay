package team.project.gday.member.model.vo;

import java.sql.Date;

public class LicenseImg {
	private int memNo;
	private String lcsPath;
	private String lcsName;
	private String lcsStatus;
	private Date lcsDate;
	
	public LicenseImg() {
	}
	
	public LicenseImg(int memNo, String lcsPath, String lcsName, String lcsStatus, Date lcsDate) {
		super();
		this.memNo = memNo;
		this.lcsPath = lcsPath;
		this.lcsName = lcsName;
		this.lcsStatus = lcsStatus;
		this.lcsDate = lcsDate;
	}

	public LicenseImg(int memNo, String lcsPath, String lcsName) {
		super();
		this.memNo = memNo;
		this.lcsPath = lcsPath;
		this.lcsName = lcsName;
	}
	
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getLcsPath() {
		return lcsPath;
	}
	public void setLcsPath(String lcsPath) {
		this.lcsPath = lcsPath;
	}
	public String getLcsName() {
		return lcsName;
	}
	public void setLcsName(String lcsName) {
		this.lcsName = lcsName;
	}
	public String getLcsStatus() {
		return lcsStatus;
	}
	public void setLcsStatus(String lcsStatus) {
		this.lcsStatus = lcsStatus;
	}
	public Date getLcsDate() {
		return lcsDate;
	}
	public void setLcsDate(Date lcsDate) {
		this.lcsDate = lcsDate;
	}

	@Override
	public String toString() {
		return "LicenseImg [memNo=" + memNo + ", lcsPath=" + lcsPath + ", lcsName=" + lcsName + ", lcsStatus="
				+ lcsStatus + ", lcsDate=" + lcsDate + "]";
	}
	
}

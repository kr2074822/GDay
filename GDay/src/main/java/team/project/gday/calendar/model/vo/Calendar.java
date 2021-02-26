package team.project.gday.calendar.model.vo;

import java.sql.Date;

public class Calendar {

	private int gdayNo;
	private String gdayTitle;
	private String gdayFreq;
	private int gdayInter; //interval
	private Date dtStart;
	private Date dtUntil;
	private String gdayColor;
	private int memberNo;
	private String memberNick;
	private String memberPhone;
	
	public int getGdayNo() {
		return gdayNo;
	}
	public void setGdayNo(int gdayNo) {
		this.gdayNo = gdayNo;
	}
	public String getGdayTitle() {
		return gdayTitle;
	}
	public void setGdayTitle(String gdayTitle) {
		this.gdayTitle = gdayTitle;
	}
	public String getGdayFreq() {
		return gdayFreq;
	}
	public void setGdayFreq(String gdayFreq) {
		this.gdayFreq = gdayFreq;
	}
	public int getGdayInter() {
		return gdayInter;
	}
	public void setGdayInter(int gdayInter) {
		this.gdayInter = gdayInter;
	}
	public Date getDtStart() {
		return dtStart;
	}
	public void setDtStart(Date dtStart) {
		this.dtStart = dtStart;
	}
	public Date getDtUntil() {
		return dtUntil;
	}
	public void setDtUntil(Date dtUntil) {
		this.dtUntil = dtUntil;
	}
	public String getGdayColor() {
		return gdayColor;
	}
	public void setGdayColor(String gdayColor) {
		this.gdayColor = gdayColor;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	
	@Override
	public String toString() {
		return "Calendar [gdayNo=" + gdayNo + ", gdayTitle=" + gdayTitle + ", gdayFreq=" + gdayFreq + ", gdayInter="
				+ gdayInter + ", dtStart=" + dtStart + ", dtUntil=" + dtUntil + ", gdayColor=" + gdayColor
				+ ", memberNo=" + memberNo + ", memberNick=" + memberNick + ", memberPhone=" + memberPhone + "]";
	}
	
	
	
}

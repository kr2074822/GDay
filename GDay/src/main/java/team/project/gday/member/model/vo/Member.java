package team.project.gday.member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;
	private String memberEmail;
	private String memberPwd;
	private String memberName;
	private String memberNick;
	private String memberPhone;
	private String memberAddress;
	private String memberGrade;
	private String memberType;
	private String memberSec;
	
	
	private int mImgNo;
	private String mImgPath;
	private String mImgName;
	private String mImgStatus;
	private Date mImgDate;
	
	public Member() {
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getMemberSec() {
		return memberSec;
	}

	public void setMemberSec(String memberSec) {
		this.memberSec = memberSec;
	}

	public int getmImgNo() {
		return mImgNo;
	}

	public void setmImgNo(int mImgNo) {
		this.mImgNo = mImgNo;
	}

	public String getmImgPath() {
		return mImgPath;
	}

	public void setmImgPath(String mImgPath) {
		this.mImgPath = mImgPath;
	}

	public String getmImgName() {
		return mImgName;
	}

	public void setmImgName(String mImgName) {
		this.mImgName = mImgName;
	}

	public String getmImgStatus() {
		return mImgStatus;
	}

	public void setmImgStatus(String mImgStatus) {
		this.mImgStatus = mImgStatus;
	}

	public Date getmImgDate() {
		return mImgDate;
	}

	public void setmImgDate(Date mImgDate) {
		this.mImgDate = mImgDate;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", memberNick=" + memberNick + ", memberPhone=" + memberPhone
				+ ", memberAddress=" + memberAddress + ", memberGrade=" + memberGrade + ", memberType=" + memberType
				+ ", memberSec=" + memberSec + ", mImgNo=" + mImgNo + ", mImgPath=" + mImgPath + ", mImgName="
				+ mImgName + ", mImgStatus=" + mImgStatus + ", mImgDate=" + mImgDate + "]";
	}

	
	
}

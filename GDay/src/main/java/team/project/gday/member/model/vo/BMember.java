package team.project.gday.member.model.vo;

public class BMember {
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
	
	private int memberNo2;
	private String bmemberShop;
	private String bmemberInfo;
	
	public BMember() {
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
	public int getMemberNo2() {
		return memberNo2;
	}
	public void setMemberNo2(int memberNo2) {
		this.memberNo2 = memberNo2;
	}
	public String getBmemberShop() {
		return bmemberShop;
	}
	public void setBmemberShop(String bmemberShop) {
		this.bmemberShop = bmemberShop;
	}
	public String getBmemberInfo() {
		return bmemberInfo;
	}
	public void setBmemberInfo(String bmemberInfo) {
		this.bmemberInfo = bmemberInfo;
	}
	@Override
	public String toString() {
		return "BMember [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", memberNick=" + memberNick + ", memberPhone=" + memberPhone
				+ ", memberAddress=" + memberAddress + ", memberGrade=" + memberGrade + ", memberType=" + memberType
				+ ", memberSec=" + memberSec + ", memberNo2=" + memberNo2 + ", bmemberShop=" + bmemberShop
				+ ", bmemberInfo=" + bmemberInfo + "]";
	}
	
	
}

package team.project.gday.member.bmem.model.vo;

import java.sql.Date;

public class RefundList {
	private int opNo; // 상품 번호
	private Date refundDate; // 반품일
	private String memName; // 구매자
	private String rfReasonName; // 반품사유
	private String statusName; // 상태
	private String prdtType; // 상품 타입
	private int memNo; // 판매자 번호
	
	public RefundList() {
		// TODO Auto-generated constructor stub
	}

	public int getOpNo() {
		return opNo;
	}

	public void setOpNo(int opNo) {
		this.opNo = opNo;
	}

	public Date getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getRfReasonName() {
		return rfReasonName;
	}

	public void setRfReasonName(String rfReasonName) {
		this.rfReasonName = rfReasonName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getPrdtType() {
		return prdtType;
	}

	public void setPrdtType(String prdtType) {
		this.prdtType = prdtType;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	@Override
	public String toString() {
		return "RefundList [opNo=" + opNo + ", refundDate=" + refundDate + ", memName=" + memName + ", rfReasonName="
				+ rfReasonName + ", statusName=" + statusName + ", prdtType=" + prdtType + ", memNo=" + memNo + "]";
	}

	
	
}

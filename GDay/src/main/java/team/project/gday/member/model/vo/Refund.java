package team.project.gday.member.model.vo;

import java.sql.Date;

public class Refund {

	private int opNo; //주문 상품 번호 == REFUND테이블 pk == ORDER_PRODUCT PK
	private int orderNo; //주문 번호
	private int rfReasonCode; //취소/반품 요청 사유 코드
	private String rfReasonName;//취소/반품 요청 사유명
	private String rfContent;//취소/반품 요청 사유 상세내용
	private Date rfDate;//취소/반품 요청일? 환불일?
	private String prdtType;//상품 타입(G / C)
	private int prdtPrice;//상품 가격
	private int opAmount;//수량
	private int statusNo;//주문 상태 번호
	private String statusName;//주문 상태명
	private String impUid;//아임포트코드
	private int buyerNo; //주문자 회원번호
	private String buyerNick;//주문자 회원 닉네임
	private String shipName;//받는 사람 이름
	
	public Refund() {}

	public int getOpNo() {
		return opNo;
	}

	public void setOpNo(int opNo) {
		this.opNo = opNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getRfReasonCode() {
		return rfReasonCode;
	}

	public void setRfReasonCode(int rfReasonCode) {
		this.rfReasonCode = rfReasonCode;
	}

	public String getRfReasonName() {
		return rfReasonName;
	}

	public void setRfReasonName(String rfReasonName) {
		this.rfReasonName = rfReasonName;
	}

	public String getRfContent() {
		return rfContent;
	}

	public void setRfContent(String rfContent) {
		this.rfContent = rfContent;
	}

	public Date getRfDate() {
		return rfDate;
	}

	public void setRfDate(Date rfDate) {
		this.rfDate = rfDate;
	}

	public String getPrdtType() {
		return prdtType;
	}

	public void setPrdtType(String prdtType) {
		this.prdtType = prdtType;
	}

	public int getPrdtPrice() {
		return prdtPrice;
	}

	public void setPrdtPrice(int prdtPrice) {
		this.prdtPrice = prdtPrice;
	}

	public int getOpAmount() {
		return opAmount;
	}

	public void setOpAmount(int opAmount) {
		this.opAmount = opAmount;
	}

	public int getStatusNo() {
		return statusNo;
	}

	public void setStatusNo(int statusNo) {
		this.statusNo = statusNo;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public int getBuyerNo() {
		return buyerNo;
	}

	public void setBuyerNo(int buyerNo) {
		this.buyerNo = buyerNo;
	}

	public String getBuyerNick() {
		return buyerNick;
	}

	public void setBuyerNick(String buyerNick) {
		this.buyerNick = buyerNick;
	}

	public String getShipName() {
		return shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	@Override
	public String toString() {
		return "Refund [opNo=" + opNo + ", orderNo=" + orderNo + ", rfReasonCode=" + rfReasonCode + ", rfReasonName="
				+ rfReasonName + ", rfContent=" + rfContent + ", rfDate=" + rfDate + ", prdtType=" + prdtType
				+ ", prdtPrice=" + prdtPrice + ", opAmount=" + opAmount + ", statusNo=" + statusNo + ", statusName="
				+ statusName + ", impUid=" + impUid + ", buyerNo=" + buyerNo + ", buyerNick=" + buyerNick
				+ ", shipName=" + shipName + "]";
	}
	
	
	
	
}

package team.project.gday.member.bmem.model.vo;

import java.sql.Date;

/**
 * @author kang2
 *
 */
public class OrderList {
	private int orderNo; // 전체 주문 번호
	private int opNo; // 상품별 주문 번호
	private Date orderDate; // 주문일
	private String memName; // 주문자명
	private String prdtName; // 상품명
	private String gOptName; // 상품옵션명
	private int opAmount; // 상품 수량
	private int prdtPrice; // 상품 가격
	private String statusName; // 상품 상태
	private int memNo; // 판매자 회원 번호
	private String prdtType; // 상품 타입
	
	public OrderList() { }

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getOpNo() {
		return opNo;
	}

	public void setOpNo(int opNo) {
		this.opNo = opNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getPrdtName() {
		return prdtName;
	}

	public void setPrdtName(String prdtName) {
		this.prdtName = prdtName;
	}

	public String getgOptName() {
		return gOptName;
	}

	public void setgOptName(String gOptName) {
		this.gOptName = gOptName;
	}

	public int getOpAmount() {
		return opAmount;
	}

	public void setOpAmount(int opAmount) {
		this.opAmount = opAmount;
	}

	public int getPrdtPrice() {
		return prdtPrice;
	}

	public void setPrdtPrice(int prdtPrice) {
		this.prdtPrice = prdtPrice;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getPrdtType() {
		return prdtType;
	}

	public void setPrdtType(String prdtType) {
		this.prdtType = prdtType;
	}

	@Override
	public String toString() {
		return "OrderList [orderNo=" + orderNo + ", opNo=" + opNo + ", orderDate=" + orderDate + ", memName=" + memName
				+ ", prdtName=" + prdtName + ", gOptName=" + gOptName + ", opAmount=" + opAmount + ", prdtPrice="
				+ prdtPrice + ", statusName=" + statusName + ", memNo=" + memNo + ", prdtType=" + prdtType + "]";
	}


		
}

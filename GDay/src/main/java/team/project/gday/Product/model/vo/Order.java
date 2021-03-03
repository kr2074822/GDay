package team.project.gday.Product.model.vo;

import java.sql.Date;

//주문 관련 내용 전체
public class Order {
	private int opNo; //주문상품번호
	private int orderNo; //주문번호
	private int prdtNo;//상품번호
	private String prdtType;//상품 타입
	private String prdtName; //상품명
	private int prdtPrice;//상품가격
	private int sellerNo; //판매자 번호
	private String sellerName; //업체명 
	private int statusNo; //주문 상태 번호 
	private String statusName; //주문 상태명
		//100결제완료 200발송완료 300구매확정 400취소요청 500반품요청 
		//600취소완료 700반품완료 800수강완료 900수강신청
	
	private Date orderDate; //주문일
	private int opAmount;//주문 상품 개수 
	private int giftOpNo; //주문한 옵션 넘버
	private String buyer; //구매회원(일반) (mem_no)
	private String shipName; //받는 사람
	private String shipAddr; //배송지
	private String shipPhone; //받는 사람 연락처
	private String impUid; //아임포트키
	
	public Order() {}
	
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
	public int getPrdtNo() {
		return prdtNo;
	}
	public void setPrdtNo(int prdtNo) {
		this.prdtNo = prdtNo;
	}
	
	public String getPrdtType() {
		return prdtType;
	}

	public void setPrdtType(String prdtType) {
		this.prdtType = prdtType;
	}

	public String getPrdtName() {
		return prdtName;
	}

	public void setPrdtName(String prdtName) {
		this.prdtName = prdtName;
	}

	public int getPrdtPrice() {
		return prdtPrice;
	}

	public void setPrdtPrice(int prdtPrice) {
		this.prdtPrice = prdtPrice;
	}

	public int getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
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
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOpAmount() {
		return opAmount;
	}
	public void setOpAmount(int opAmount) {
		this.opAmount = opAmount;
	}
	public int getGiftOpNo() {
		return giftOpNo;
	}
	public void setGiftOpNo(int giftOpNo) {
		this.giftOpNo = giftOpNo;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getShipName() {
		return shipName;
	}
	public void setShipName(String shipName) {
		this.shipName = shipName;
	}
	public String getShipAddr() {
		return shipAddr;
	}
	public void setShipAddr(String shipAddr) {
		this.shipAddr = shipAddr;
	}

	public String getShipPhone() {
		return shipPhone;
	}
	public void setShipPhone(String shipPhone) {
		this.shipPhone = shipPhone;
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	@Override
	public String toString() {
		return "Order [opNo=" + opNo + ", orderNo=" + orderNo + ", prdtNo=" + prdtNo + ", prdtType=" + prdtType
				+ ", prdtName=" + prdtName + ", prdtPrice=" + prdtPrice + ", sellerNo=" + sellerNo + ", sellerName="
				+ sellerName + ", statusNo=" + statusNo + ", statusName=" + statusName + ", orderDate=" + orderDate
				+ ", opAmount=" + opAmount + ", giftOpNo=" + giftOpNo + ", buyer=" + buyer + ", shipName=" + shipName
				+ ", shipAddr=" + shipAddr + ", shipPhone=" + shipPhone + ", impUid=" + impUid + "]";
	}


	

}

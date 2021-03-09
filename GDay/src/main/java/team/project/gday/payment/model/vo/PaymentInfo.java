package team.project.gday.payment.model.vo;

public class PaymentInfo {
	private int cartNo;
	private int prdtNo;
	private String prdtName;
	private int optNo;
	private int prdtPrice;
	private int prdtAmount;
	
	public PaymentInfo() {
		// TODO Auto-generated constructor stub
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getPrdtNo() {
		return prdtNo;
	}

	public void setPrdtNo(int prdtNo) {
		this.prdtNo = prdtNo;
	}

	public String getPrdtName() {
		return prdtName;
	}

	public void setPrdtName(String prdtName) {
		this.prdtName = prdtName;
	}

	public int getOptNo() {
		return optNo;
	}

	public void setOptNo(int optNo) {
		this.optNo = optNo;
	}

	public int getPrdtPrice() {
		return prdtPrice;
	}

	public void setPrdtPrice(int prdtPrice) {
		this.prdtPrice = prdtPrice;
	}

	public int getPrdtAmount() {
		return prdtAmount;
	}

	public void setPrdtAmount(int prdtAmount) {
		this.prdtAmount = prdtAmount;
	}

	@Override
	public String toString() {
		return "OrderInfo [cartNo=" + cartNo + ", prdtNo=" + prdtNo + ", prdtName=" + prdtName + ", optNo=" + optNo
				+ ", prdtPrice=" + prdtPrice + ", prdtAmount=" + prdtAmount + "]";
	}
	
	
	
}

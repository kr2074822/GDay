package team.project.gday.payment.model.vo;

public class PaymentInfo {
	private int cartNo;
	private int prdtNo;
	private String prdtName;
	private int gOptNo;
	private int prdtPrice;
	private int cartAmount;
	
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

	public int getgOptNo() {
		return gOptNo;
	}

	public void setgOptNo(int gOptNo) {
		this.gOptNo = gOptNo;
	}

	public int getPrdtPrice() {
		return prdtPrice;
	}

	public void setPrdtPrice(int prdtPrice) {
		this.prdtPrice = prdtPrice;
	}

	public int getCartAmount() {
		return cartAmount;
	}

	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}

	@Override
	public String toString() {
		return "PaymentInfo [cartNo=" + cartNo + ", prdtNo=" + prdtNo + ", prdtName=" + prdtName + ", gOptNo=" + gOptNo
				+ ", prdtPrice=" + prdtPrice + ", cartAmount=" + cartAmount + "]";
	}
	
	
}

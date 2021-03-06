package team.project.gday.member.model.vo;

public class Baguni {
	private int cartNo; // 장바구니 번호
	private String prdtName; // 상품명
	private int prdtNo; // 상품 번호
	private int memNo; // 회원 번호
	private String gOptName; // 옵션명
	private int gOptNo; // 옵션 번호
	private int cartAmount; // 수량
	private int prdtPrice; // 상품가격
	private String prdtType; // 상품타입
		
	public Baguni() { }

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getPrdtName() {
		return prdtName;
	}

	public void setPrdtName(String prdtName) {
		this.prdtName = prdtName;
	}

	public int getPrdtNo() {
		return prdtNo;
	}

	public void setPrdtNo(int prdtNo) {
		this.prdtNo = prdtNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getgOptName() {
		return gOptName;
	}

	public void setgOptName(String gOptName) {
		this.gOptName = gOptName;
	}

	public int getgOptNo() {
		return gOptNo;
	}

	public void setgOptNo(int gOptNo) {
		this.gOptNo = gOptNo;
	}

	public int getCartAmount() {
		return cartAmount;
	}

	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}

	public int getPrdtPrice() {
		return prdtPrice;
	}

	public void setPrdtPrice(int prdtPrice) {
		this.prdtPrice = prdtPrice;
	}

	public String getPrdtType() {
		return prdtType;
	}

	public void setPrdtType(String prdtType) {
		this.prdtType = prdtType;
	}

	@Override
	public String toString() {
		return "Baguni [cartNo=" + cartNo + ", prdtName=" + prdtName + ", prdtNo=" + prdtNo + ", memNo=" + memNo
				+ ", gOptName=" + gOptName + ", gOptNo=" + gOptNo + ", cartAmount=" + cartAmount + ", prdtPrice="
				+ prdtPrice + ", prdtType=" + prdtType + "]";
	}	
	
}

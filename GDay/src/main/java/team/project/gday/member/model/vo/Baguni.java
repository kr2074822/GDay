package team.project.gday.member.model.vo;

public class Baguni {
	private int cartNo; // 장바구니 번호
	private int cartAmount; // 수량
	private int prdtNo; // 상품 번호
	private int memNo; // 회원 번호
	private int gOptNo; // 옵션 번호
	private int prdtType; // 상품 타입

	public Baguni() { }

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartAmount() {
		return cartAmount;
	}

	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
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

	public int getgOptNo() {
		return gOptNo;
	}

	public void setgOptNo(int gOptNo) {
		this.gOptNo = gOptNo;
	}

	public int getPrdtType() {
		return prdtType;
	}

	public void setPrdtType(int prdtType) {
		this.prdtType = prdtType;
	}

	@Override
	public String toString() {
		return "Baguni [cartNo=" + cartNo + ", cartAmount=" + cartAmount + ", prdtNo=" + prdtNo + ", memNo=" + memNo
				+ ", gOptNo=" + gOptNo + ", prdtType=" + prdtType + "]";
	}
	
	
	
}

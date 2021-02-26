package team.project.gday.Product.model.vo;

// 선물 옵션
public class GOption {
	private int gOptNo; // 선물 옵션 번호
	private String gOptName; // 선물 옵션 이름
	private int gOptType; // 선물 옵션 타입
	private String gOptSold; // 선물 옵션 품절 여부
	private int prdtNo; // 상품 번호
	
	public GOption() { }

	public int getgOptNo() {
		return gOptNo;
	}

	public void setgOptNo(int gOptNo) {
		this.gOptNo = gOptNo;
	}

	public String getgOptName() {
		return gOptName;
	}

	public void setgOptName(String gOptName) {
		this.gOptName = gOptName;
	}

	public int getgOptType() {
		return gOptType;
	}

	public void setgOptType(int gOptType) {
		this.gOptType = gOptType;
	}

	public String getgOptSold() {
		return gOptSold;
	}

	public void setgOptSold(String gOptSold) {
		this.gOptSold = gOptSold;
	}

	public int getPrdtNo() {
		return prdtNo;
	}

	public void setPrdtNo(int prdtNo) {
		this.prdtNo = prdtNo;
	}

	@Override
	public String toString() {
		return "GOption [gOptNo=" + gOptNo + ", gOptName=" + gOptName + ", gOptType=" + gOptType + ", gOptSold="
				+ gOptSold + ", prdtNo=" + prdtNo + "]";
	}
	
	
}

package team.project.gday.product.model.vo;

// 상품별 해시태그
public class ProductCTag {
	private int prdtNo; // 상품 번호
	private String tagName; // 태그 이름
	private int ctNo; // 카테고리 번호
	private String ctName; // 카테고리 명
	private int tagNo; // 태그 번호
	
	public ProductCTag() { }

	public int getPrdtNo() {
		return prdtNo;
	}

	public void setPrdtNo(int prdtNo) {
		this.prdtNo = prdtNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public int getCtNo() {
		return ctNo;
	}

	public void setCtNo(int ctNo) {
		this.ctNo = ctNo;
	}

	public String getCtName() {
		return ctName;
	}

	public void setCtName(String ctName) {
		this.ctName = ctName;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	@Override
	public String toString() {
		return "ProductCTag [prdtNo=" + prdtNo + ", tagName=" + tagName + ", ctNo=" + ctNo + ", ctName=" + ctName
				+ ", tagNo=" + tagNo + "]";
	}
	
}

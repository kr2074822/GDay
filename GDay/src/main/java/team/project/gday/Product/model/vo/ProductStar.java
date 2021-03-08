package team.project.gday.Product.model.vo;

public class ProductStar {

	public int prdtNo;
	public String prdtName;
	public float rvStarAvg;
	public float rvStarView;
	
	public ProductStar() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public ProductStar(int prdtNo, String prdtName, float rvStarAvg) {
		super();
		this.prdtNo = prdtNo;
		this.prdtName = prdtName;
		this.rvStarAvg = rvStarAvg;
	}



	public ProductStar(int prdtNo, String prdtName, float rvStarAvg, float rvStarView) {
		super();
		this.prdtNo = prdtNo;
		this.prdtName = prdtName;
		this.rvStarAvg = rvStarAvg;
		this.rvStarView = rvStarView;
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



	public float getRvStarAvg() {
		return rvStarAvg;
	}



	public void setRvStarAvg(float rvStarAvg) {
		this.rvStarAvg = rvStarAvg;
	}



	public float getRvStarView() {
		return rvStarView;
	}



	public void setRvStarView(float rvStarView) {
		this.rvStarView = rvStarView;
	}



	@Override
	public String toString() {
		return "ProductStar [prdtNo=" + prdtNo + ", prdtName=" + prdtName + ", rvStarAvg=" + rvStarAvg + ", rvStarView="
				+ rvStarView + "]";
	}
	
	
	
}

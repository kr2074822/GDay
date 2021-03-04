package team.project.gday.magazine.model.vo;

public class MagazineImg {
	private int imgNo;
	private String imgPath;
	private String imgName;
	private int imgLevel;
	private int mgzNo;
	
	public MagazineImg() {
	}



	public MagazineImg( String imgPath, String imgName, int imgLevel, int mgzNo) {
		super();
		this.imgPath = imgPath;
		this.imgName = imgName;
		this.imgLevel = imgLevel;
		this.mgzNo = mgzNo;
	}



	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public int getImgLevel() {
		return imgLevel;
	}

	public void setImgLevel(int imgLevel) {
		this.imgLevel = imgLevel;
	}

	public int getMgzNo() {
		return mgzNo;
	}

	public void setMgzNo(int mgzNo) {
		this.mgzNo = mgzNo;
	}

	@Override
	public String toString() {
		return "MagazineImg [imgNo=" + imgNo + ", imgPath=" + imgPath + ", imgName=" + imgName + ", imgLevel="
				+ imgLevel + ", mgzNo=" + mgzNo + "]";
	}
	
}

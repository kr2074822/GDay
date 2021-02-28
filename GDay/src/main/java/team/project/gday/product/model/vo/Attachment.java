package team.project.gday.product.model.vo;

public class Attachment {
	private int fileNo;
	private String filePath;
	private String fileName;
	private int fileLevel;
	private int prdtNo;
	
	public Attachment() { }

	public Attachment(String filePath, String fileName, int fileLevel, int prdtNo) {
		super();
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.prdtNo = prdtNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getPrdtNo() {
		return prdtNo;
	}

	public void setPrdtNo(int prdtNo) {
		this.prdtNo = prdtNo;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName + ", fileLevel="
				+ fileLevel + ", prdtNo=" + prdtNo + "]";
	}
	
	
}

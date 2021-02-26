package team.project.gday.Product.model.vo;

import java.sql.Date;

// 선물
public class Gift {
	private int prdtNo; // 상품 번호
	private String prdtType; // 상품 타입
	private String prdtName; // 상품명
	private String prdtContent; // 소개내용
	private int prdtPrice; // 가격
	private int readCount; // 조회수
	private Date createDate; // 작성 날짜
	private Date modifyDate; // 수정 날짜
	private String prdtStatus; // 블라인드 여부
	private int memNo; // 회원 번호
	private String gStatus; // 품절 여부
	
	public Gift() {}

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

	public String getPrdtContent() {
		return prdtContent;
	}

	public void setPrdtContent(String prdtContent) {
		this.prdtContent = prdtContent;
	}

	public int getPrdtPrice() {
		return prdtPrice;
	}

	public void setPrdtPrice(int prdtPrice) {
		this.prdtPrice = prdtPrice;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getPrdtStatus() {
		return prdtStatus;
	}

	public void setPrdtStatus(String prdtStatus) {
		this.prdtStatus = prdtStatus;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getgStatus() {
		return gStatus;
	}

	public void setgStatus(String gStatus) {
		this.gStatus = gStatus;
	}

	@Override
	public String toString() {
		return "Gift [prdtNo=" + prdtNo + ", prdtType=" + prdtType + ", prdtName=" + prdtName + ", prdtContent="
				+ prdtContent + ", prdtPrice=" + prdtPrice + ", readCount=" + readCount + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", prdtStatus=" + prdtStatus + ", memNo=" + memNo + ", gStatus="
				+ gStatus + "]";
	}
	
	
	
}


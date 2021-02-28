package team.project.gday.product.model.vo;

import java.sql.Date;

// 핸드메이드 클래스
public class GClass {
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

	private int cCount; // 클래스 정원
	private int cNowCount; // 클래스 인원
	private int cSession; // 클래스 횟수
	private String cLocal; // 클래스 장소
	private Date cStartDate; // 클래스 개강일
	private Date cEndDate; // 클래스 종강일
	private String cStatus; // 클래스 모집여부
	private String cDate; // 수업일/시간

	public GClass() { }

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

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	public int getcNowCount() {
		return cNowCount;
	}

	public void setcNowCount(int cNowCount) {
		this.cNowCount = cNowCount;
	}

	public int getcSession() {
		return cSession;
	}

	public void setcSession(int cSession) {
		this.cSession = cSession;
	}

	public String getcLocal() {
		return cLocal;
	}

	public void setcLocal(String cLocal) {
		this.cLocal = cLocal;
	}

	public Date getcStartDate() {
		return cStartDate;
	}

	public void setcStartDate(Date cStartDate) {
		this.cStartDate = cStartDate;
	}

	public Date getcEndDate() {
		return cEndDate;
	}

	public void setcEndDate(Date cEndDate) {
		this.cEndDate = cEndDate;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}

	@Override
	public String toString() {
		return "GClass [prdtNo=" + prdtNo + ", prdtType=" + prdtType + ", prdtName=" + prdtName + ", prdtContent="
				+ prdtContent + ", prdtPrice=" + prdtPrice + ", readCount=" + readCount + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", prdtStatus=" + prdtStatus + ", memNo=" + memNo + ", cCount="
				+ cCount + ", cNowCount=" + cNowCount + ", cSession=" + cSession + ", cLocal=" + cLocal
				+ ", cStartDate=" + cStartDate + ", cEndDate=" + cEndDate + ", cStatus=" + cStatus + ", cDate=" + cDate
				+ "]";
	}

}
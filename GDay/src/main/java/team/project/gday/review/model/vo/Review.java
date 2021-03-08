package team.project.gday.review.model.vo;

import java.sql.Date;

public class Review {

	private int rvNo; //후기 번호 rvNo == opNo (주문 상품 번호)
	private String rvContent;//후기 내용
	private int rvStar; //후기 별점 1,2,3,4,5
	private Date createDate; //후기 작성일
	private String rvStatus;//후기 상태
	private int writerNo;//작성자 번호 (WRITER_NO = MEM_NO)
	private String writer; //작성자 닉네임(WRITER = MEM_NICK)
	private int prdtNo; //상품 번호
	private int giftOpNo; //옵션 번호 (GIFT_OP_NO = G_OPT_NO)(GIFT_OPTION)
	private String rvImgPath;//후기 사진 폴더명(RV_IMG_PATH)
	private String rvImgName;//후기 사진명(RV_IMG_NAME) : null값이어도 받아옴(아웃터 조인함)
	
	public Review() {
	}

	public int getRvNo() {
		return rvNo;
	}

	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}

	public String getRvContent() {
		return rvContent;
	}

	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}

	public int getRvStar() {
		return rvStar;
	}

	public void setRvStar(int rvStar) {
		this.rvStar = rvStar;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getRvStatus() {
		return rvStatus;
	}

	public void setRvStatus(String rvStatus) {
		this.rvStatus = rvStatus;
	}

	public int getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getPrdtNo() {
		return prdtNo;
	}

	public void setPrdtNo(int prdtNo) {
		this.prdtNo = prdtNo;
	}

	public int getGiftOpNo() {
		return giftOpNo;
	}

	public void setGiftOpNo(int giftOpNo) {
		this.giftOpNo = giftOpNo;
	}

	public String getRvImgPath() {
		return rvImgPath;
	}

	public void setRvImgPath(String rvImgPath) {
		this.rvImgPath = rvImgPath;
	}

	public String getRvImgName() {
		return rvImgName;
	}

	public void setRvImgName(String rvImgName) {
		this.rvImgName = rvImgName;
	}

	@Override
	public String toString() {
		return "Review [rvNo=" + rvNo + ", rvContent=" + rvContent + ", rvStar=" + rvStar + ", createDate=" + createDate
				+ ", rvStatus=" + rvStatus + ", writerNo=" + writerNo + ", writer=" + writer + ", prdtNo=" + prdtNo
				+ ", giftOpNo=" + giftOpNo + ", rvImgPath=" + rvImgPath + ", rvImgName=" + rvImgName + "]";
	}
	
	
	
}

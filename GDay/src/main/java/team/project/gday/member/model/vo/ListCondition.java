package team.project.gday.member.model.vo;

import java.sql.Date;

public class ListCondition {

	private int cp;//현재 페이지
	private String periodRadio; //라디오 클릭을 위한 조건
	//7days, 1Month, 3Months, 6Months, selfInput
	private Date periodStart; //조회 시작일
	private Date periodEnd; //조회 마지막일
	private String tabMenu; //탭 메뉴 value (readyClass, endClass / review/wish-gift, review/wish-class)
	private int statusNo; //주문 상태
	
	public ListCondition() {
	}
	
	
	public int getCp() {
		return cp;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public String getPeriodRadio() {
		return periodRadio;
	}
	public void setPeriodRadio(String periodRadio) {
		this.periodRadio = periodRadio;
	}
	public Date getPeriodStart() {
		return periodStart;
	}
	public void setPeriodStart(Date periodStart) {
		this.periodStart = periodStart;
	}
	public Date getPeriodEnd() {
		return periodEnd;
	}
	public void setPeriodEnd(Date periodEnd) {
		this.periodEnd = periodEnd;
	}
	public String getTabMenu() {
		return tabMenu;
	}
	public void setTabMenu(String tabMenu) {
		this.tabMenu = tabMenu;
	}
	public int getStatusNo() {
		return statusNo;
	}
	public void setStatusNo(int statusNo) {
		this.statusNo = statusNo;
	}



	@Override
	public String toString() {
		return "ListCondition [cp=" + cp + ", periodRadio=" + periodRadio + ", periodStart=" + periodStart
				+ ", periodEnd=" + periodEnd + ", tabMenu=" + tabMenu + ", statusNo=" + statusNo + "]";
	}

	
}

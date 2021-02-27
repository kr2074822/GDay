package team.project.gday.member.model.vo;

public class BmemberInfo {

	private int bmemNo;
	private String bmemShop;
	private String bmemIntro;
	
	public BmemberInfo() {
	}

	public BmemberInfo(int bmemNo, String bmemShop, String bmemIntro) {
		super();
		this.bmemNo = bmemNo;
		this.bmemShop = bmemShop;
		this.bmemIntro = bmemIntro;
	}
	
	public BmemberInfo(int bmemNo, String bmemShop) {
		super();
		this.bmemNo = bmemNo;
		this.bmemShop = bmemShop;
	}

	public int getBmemNo() {
		return bmemNo;
	}

	public void setBmemNo(int bmemNo) {
		this.bmemNo = bmemNo;
	}

	public String getBmemShop() {
		return bmemShop;
	}

	public void setBmemShop(String bmemShop) {
		this.bmemShop = bmemShop;
	}

	public String getBmemIntro() {
		return bmemIntro;
	}

	public void setBmemIntro(String bmemIntro) {
		this.bmemIntro = bmemIntro;
	}

	@Override
	public String toString() {
		return "BmemberInfo [bmemNo=" + bmemNo + ", bmemShop=" + bmemShop + ", bmemIntro=" + bmemIntro + "]";
	}
	
}

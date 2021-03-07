package team.project.gday.search.model.vo;

import java.util.Arrays;

public class Search {
	
	private int[] category; //카테고리 번호
	private int[] hashNo; //해시태그 번호
	private String sv; //검색값

	public Search() {
		// TODO Auto-generated constructor stub
	}

	public Search(int[] category, int[] hashNo, String sv) {
		super();
		this.category = category;
		this.hashNo = hashNo;
		this.sv = sv;
	}

	public int[] getCategory() {
		return category;
	}

	public void setCategory(int[] category) {
		this.category = category;
	}

	public int[] getHashNo() {
		return hashNo;
	}

	public void setHashNo(int[] hashNo) {
		this.hashNo = hashNo;
	}

	public String getSv() {
		return sv;
	}

	public void setSv(String sv) {
		this.sv = sv;
	}

	@Override
	public String toString() {
		return "Search [category=" + Arrays.toString(category) + ", hashNo=" + Arrays.toString(hashNo) + ", sv=" + sv
				+ "]";
	}
	
	
}

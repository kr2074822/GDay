package team.project.gday.admin.model.vo;

public class adminPageInfo {
	private int currentPage; 	// 현재 페이지 번호를 표시할 변수
	private int listCount; 		// 전체 게시글 수
	private int limit = 10; 			// 한 페이지에 보여질 게시글 수
	private int pageSize = 10; 	// 보여질 페이징바의 페이지 개수
	
	private int maxPage;	 	// 전체 페이지에서 가장 마지막 페이지
	private int startPage;	 	// 페이징바 시작 페이지 번호
	private int endPage; 	 	// 페이징바 끝 페이지 번호
	
	
	public int getCurrentPage() {
		return currentPage;
	}

	// 페이징 처리(목록) 
	public adminPageInfo(int currentPage, int listCount) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
	}



	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getListCount() {
		return listCount;
	}


	public void setListCount(int listCount) {
		this.listCount = listCount;
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getMaxPage() {
		return maxPage;
	}


	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	@Override
	public String toString() {
		return "adminPageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
				+ ", pageSize=" + pageSize + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
}

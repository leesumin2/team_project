package com.teamProject.cdcd.dto;

public class PageHandler_CafeList {

	private int totalCnt;
	private int naviSize = 10;
	private int totalPage;
	private int beginPage;
	private int endPage;
	private boolean showPrev;
	private boolean showNext;
	
	private SearchOption so;
	
	public PageHandler_CafeList() {}
	
	
	public PageHandler_CafeList(int totalCnt, SearchOption so) {
		this.totalCnt = totalCnt;
		this.so = so;
		doPaging(totalCnt, so);
	}

	public void doPaging(int totalCnt, SearchOption so) {

		this.totalCnt = totalCnt;
		totalPage = (int)Math.ceil(totalCnt/(double)so.getPageSize());
		beginPage = (so.getPage()-1)/naviSize*naviSize + 1;
		endPage = Math.min(beginPage + naviSize-1, totalPage);
		showPrev = beginPage != 1;
		showNext = endPage != totalPage;
	}
	
	void print() {
		System.out.println("page=" + so.getPage());
		System.out.println(showPrev ? "<" : "");
		for(int i=beginPage; i<=endPage; i++) {
			System.out.println(i + " ");
		}
		System.out.println(showNext ? ">" : "");
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getNaviSize() {
		return naviSize;
	}

	public void setNaviSize(int naviSize) {
		this.naviSize = naviSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isShowPrev() {
		return showPrev;
	}

	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	
	public SearchOption getSo() {
		return so;
	}


	public void setSc(SearchOption so) {
		this.so = so;
	}


	@Override
	public String toString() {
		return "PageHandler [totalCnt=" + totalCnt + ", naviSize=" + naviSize + ", totalPage=" + totalPage
				+ ", beginPage=" + beginPage + ", endPage=" + endPage + ", showPrev=" + showPrev + ", showNext="
				+ showNext + ", so=" + so + "]";
	}


}

package lifeShare.dto;

import org.springframework.stereotype.Repository;

@Repository
public class Pagination {
	private int listSize = 12; 
	private int rangeSize = 5;
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage = 1;
	private int startList;
	private int endPage = 1;
	private boolean prev;
	private boolean next;

	
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	
	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getStartList() {
		return startList;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;

		//전체 페이지수 
		this.pageCnt = (int) Math.ceil((double)listCnt/listSize);
		//시작 페이지
		this.startPage = (range - 1) * rangeSize + 1 ;

		this.endPage = range * rangeSize;
		
		this.startList = (page - 1) * listSize;

		this.prev = range == 1 ? false : true;

		this.next = pageCnt > endPage ? true : false;

		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}

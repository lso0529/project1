package org.zerock.board.command;

public class PageVO {

	private int startPage;
	private int endPage;

	private boolean prev, next;

	private int total;
	private Criteria cri;

	public PageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;

		// (int)Math.ceil(페이지번호 / (double)한번에 보여질 페이지 수) * 한번에 보여질 페이지 수;
		this.endPage = (int) Math.ceil(cri.getPageNum() / (double) 10) * 10;

		// endPage - 한번에 보여질 페이지 개수 + 1
		this.startPage = endPage - 10 + 1;

		int realEnd = (int) Math.ceil(total / (double) cri.getCount());

		// 게시글 100개 미만인 경우
		if (this.endPage > realEnd) {
			this.endPage = realEnd;
		}

		// 이전 버튼
		this.prev = this.startPage > 1;

		// 다음 버튼
		this.next = realEnd > this.endPage;

		System.out.println("[endPage]:" + endPage);
		System.out.println("[startPage]:" + startPage);
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
}

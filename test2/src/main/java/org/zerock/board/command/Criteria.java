package org.zerock.board.command;

public class Criteria {
	
	private int pageNum;	//page번호
	private int count;		//몇 개의 데이터를 게시판에 출력할지 결정
	
	public Criteria() {
		//최초 게시판에 진입할 때 기본값 설정, 1번 페이지, 10개의 게시물 설정
		this.pageNum = 1;
		this.count = 10;
	}
	
	public Criteria(int pageNum, int count) {
		//전달받은 매개변수를 이용한 페이지 값 출력
		super();
		this.pageNum = pageNum;
		this.count = count;
	}
	
	public int getPageStart() {
		return ((pageNum - 1) * count) + 1;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getCount() {
		return count;
	}
	
	public int getCount_oracle() {  
		return (pageNum * count);
	}

	public void setCount(int count) {
		this.count = count;
	}

}

package org.zerock.board.mapper;

import java.util.ArrayList;

import org.zerock.board.command.BoardVO;
import org.zerock.board.command.Criteria;

public interface BoardMapper {

	public ArrayList<BoardVO> getList();	//모든 게시물 가져오기
	public void insertBoard(BoardVO vo);	//게시물 등록
	public BoardVO getContent(int num); 	//게시물 상세보기 가져오기
	public boolean updateBoard(BoardVO vo); 	//게시물 수정완료 처리
	public void deleteBoard(int num);			//게시물 삭제
	
	public ArrayList<BoardVO> pagingList(Criteria cri);	//페이징
	
	public int getTotal();	//전체 데이터 수
}

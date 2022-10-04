package org.zerock.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.board.command.BoardVO;
import org.zerock.board.command.Criteria;
import org.zerock.board.mapper.BoardMapper;

@Service
public class BoardServiceImple implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public ArrayList<BoardVO> getList(Criteria cri) {
		ArrayList<BoardVO> list = mapper.pagingList(cri);
		return list;
	}

	@Override
	public void register(BoardVO vo) {
		
		mapper.insertBoard(vo);
	}

	@Override
	public BoardVO getContent(int num) {
		BoardVO vo = mapper.getContent(num);
		return vo;
	}

	@Override
	public void update(BoardVO vo) {
		boolean bool = mapper.updateBoard(vo);
	}

	@Override
	public void delete(int num) {
		mapper.deleteBoard(num);

	}

	@Override
	public int getTotal() {
		int total = mapper.getTotal();
		return total;
	}

}

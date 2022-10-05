package org.zerock.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.member.command.MemberVO;
import org.zerock.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int join(MemberVO vo) {
		
		int result = mapper.join(vo);
		System.out.println("성공? 실패? "+ result);
		
		return result;
	}

	@Override
	public int login(MemberVO vo) {
		int result = mapper.login(vo);
		System.out.println("성공? 실패?: "+result);
		return result;
	}

	@Override
	public int idCheck(String id) {
		int result = mapper.idCheck(id);
		System.out.println("아이디 개수 : "+result);
		return result;
	}

}

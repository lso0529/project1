package org.zerock.member.mapper;

import org.zerock.member.command.MemberVO;

public interface MemberMapper {
	
	public int join(MemberVO vo);
	public int login(MemberVO vo);
	public int idCheck(String id);

}

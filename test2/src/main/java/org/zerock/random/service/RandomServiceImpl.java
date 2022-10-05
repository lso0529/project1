package org.zerock.random.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.random.command.RandomVO;
import org.zerock.random.mapper.RandomMapper;

@Service
public class RandomServiceImpl implements RandomService {
	
	@Autowired
	RandomMapper mapper;

	@Override
	public RandomVO selectfood(int fno) {
		RandomVO vo = mapper.selectfood(fno);
		return vo;
	}

}

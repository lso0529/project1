package org.zerock.random.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.random.command.RandomVO;
import org.zerock.random.service.RandomService;

@Controller
@RequestMapping("/random")
public class RandomController {
	
	@Autowired
	RandomService service;
	
	@RequestMapping(value="/doRandom")
	public String doRandom(Model model) {
		
		//토탈 수 구해와서 어쩌구 저쩌구 
		int fno = (int)(Math.random()*100);
		
		System.out.println(fno);
		
		RandomVO vo = service.selectfood(fno);
		
		model.addAttribute("vo", vo);
		
		return "/random/result";
	}
}

package org.zerock.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.board.command.BoardVO;
import org.zerock.board.command.Criteria;
import org.zerock.board.command.PageVO;
import org.zerock.board.service.BoardService;

@Controller
@RequestMapping("/board/")
public class Board01Controller {

		@Autowired
		private BoardService service;
	
		//페이징 화면 처리
		@RequestMapping("/list")
		public String list(Model model, Criteria cri) {
			
			ArrayList<BoardVO> list = service.getList(cri);
			
			model.addAttribute("board_list", list);
			
			int total = service.getTotal(); 
			model.addAttribute("pageMaker", new PageVO(cri, total));
			
			return "board/list";
		}
		
		//등록 화면으로 이동
		@GetMapping("/register") 
		public String register(@ModelAttribute("cri") Criteria cri) {
			System.out.println("화면 처리");
			return "board/register";
		}
		
		@PostMapping("/register")
		public String register(BoardVO vo) {
			
			System.out.println("등록 처리");
			
			service.register(vo);
			
			return "redirect:/board/list";
		}
		
		//상세보기, 수정 처리
		@RequestMapping({"/content","/modify"})
		public void content(@RequestParam("num") int num, Model model, @ModelAttribute("cri") Criteria cri) { 
			
			BoardVO vo = service.getContent(num);
			model.addAttribute("board", vo);
		}
		
		//게시판 수정 완료 버튼 처리
		@RequestMapping("/update")
		public String update(BoardVO vo) {
			System.out.println("컨트롤 계층");
			System.out.println(vo.getBno());
			System.out.println(vo.getTitle());
			System.out.println(vo.getContent());
			
			service.update(vo);
			
			return "redirect:/board/list";    
		}
		
		//게시판 삭제
		@RequestMapping("/delete")
		public String delete(@RequestParam("bno") int num) {
			System.out.println("컨트롤 계층");
			System.out.println(num);
			
			service.delete(num);
			return "redirect:/board/list";
		}
}

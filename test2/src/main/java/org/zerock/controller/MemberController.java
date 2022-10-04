package org.zerock.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.member.command.MemberVO;
import org.zerock.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//로그인 화면처리
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	//회원가입 화면처리
	@RequestMapping("/join")
	public String join() {
		return "member/join";
		
	}
	
	@RequestMapping(value="/checkId",method=RequestMethod.POST)
	@ResponseBody
	public int checkId(@RequestParam("id") String id) {
		System.out.println(id);
		int result = service.idCheck(id);
		
		return result;
	}
	

	//join폼 처리
	@RequestMapping("/joinForm")
	public String joinForm(MemberVO vo, RedirectAttributes RA) {
		
		//조인정보 처리
		int result = service.join(vo);
		//가입처리 성공여부에 따른 메시지 발송
		if(result == 1) { //1을 리턴 받았다는 의미는 insert 성공
		RA.addFlashAttribute("msg", "회원가입에 성공했습니다");
		}else {
		RA.addFlashAttribute("msg", "회원가입에 실패했습니다");
		}
		return "redirect:/member/join_result"; //리다이렉트 방식으로 로그인으로 접근
	
	}
	@RequestMapping("join_result")
	public void join_result() {
		
	}

	//로그인 폼 처리 
	@RequestMapping("/loginForm")
	public String loginForm(MemberVO vo, HttpSession session, RedirectAttributes RA) {
		
		int result = service.login(vo);
		
		if(result ==1) {
			session.setAttribute("user_id", vo.getId());
			return "redirect:/"; //Main으로 이동
		}else {
			RA.addAttribute("msg", "아이디 혹은 비밀번호를 확인하세요!"); //1회성 데이터에 msg저장
			return "redirect:/member/login";
		}
	}
	
	//로그아웃 처리 
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//ajax 테스트
	@RequestMapping("/ajax_test")
	public String test() {
		return "member/ajax_test";
	}

}

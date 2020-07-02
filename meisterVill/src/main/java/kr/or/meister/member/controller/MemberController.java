package kr.or.meister.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.member.model.service.MemberService;
import kr.or.meister.member.model.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("memberService")
	private MemberService service;
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	
	@RequestMapping("/myprofile.do")
	public String myprofile() {
		return "member/myprofile";
	}
	@RequestMapping("/login.do")
	public void login(MemberVO m) {
		MemberVO loginM =  service.selectOneMember(m);
		
		if(loginM!=null){
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
	}
}

package kr.or.meister.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.member.model.service.MemberService;

@Controller
@RequestMapping("/meister/member")
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
}

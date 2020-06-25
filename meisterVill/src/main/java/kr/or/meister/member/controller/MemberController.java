package kr.or.meister.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.member.model.service.MemberService;
import kr.or.meister.member.model.vo.MemberVO;

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
	@RequestMapping("/login.do")
	public void login(MemberVO m) {
		MemberVO member = new MemberVO();	
		MemberVO loginM =  service.selectOneMember(m);
		
		if(loginM!=null){
			System.out.println("�꽦怨�");
		}else {
			System.out.println("�떎�뙣");
		}

		
	}
}

package kr.or.meister.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.member.model.service.MemberService;
import kr.or.meister.member.model.vo.CareerVO;
import kr.or.meister.member.model.vo.LicenseVO;
import kr.or.meister.member.model.vo.MemberDataVO;
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
	public String myprofile(HttpSession session, Model model, MemberDataVO mdv) {
		MemberDataVO mdv2 =  service.selectOneMember2(mdv);
		MemberVO m = (MemberVO)session.getAttribute("member");
		model.addAttribute("m",m);
		model.addAttribute("list",mdv2);
		System.out.println(mdv2);
		return "member/myprofile";
	}
	
	@RequestMapping("/login.do")
	public String login(HttpSession session, MemberVO m) {
		MemberVO loginM =  service.selectOneMember3(m);
		
		if(loginM!=null){
			session.setAttribute("m", loginM);
			return "member/loginSuccess";
		}else {
			return "member/loginFail";
		}
	}
	@RequestMapping("/myRequest.do")
	public String myRequest(HttpSession session, Model model) {
			MemberVO m2 = (MemberVO)session.getAttribute("member");
			model.addAttribute("m",m2);
			return "member/myRequest";
	}
}

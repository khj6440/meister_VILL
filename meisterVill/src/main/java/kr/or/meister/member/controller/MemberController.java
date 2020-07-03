package kr.or.meister.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	
	
	@RequestMapping("/mypagego.do")
	public String mypagego() {
		return "member/mypage";
	}
	
	@RequestMapping("/mypage.do")
	public String mypage(Model model, HttpSession session) {
		MemberVO m2 = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m2);

		return "member/mypage";
	}
	
	@RequestMapping("/myprofile.do")
	public String myprofile(HttpSession session, Model model, MemberDataVO mdv) {
		MemberDataVO mdv2 = service.selectOneMember2(mdv);
		MemberVO m = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m);
		model.addAttribute("list", mdv2);
		System.out.println(mdv2);
		return "member/myprofile";
	}

	@RequestMapping("/login.do")
	public String login(HttpSession session, MemberVO m) {
		MemberVO loginM = service.selectOneMember3(m);

		if (loginM != null) {
			session.setAttribute("member", loginM);
			return "member/loginSuccess";
		} else {
			return "member/loginFail";
		}
	}

	@RequestMapping("/mypage5.do")
	public String mypage5(HttpSession session, Model model) {
		MemberVO m2 = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m2);
		return "member/mypage5";
	}
	

	@ResponseBody
	@RequestMapping(value = "/transformMember.do", produces = "text/html;charset=utf-8")
	public String transformMember(String Nickname, int level, HttpSession session) {
		
		
		MemberVO member = new MemberVO();
		member.setMemberNickname(Nickname);
		member.setMemberLevel(level);
		
		  MemberVO member2 = new MemberVO();
		  
		  if(member.getMemberLevel()==1) { 
			  
			 int result = service.updateMemberLevel(member);
			 
			 if (result > 0) { 
			  member2 = service.selectOneMember4(member);
			  session.setAttribute("member", member2);
		  } 
			 return "0";
			 
			 
		}else if (member.getMemberLevel()==0) {
		  
		  int result = service.updateMemberLevel2(member);
		  
		  if (result > 0) { 
			  member2 = service.selectOneMember4(member);
			  session.setAttribute("member", member2);
			  
			  }
	
		  
		 }
		  return "1";
	}
	
	@RequestMapping("/mypage9.do")
	public String mypage9(HttpSession session, Model model) {
		MemberVO m2 = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m2);
		return "member/mypage9";
	}

}

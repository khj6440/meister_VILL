package kr.or.meister.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.meister.chat.model.vo.ChatVO;
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
	public String login(HttpSession session, MemberVO m) {
		MemberVO member =  service.selectOneMember(m);
		
		if(member != null) {
			session.setAttribute("member", member);
			System.out.println(member);
			System.out.println("로그인 성공");
			return "redirect:/";			
		}else {
			System.out.println("로그인 실패");
			return "redirect:/";
		}
	}
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/goChat.do")
	public String chat(HttpSession session,Model model) {
		MemberVO m = (MemberVO)session.getAttribute("member");
		ArrayList<ChatVO> list = service.selectAllChat(m);
		model.addAttribute("list",list);
		System.out.println(list.size());
		return "member/chat";
	}
	
	@ResponseBody
	@RequestMapping(value="/showChat.do", produces = "application/json; charset=utf-8")
	public String showChat(HttpSession session,String sender) {
		MemberVO m = (MemberVO)session.getAttribute("member");
		ArrayList<ChatVO> list = service.showChat(sender,m.getMemberNickname());
		System.out.println(list.get(0));
		return new Gson().toJson(list);
	}
}

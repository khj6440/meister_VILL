package kr.or.meister.request.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.meister.employ.model.vo.EmployJoinMemberVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.request.model.service.RequestService;
import kr.or.meister.request.model.vo.RequestMemberVO;
import kr.or.meister.request.model.vo.RequestVO;

@Controller
@RequestMapping("/meister/request")
public class RequestController {
	
	@Autowired
	@Qualifier("requestService")
	private RequestService service;
	
	@RequestMapping(value="/showList.do")
	public String employList(int reqPage, String keyWord, Model m) {
		m.addAttribute("reqPage", reqPage);
		m.addAttribute("keyWord", keyWord);
		return "request/requestList";
	}
	@ResponseBody
	@RequestMapping(value="/getRequestList.do", produces = "application/json;charset=utf-8")
	public String getList(int reqPage, String keyWord) {
		HashMap<String, Object> list = service.selectAllList(reqPage, keyWord);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="/showOneList.do")
	public String showOneList(int requestNo, Model m) {
		RequestMemberVO rmVO = service.selectOneList(requestNo);
		m.addAttribute("request", rmVO.getRequestvo());
		m.addAttribute("member", rmVO.getMembervo());
		return "request/showRequest";
	}
	@RequestMapping(value="/makeRequest.do")
	public String makeRequest() {
		return "request/makeRequest";
	}
	@RequestMapping(value="/insertRequest.do")
	public String insertRequest(RequestVO request, Model m) {
		System.out.println(request);
		int result = service.insertRequeset(request);
		m.addAttribute("reqPage", 1);
		return "request/requestList";
	}
	@RequestMapping(value="/insertChat.do")
	public String insertChat(HttpSession session, String requestWriter) {
		MemberVO member = (MemberVO)(session.getAttribute("member"));
		MemberVO member2 = service.selectOne(requestWriter);
		System.out.println("member1" + member.getMemberNickname());
		System.out.println("member2" + member2.getMemberNickname());
		int result = service.insertChat(member, member2);
		return "redirect:/meister/member/goChat.do";
	}
}

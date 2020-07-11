package kr.or.meister.request.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.meister.employ.model.vo.EmployJoinMemberVO;
import kr.or.meister.request.model.service.RequestService;
import kr.or.meister.request.model.vo.RequestMemberVO;

@Controller
@RequestMapping("/meister/request")
public class RequestController {
	
	@Autowired
	@Qualifier("requestService")
	private RequestService service;
	
	@RequestMapping(value="/showList.do")
	public String employList(int reqPage, Model m) {
		m.addAttribute("reqPage", reqPage);
		return "request/requestList";
	}
	@ResponseBody
	@RequestMapping(value="/getRequestList.do", produces = "application/json;charset=utf-8")
	public String getList(int reqPage) {
		HashMap<String, Object> list = service.selectAllList(reqPage);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="/showOneList.do")
	public String showOneList(int requestNo, Model m) {
		RequestMemberVO rmVO = service.selectOneList(requestNo);
		m.addAttribute("request", rmVO.getRequestvo());
		m.addAttribute("member", rmVO.getMembervo());
		return "request/showRequest";
	}
}

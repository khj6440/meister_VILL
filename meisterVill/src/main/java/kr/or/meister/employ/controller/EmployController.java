package kr.or.meister.employ.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.meister.employ.model.service.EmployService;
import kr.or.meister.employ.model.vo.EmployJoinMemberVO;
import kr.or.meister.employ.model.vo.EmployVO;
import kr.or.meister.member.model.vo.MemberVO;

@Controller
@RequestMapping("/meister/employ")
public class EmployController {

	@Autowired
	@Qualifier("employService")
	private EmployService service;
	
	@RequestMapping(value="/showList.do")
	public String employList(int reqPage, Model m) {
		m.addAttribute("reqPage", reqPage);
		return "employ/employList";
	}
	@ResponseBody
	@RequestMapping(value="/getEmployList.do", produces = "application/json;charset=utf-8")
	public String getList(int reqPage) {
		HashMap<String, Object> list = service.selectAllList(reqPage);
		return new Gson().toJson(list);
	}
	@RequestMapping(value="/showOneList.do")
	public String showOneList(int employNo, Model m) {
		EmployJoinMemberVO ejmVO = service.selectOneList(employNo);
		m.addAttribute("employ", ejmVO.getEmployvo());
		m.addAttribute("member", ejmVO.getMembervo());
		return "employ/showEmploy";
	}
	@RequestMapping(value="/makeEmploy.do")
	public String makeEmploy() {
		return "employ/makeEmploy";
	}
	@RequestMapping(value="/insertProject.do")
	public String insertEmployList(EmployVO employ) {
		int reqPage = 1;
		int result = service.insertEmploy(employ);
		return "redirect:/meister/employ/showList.do?reqPage="+reqPage;
	}

}

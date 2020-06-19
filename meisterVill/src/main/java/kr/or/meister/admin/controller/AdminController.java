package kr.or.meister.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.admin.model.service.AdminService;
import kr.or.meister.member.model.vo.MemberVO;

@Controller
public class AdminController {


	
	@Autowired
	@Qualifier("adminService")
	private AdminService service;
	
	@RequestMapping(value="/memberAllViewFrm.do")
	public String memberAllViewFrm(HttpSession session) {
		
		List<MemberVO> m = service.memberAllView();
		
		session.setAttribute("member", m);
		return "admin/memberAllView";
	}
}

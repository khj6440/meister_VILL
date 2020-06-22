package kr.or.meister.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.admin.model.service.AdminService;
import kr.or.meister.admin.model.vo.MemberJoinReportVO;
import kr.or.meister.member.model.vo.MemberVO;

@Controller
public class AdminController {


	
	@Autowired
	@Qualifier("adminService")
	private AdminService service;
	
	@RequestMapping(value="/memberAllViewFrm.do")
	public String memberAllViewFrm(HttpSession session) {
		ArrayList<MemberJoinReportVO> member = service.memberAllView();
		System.out.println(member.size());
		session.setAttribute("member", member);
		return "admin/memberAllView";
	}
	
	@RequestMapping(value="/memberOneViewFrm.do")
	public String memberOneViewFrm(HttpSession session) {
		MemberVO member = new MemberVO();
		int num =1;
		member = service.memberOneView(num);
		
		System.out.println();
		session.setAttribute("m", member);
		return "admin/memberOneView";
	}
	
	
	
	@RequestMapping(value="adminIndexFrm.do")
	public String adminIndexFrm() {
		return "admin/adminIndex";
	}
}

package kr.or.meister.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.admin.model.service.AdminService;
import kr.or.meister.admin.model.vo.MemberJoinReportVO;
import kr.or.meister.admin.model.vo.MemberJoinVO;
import kr.or.meister.admin.model.vo.SelectAllMemberPageVO;
import kr.or.meister.member.model.vo.MemberVO;

@Controller
public class AdminController {


	
	@Autowired
	@Qualifier("adminService")
	private AdminService service;
	
	@RequestMapping(value="/memberAllViewFrm.do")
	public String memberAllViewFrm(HttpSession session, HttpServletRequest request, int reqPage) {
		
		SelectAllMemberPageVO sap = service.memberAllViewPage(reqPage);
		
		request.setAttribute("list", sap.getList());
		request.setAttribute("pageNavi", sap.getPageNavi());
		return "admin/memberAllView.jsp?"+reqPage;
	}
	
		
	@RequestMapping(value="/memberOneViewFrm.do")
	public String memberOneViewFrm(HttpServletRequest request, int memberNo) {
		MemberJoinVO member = new MemberJoinVO();
		member = service.memberOneView(memberNo);

		request.setAttribute("m", member);
		return "admin/memberOneView.jsp?"+memberNo;
	}
	
	
	@RequestMapping(value="/memberLogin.do")
	public String memberLogin(HttpSession session, String memberEmail,String memberPw ) {
		MemberVO member = new MemberVO();

		System.out.println(memberEmail+memberPw);
		member = service.memberLogin(memberEmail,memberPw);
		if(member != null) {
			session.setAttribute("member", member);
			return "admin/adminIndex";
		}else {
			return "redirect:/index.jsp";
		}

		
	}
	
	
	@RequestMapping(value="adminIndexFrm.do")
	public String adminIndexFrm() {
		return "admin/adminIndex";
	}
}

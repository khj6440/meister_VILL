package kr.or.meisert.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meisert.admin.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("adminService")
	private AdminService service;
	
	@RequestMapping(value="/memberAllViewFrm.do")
	public String memberAllViewFrm(HttpSession session) {
		
		List m = service.memberAllView();
		
		session.setAttribute("m", m);
		
		return "admin/memberAllView";
	}
}

package kr.or.meister.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.admin.model.service.AdminService;

@Controller
@RequestMapping("/meister/admin")
public class AdminController {

	@Autowired
	@Qualifier("adminService")
	private AdminService service;
}

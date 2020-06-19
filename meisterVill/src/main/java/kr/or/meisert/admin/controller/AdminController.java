package kr.or.meisert.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.or.meisert.admin.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("adminService")
	private AdminService service;
}

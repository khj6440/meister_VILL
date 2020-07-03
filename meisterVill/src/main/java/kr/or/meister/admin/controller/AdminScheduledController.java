package kr.or.meister.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.meister.admin.model.service.AdminService;

@Controller
@RequestMapping(value = "/meister/admin/Scheduled")
public class AdminScheduledController {

	@Autowired
	@Qualifier("adminService")
	private AdminService service;
	



}

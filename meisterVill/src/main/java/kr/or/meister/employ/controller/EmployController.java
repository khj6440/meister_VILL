package kr.or.meister.employ.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.employ.model.service.EmployService;

@Controller
@RequestMapping("/meister/employ")
public class EmployController {

	@Autowired
	@Qualifier("employService")
	private EmployService service;
}

package kr.or.meister.request.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.or.meister.request.model.service.RequestService;

@Controller
public class RequestController {
	
	@Autowired
	@Qualifier("requestService")
	private RequestService service;
}

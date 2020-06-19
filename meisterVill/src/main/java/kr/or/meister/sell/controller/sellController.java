package kr.or.meister.sell.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.or.meister.sell.model.service.SellService;

@Controller
public class SellController {
	
	@Autowired
	@Qualifier("sellService")
	private SellService service;
}

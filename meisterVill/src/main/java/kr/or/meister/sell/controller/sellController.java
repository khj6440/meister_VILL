package kr.or.meister.sell.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class sellController {

	@RequestMapping(value="/sellList.do")
	public String goList() {
		
		return "sell/sellList";
	}
}

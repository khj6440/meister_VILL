package kr.or.meister.project.contoroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.project.model.service.ProjectService;

@Controller
@RequestMapping("/meister/project")
public class ProjectController {
	
//	@Autowired
//	@Qualifier("memberService")
//	private ProjectService service;
//	
	
	
	@RequestMapping(value="/project4.do")
	public String goCar2d() {
		
		return "project/project4";
	}
}

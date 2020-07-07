package kr.or.meister.project.contoroller;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.employ.model.vo.EmployVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.project.model.service.ProjectService;
import kr.or.meister.project.model.vo.ProjectChatVO;

@Controller
@RequestMapping("/meister/project")
public class ProjectController {
	
	@Autowired
	@Qualifier("projectService")
	private ProjectService service;
	
	@RequestMapping(value="/project4.do")
	public String goCar2d() {
		return "project/project4";
	}
	@RequestMapping(value = "/home.do")
	public String home(Model model,int projectNo) {
		EmployVO e = service.getProjectIntro(projectNo);
		model.addAttribute("project",e);
		return "project/pIntro";
	}
	
	
	@RequestMapping(value = "/chat.do")
	public String chat(Model model,int projectNo) {
		EmployVO e = service.getProjectIntro(projectNo);
		
		ArrayList<MemberVO> members = service.seletProjectMember(e.getProjectMembers());
		ArrayList<ProjectChatVO> chats = service.selectProjectChat(projectNo);
		model.addAttribute("projectNo",projectNo);
		model.addAttribute("chats",chats);
		model.addAttribute("members",members);
		return "project/pChat";
	}
	
	
	@RequestMapping(value = "/todo.do")
	public String todo() {
		return "project/pTodo";
	}
	@RequestMapping(value = "/schedule.do")
	public String schedule() {
		return "project/pSchedule";
	}
	
	@RequestMapping(value = "/files.do")
	public String files() {
		return "project/pFiles";
	}
	@RequestMapping(value="/goFiles.do")
	public String files2() {
		return "project/ttt";
	}
}

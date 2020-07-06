package kr.or.meister.project.model.service;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.employ.model.vo.EmployVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.project.model.dao.ProjectDao;
import kr.or.meister.project.model.vo.ProjectChatVO;

@Service("projectService")
public class ProjectService {
	
	@Autowired
	@Qualifier("projectDao")
	private ProjectDao dao;

	public EmployVO getProjectIntro(int projectNo) {
		return dao.getProjectIntro(projectNo);
	}

	public ArrayList<ProjectChatVO> selectProjectChat(int projectNo) {
		return dao.selectProjectChat(projectNo);
	}

	public ArrayList<MemberVO> seletProjectMember(String projectMembers) {
		StringTokenizer sT = new StringTokenizer(projectMembers,"/");
		ArrayList<Integer> list = new ArrayList<Integer>();
		while(sT.hasMoreTokens()) {
			list.add(Integer.parseInt(sT.nextToken()));
		}
		
		return dao.selectProjectMember(list);
	}
	
	
}

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
import kr.or.meister.project.model.vo.ProjectFileVO;
import kr.or.meister.project.model.vo.ProjectNoticeVO;
import kr.or.meister.project.model.vo.ProjectScheduleVO;

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

	public int insertProjectFile(ProjectFileVO newFile) {
		return dao.insertProjectFile(newFile);
	}

	public ArrayList<ProjectFileVO> selectProjectFile(int projectNo) {
		return dao.selectProjectFile(projectNo);
	}

	public ArrayList<ProjectScheduleVO> selectProjectSchedule(int projectNo) {
		return dao.selectProjectSchedule(projectNo);
	}

	public int insertProjectSchedule(ProjectScheduleVO pSchedule) {
		return dao.insertProjectSchedule(pSchedule);
	}

	public ArrayList<ProjectNoticeVO> selectProjectNotice(int projectNo) {
		return dao.selectProjectNotice(projectNo);
	}
	
	
}

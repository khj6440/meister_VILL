package kr.or.meister.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;
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

	public int insertProjectNotice(ProjectNoticeVO notice) {
		int result =dao.insertProjectNotice(notice);
		int pk=0;
		if(result>0) {
			pk = dao.selectProjectNoticePK(notice);
		}else {
			System.out.println("pk찾기실패");
		}
		return pk;
	}

	public int deleteProjectNotice(int pNoticeNo) {
		return dao.deleteProjectNotice(pNoticeNo);
	}

	public ArrayList<ProjectNoticeVO> selectProjectNotice(int projectNo, String date) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("projectNo", String.valueOf(projectNo));
		map.put("pickDate", date);
		return dao.selectProjectNotice(map);
	}

	public int updateTodoDone(int pNoticeNo) {
		return dao.updateTodoDone(pNoticeNo);
	}

	public int updateTodoDont(int pNoticeNo) {
		return dao.updateTodoDont(pNoticeNo);
	}
	
	
}

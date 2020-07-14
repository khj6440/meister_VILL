package kr.or.meister.project.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.or.meister.employ.model.vo.EmployVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.project.model.vo.ProjectChatVO;
import kr.or.meister.project.model.vo.ProjectFileVO;
import kr.or.meister.project.model.vo.ProjectNoticeVO;
import kr.or.meister.project.model.vo.ProjectScheduleVO;

@Repository("projectDao")
public class ProjectDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public EmployVO getProjectIntro(int projectNo) {
		return sqlSession.selectOne("project.getProjectIntro",projectNo);
	}

	public ArrayList<ProjectChatVO> selectProjectChat(int projectNo) {
		List list = sqlSession.selectList("project.selectProjectChat",projectNo);
		return (ArrayList<ProjectChatVO>)list;
	}

	public ArrayList<MemberVO> selectProjectMember(ArrayList<Integer> list) {
		List result = sqlSession.selectList("project.selectProjectMember",list);
		return (ArrayList<MemberVO>)result;
	}

	public int insertProjectChat(ProjectChatVO pc) {
		return sqlSession.insert("project.insertProjectChat",pc);
	}

	public int insertProjectFile(ProjectFileVO newFile) {
		return sqlSession.insert("project.insertProjectFile",newFile);
	}

	public ArrayList<ProjectFileVO> selectProjectFile(int projectNo) {
		List list =  sqlSession.selectList("project.selectProjectFile",projectNo);
		return (ArrayList<ProjectFileVO>)list;
	}

	public ArrayList<ProjectScheduleVO> selectProjectSchedule(int projectNo) {
		List list = sqlSession.selectList("project.selectProjectSchedule",projectNo);
		return (ArrayList<ProjectScheduleVO>)list;
	}

	public int insertProjectSchedule(ProjectScheduleVO pSchedule) {
		return sqlSession.insert("project.insertProjectSchedule",pSchedule);
	}

	public ArrayList<ProjectNoticeVO> selectProjectNotice(int projectNo) {
		List list = sqlSession.selectList("project.selectProjectNotice",projectNo);
		return (ArrayList<ProjectNoticeVO>)list;

	}

	public int insertProjectNotice(ProjectNoticeVO notice) {
		return sqlSession.insert("project.insertProjectNotice",notice);
	}

	public int selectProjectNoticePK(ProjectNoticeVO notice) {
		return sqlSession.selectOne("project.selectProjectNoticePK",notice);
	}

	public int deleteProjectNotice(int pNoticeNo) {
		return sqlSession.delete("project.deleteProjectNotice",pNoticeNo);
	}

	public ArrayList<ProjectNoticeVO> selectProjectNotice(HashMap<String, String> map) {
		List list = sqlSession.selectList("project.selectProjectNotice2",map);
		return (ArrayList<ProjectNoticeVO>)list;

	}

	public int updateTodoDone(int pNoticeNo) {
		return sqlSession.update("project.updateTodoDone",pNoticeNo);
	}

	public int updateTodoDont(int pNoticeNo) {
		return sqlSession.update("project.updateTodoDont",pNoticeNo);
	}

	
}

package kr.or.meister.project.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.or.meister.employ.model.vo.EmployVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.project.model.vo.ProjectChatVO;
import kr.or.meister.project.model.vo.ProjectFileVO;

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
}

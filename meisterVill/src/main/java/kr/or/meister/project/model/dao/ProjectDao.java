package kr.or.meister.project.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.or.meister.employ.model.vo.EmployVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.project.model.vo.ProjectChatVO;

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
		// TODO Auto-generated method stub
		return sqlSession.insert("project.insertProjectChat",pc);
	}
}

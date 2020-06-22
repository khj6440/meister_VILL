package kr.or.meister.admin.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.admin.model.vo.MemberJoinReportVO;
import kr.or.meister.member.model.vo.MemberVO;





@Repository("adminDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MemberJoinReportVO> selectAllMember() {
		return sqlSession.selectList("MemberJoinReportVO.selectAllMember");
	}

	public MemberVO selectOneMember(int num) {
		return sqlSession.selectOne("MemberVO.selectOneMember",num);
	}
	
}

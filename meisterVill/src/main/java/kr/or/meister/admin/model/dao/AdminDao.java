package kr.or.meister.admin.model.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.admin.model.vo.MemberJoinReportVO;
import kr.or.meister.admin.model.vo.MemberJoinVO;
import kr.or.meister.member.model.vo.MemberVO;





@Repository("adminDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MemberJoinReportVO> selectAllMember() {
		return sqlSession.selectList("MemberJoinReportVO.selectAllMember");
	}

	public MemberJoinVO memberOneView(int memberNo) {
		return sqlSession.selectOne("MemberJoinVO.memberOneView",memberNo);
	}

	public int totalCount() {
		return sqlSession.selectOne("totalCount");
	}

	public List<MemberVO> selectList(HashMap<String, Integer> se) {
		return sqlSession.selectList("MemberVO.selectList",se);
	}

	public MemberVO memberLogin(HashMap<String, String> login) {
		System.out.println(login.get(login));
		return sqlSession.selectOne("MemberVO.memberLogin",login);
	}
	
}

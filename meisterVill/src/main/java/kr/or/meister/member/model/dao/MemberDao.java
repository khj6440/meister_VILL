package kr.or.meister.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.member.model.vo.MemberVO;

@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberVO selectOneMember(MemberVO m) {
		// TODO Auto-generated method stub
		MemberVO lm= sqlSession.selectOne("member.selectOneMember",m);
		return lm;
	}
}

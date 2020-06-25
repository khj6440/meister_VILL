package kr.or.meister.member.model.dao;

import java.util.HashMap;
import java.util.List;

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

	public List selectAllChat(MemberVO m) {
		return sqlSession.selectList("chat.selectAllChat",m);
	}

	public List showChat(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chat.showChat",map);
	}
}

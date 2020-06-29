package kr.or.meister.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.chat.model.vo.ChatVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.message.model.vo.MessageVO;

@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberVO selectOneMember(MemberVO m) {
		// hyeokjin
		MemberVO lm= sqlSession.selectOne("member.selectOneMember",m);
		return lm;
	}

	public List selectAllChat(MemberVO m) {
		// hyeokjin
		return sqlSession.selectList("chat.selectAllChat",m);
	}

	public List showChat(HashMap<String, String> map) {
		// hyeokjin
		return sqlSession.selectList("chat.showChat",map);
	}

	public int insertChat(ChatVO newChat) {
		// hyeokjin
		return sqlSession.insert("chat.insertChat",newChat);
	}

	public List getMessage(String memberNickname) {
		// hyeokjin
		return sqlSession.selectList("message.getMessage",memberNickname);
	}

	public int insertMessage(MessageVO newMsg) {
		// hyeokJin
		return sqlSession.insert("message.insertMessage",newMsg);
	}

	public int selectUnreadCnt(String target) {
		// hyeok
		return sqlSession.selectOne("message.selectUnreadCnt",target);
	}
}

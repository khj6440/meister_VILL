package kr.or.meister.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.chat.model.vo.ChatVO;
import kr.or.meister.member.model.dao.MemberDao;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.message.model.vo.MessageVO;

@Service("memberService")
public class MemberService {
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;

	public MemberVO selectOneMember(MemberVO m) {
		// hyeokjin
		MemberVO lm =  dao.selectOneMember(m);
		return lm;
	}

	public ArrayList<ChatVO> selectAllChat(MemberVO m) {
		// hyeokjin
		List list = dao.selectAllChat(m);
		return (ArrayList<ChatVO>)list;
	}

	public ArrayList<ChatVO> showChat(String sender, String receiver) {
		// hyeokjin
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sender", sender);
		map.put("receiver",receiver);
		List list = dao.showChat(map);
		return (ArrayList<ChatVO>)list;
	}

	public ArrayList<MessageVO> getMessage(String memberNickname) {
		// hyeokjin
		return (ArrayList<MessageVO>)(dao.getMessage(memberNickname));
	}
}

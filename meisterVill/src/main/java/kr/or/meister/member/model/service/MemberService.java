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

@Service("memberService")
public class MemberService {
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;

	public MemberVO selectOneMember(MemberVO m) {
		// TODO Auto-generated method stub
		MemberVO lm =  dao.selectOneMember(m);
		System.out.println(lm);
		return lm;
	}

	public ArrayList<ChatVO> selectAllChat(MemberVO m) {
		List list = dao.selectAllChat(m);
		return (ArrayList<ChatVO>)list;
	}

	public ArrayList<ChatVO> showChat(String sender, String receiver) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sender", sender);
		map.put("receiver",receiver);
		List list = dao.showChat(map);
		return (ArrayList<ChatVO>)list;
	}
}

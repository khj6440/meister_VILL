package kr.or.meister.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.member.model.dao.MemberDao;
import kr.or.meister.member.model.vo.MemberCookieVO;
import kr.or.meister.member.model.vo.MemberVO;

@Service("memberService")
public class MemberService {
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;

	public MemberVO selectOneMember(MemberVO m) {
		// TODO Auto-generated method stub
		MemberVO lm =  dao.selectOneMember(m);
		return lm;
	}

	public MemberVO selectLoginMember(MemberVO m) {
		MemberVO lm =  dao.selectLoginMember(m);
		return lm;
	}

	public String findEmail(MemberVO m) {
		String memberEmail = dao.findEmail(m);
		return memberEmail;
	}

	public MemberVO checkLoginEmail(String memberEmail) {
		return dao.checkLoginEmail(memberEmail);
	}

	public int loginMaintain(MemberCookieVO mcookie) {
		return dao.loginMaintain(mcookie);
	}

	public MemberVO checkNickname(String memberNickname) {
		return dao.checkNickname(memberNickname);
	}


}

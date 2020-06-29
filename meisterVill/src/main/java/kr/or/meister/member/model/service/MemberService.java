package kr.or.meister.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.member.model.dao.MemberDao;
import kr.or.meister.member.model.vo.MemberDataVO;
import kr.or.meister.member.model.vo.MemberVO;

@Service("memberService")
public class MemberService {
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;

	public MemberVO selectOneMember3(MemberVO m) {
		// TODO Auto-generated method stub
		MemberVO lm =  dao.selectOneMember3(m);
		return lm;
	}

	public MemberDataVO selectOneMember2(MemberDataVO mdv) {
		return dao.selectOneMember2(mdv);
	}
}

package kr.or.meister.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.chat.model.vo.ChatVO;
import kr.or.meister.coupon.model.vo.CouponJoinCouponIssuedVO;
import kr.or.meister.coupon.model.vo.CouponVO;
import kr.or.meister.member.model.dao.MemberDao;

import kr.or.meister.member.model.vo.MemberDataVO;

import kr.or.meister.member.model.vo.MemberCookieVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.message.model.vo.MessageVO;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;

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

	public int getUnreadMsgCnt(String memberNickname) {
		// hyekojin
		return dao.selectUnreadCnt(memberNickname);
	}

	public MemberVO selectOneMember3(MemberVO m) {
		// TODO Auto-generated method stub
		MemberVO lm =  dao.selectOneMember3(m);
		return lm;
	}


	public MemberDataVO selectOneMember2(MemberDataVO mdv) {
		return dao.selectOneMember2(mdv);
	}

	
	public int updateMemberLevel(MemberVO member) {
		return dao.updateMemberLevel(member);
	}

	public int updateMemberLevel2(MemberVO member) {
		return dao.updateMemberLevel2(member);
	}

	public MemberVO selectOneMember4(MemberVO member) {
		return dao.selectOneMember4(member);
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

	public int joinMember(MemberVO m) {
		return dao.joinMember(m);
	}

	public int changeForgottenPw(MemberVO m) {
		return dao.changeForgottenPw(m);
	}

	public int welcomeCoupon(int memberNo) {
		return dao.welcomeCoupon(memberNo);
	}
	public ArrayList<CouponJoinCouponIssuedVO> selectAllCoupon(int memberNo) {	
		return (ArrayList<CouponJoinCouponIssuedVO>)dao.couponMoalOpen(memberNo);
	}

	public ArrayList<CouponJoinCouponIssuedVO> selectAllCoupon(SellJoinOthersVO sjo) {
		return (ArrayList<CouponJoinCouponIssuedVO>)dao.selectAllCoupon(sjo);
	}



}

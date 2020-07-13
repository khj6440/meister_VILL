package kr.or.meister.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.chat.model.vo.ChatVO;
import kr.or.meister.coupon.model.vo.CouponJoinCouponIssuedVO;
import kr.or.meister.coupon.model.vo.CouponVO;
import kr.or.meister.member.model.vo.CareerVO;
import kr.or.meister.member.model.vo.LicenseVO;
import kr.or.meister.member.model.vo.MemberCookieVO;
import kr.or.meister.member.model.vo.MemberDataVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.message.model.vo.MessageVO;
import kr.or.meister.orders.model.vo.OrdersVO;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;
import kr.or.meister.sell.model.vo.SellVO;

@Repository("memberDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberVO selectOneMember(MemberVO m) {
		// hyeokjin
		MemberVO lm = sqlSession.selectOne("member.selectOneMember", m);
		return lm;
	}

	public List selectAllChat(MemberVO m) {
		// hyeokjin
		return sqlSession.selectList("chat.selectAllChat", m);
	}

	public List showChat(HashMap<String, String> map) {
		// hyeokjin
		return sqlSession.selectList("chat.showChat", map);
	}

	public int insertChat(ChatVO newChat) {
		// hyeokjin
		return sqlSession.insert("chat.insertChat", newChat);
	}

	public List getMessage(String memberNickname) {
		// hyeokjin
		return sqlSession.selectList("message.getMessage", memberNickname);
	}

	public int insertMessage(MessageVO newMsg) {
		// hyeokJin
		return sqlSession.insert("message.insertMessage", newMsg);
	}

	public int selectUnreadCnt(String target) {
		// hyeokjin
		return sqlSession.selectOne("message.selectUnreadCnt", target);
	}

	public MemberVO selectOneMember3(MemberVO m) {
		// TODO Auto-generated method stub
		MemberVO lm = sqlSession.selectOne("member.selectOneMember3", m);
		return lm;
	}

	

	public int updateMemberLevel(MemberVO member) {
		return sqlSession.update("member.updateMemberLevel", member);
	}

	public int updateMemberLevel2(MemberVO member) {
		return sqlSession.update("member.updateMemberLevel2", member);
	}

	public MemberVO selectOneMember4(MemberVO member) {
		return sqlSession.selectOne("member.selectOneMember4", member);
	}

	public MemberVO selectLoginMember(MemberVO m) {
		MemberVO lm = sqlSession.selectOne("member.selectLoginMember", m);
		return lm;
	}

	public String findEmail(MemberVO m) {
		String memberEmail = sqlSession.selectOne("member.findEmail", m);
		return memberEmail;
	}

	public MemberVO checkLoginEmail(String memberEmail) {
		return sqlSession.selectOne("member.checkLoginEmail", memberEmail);
	}

	public int loginMaintain(MemberCookieVO mcookie) {
		return sqlSession.insert("member.loginMaintain", mcookie);
	}

	public MemberVO checkNickname(String memberNickname) {
		return sqlSession.selectOne("member.checkNickname", memberNickname);
	}

	public List selectAllEmploy(HashMap<String, Integer> map) {
		return sqlSession.selectList("employ.selectAllEmploy", map);
	}

	public int totalCountEmploy(int memberNo) {
		return sqlSession.selectOne("employ.totalCountEmploy", memberNo);
	}

	public int totalCountRequest(String memberNickname) {
		return sqlSession.selectOne("request.totalCountRequest", memberNickname);
	}

	public List selectAllRequest(HashMap<String, Object> map) {
		return sqlSession.selectList("request.selectAllRequest", map);
	}

	public int insertChatFile(HashMap<String, String> map) {
		//hyeokjin
		return sqlSession.insert("chat.insertChatFile",map);
	}

	public int readMsg(int msgNo) {
		//hyeokjin
		return sqlSession.update("message.readMsg",msgNo);
	}

	public int joinMember(MemberVO m) {
		return sqlSession.insert("member.joinMember",m);
	}

	public int changeForgottenPw(MemberVO m) {
		return sqlSession.update("member.changeForgottenPw",m);
	}

	public int welcomeCoupon(int memberNo) {
		return sqlSession.insert("member.welcomeCoupon",memberNo);
	}

	public List couponMoalOpen(int memberNo) {
		return sqlSession.selectList("member.couponList", memberNo);
				
	}
	public List selectAllCoupon(SellJoinOthersVO sjo) {
		return sqlSession.selectList("member.selectAvailableCoupon",sjo);
	}

	public int totalCountSell(int memberNo) {
		return sqlSession.selectOne("sell.selectTotalSell", memberNo);
	}
	public List selectAllSell(HashMap<String, Integer> map) {
		return sqlSession.selectList("sell.selectAllSell", map);
	}

	public int totalCountPick(int memberNo) {
		return sqlSession.selectOne("sell.totalCountPick",memberNo);
	}

	public List selectAllPick(HashMap<String, Integer> map) {
		return sqlSession.selectList("sell.selectAllPick",map);
	}

	public int totalCountRequestRe(int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo",memberNo);
		map.put("str1",memberNo+"/");
		map.put("str2","/"+memberNo+"/");
		return sqlSession.selectOne("request.totalCountRequestRe",map);
	}

	public List selectAllRequestRe(HashMap<String, Object> map) {
		return sqlSession.selectList("request.selectAllRequestRe",map);
	}


	public List<OrdersVO> selectAllOrder(int memberNo, int purchase) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo",memberNo);
		map.put("purchase",purchase);
		return sqlSession.selectList("sell.selectAllOrder",map);
	}
	
	public SellVO selectOneOfSell(int sell_no) {
		return sqlSession.selectOne("sell.selectOneOfSell",sell_no);
	}
	
	public int updateProfileMember(MemberVO member2) {
		return sqlSession.update("member.updateProfileMember",member2);
	}

	public int updateProfileCareer(CareerVO member3) {
		return sqlSession.update("member.updateProfileCareer",member3);
	}

	public int updateProfileLicense(LicenseVO member4) {
		return sqlSession.update("member.updateProfileLicense",member4);
	}

	public MemberVO selectOneMember2(int memberNo) {
		return sqlSession.selectOne("member.selectOneMember2", memberNo);
	}
	
	public CareerVO selectOneCareer(int memberNo) {
		return sqlSession.selectOne("member.selectOneCareer",memberNo);
	}

	public LicenseVO selectOneLicense(int memberNo) {
		return sqlSession.selectOne("member.selectOneLicense",memberNo);
	}

	public List selectAllSell2(HashMap<String, String> map) {
		return sqlSession.selectList("sell.selectAllSell2", map);
	}
	
	
	
	
	

}

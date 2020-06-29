package kr.or.meister.admin.model.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.admin.model.vo.AdminMemberJoinSellJoinOrdersVO;
import kr.or.meister.admin.model.vo.MemberJoinReportVO;
import kr.or.meister.admin.model.vo.MemberJoinVO;
import kr.or.meister.admin.model.vo.MemberStatsVO;
import kr.or.meister.admin.model.vo.RequestSellVO;
import kr.or.meister.admin.model.vo.SellSellVO;
import kr.or.meister.admin.model.vo.SellJoinOrdersJoinOptionVO;
import kr.or.meister.member.model.vo.MemberVO;





@Repository("adminDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MemberJoinReportVO> selectAllMember() {
		return sqlSession.selectList("memberJoinReport.selectAllMember");
	}

	public MemberJoinVO memberOneView(int memberNo) {
		return sqlSession.selectOne("memberJoin.memberOneView",memberNo);
	}

	public int totalCount() {
		return sqlSession.selectOne("totalCount");
	}

	public List<MemberVO> selectList(HashMap<String, Integer> se) {
		return sqlSession.selectList("adminMember.selectList",se);
	}

	public MemberVO memberLogin(HashMap<String, String> login) {
		return sqlSession.selectOne("adminMember.memberLogin",login);
	}

	public List<AdminMemberJoinSellJoinOrdersVO> memberSell(int memberNo) {
		return sqlSession.selectList("joinSellJoinOrders.memberSell",memberNo);
	}

	public List<SellJoinOrdersJoinOptionVO> memberOrder(int memberNo) {
		return sqlSession.selectList("sellJoinOrdersJoinOption.memberOrder",memberNo);
	}

/*-----------------------------------member 통계------------------------------------------ */
	public int cnt() {
		return sqlSession.selectOne("adminMember.cnt");
	}
	
	public int level0Cnt() {
		return sqlSession.selectOne("adminMember.level0Cnt");
	}
	
	public int level1Cnt() {
		return sqlSession.selectOne("adminMember.level1Cnt");
	}
	
	public int level2Cnt() {
		return sqlSession.selectOne("adminMember.level2Cnt");
	}
/*--------------------------------------------------------------------------------------------*/
	
	
	
/*-----------------------------------sell 통계------------------------------------------ */	
	
	public int sCnt() {
		return sqlSession.selectOne("adminMember.sCnt");
	}
	
	public int rCnt() {
		return sqlSession.selectOne("adminMember.rCnt");
	}
	
	public int eCnt() {
		return sqlSession.selectOne("adminMember.eCnt");
	}
	
	public int sellCnt() {
		return sqlSession.selectOne("adminMember.sellCnt");
	}
	
	public int requestCnt() {
		return sqlSession.selectOne("adminMember.requestCnt");
	}
	
	public int employCnt() {
		return sqlSession.selectOne("adminMember.employCnt");
	}
	
	/*--------------------------------------------------------------------------------------------*/	
	
	public List<SellSellVO> sellSell() {
		return sqlSession.selectList("adminMember.sellSell");
	}
	
	public List<RequestSellVO> RequestSell() {
		return sqlSession.selectList("adminMember.requestSell");
	}
	
}
